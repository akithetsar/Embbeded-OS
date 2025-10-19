#include "../h/Console.hpp"
#include "../lib//hw.h"
#include "../h/riscv.hpp"
#include "../h/MemoryAllocator.hpp"

// Static member definitions
char Console::inputBuffer[INPUT_BUFFER_SIZE];
int Console::inputFront = 0;
int Console::inputRear = 0;

char Console::outputBuffer[OUTPUT_BUFFER_SIZE];
int Console::outputFront = 0;
int Console::outputRear = 0;

// Input buffer semaphores
SysSemaphore* Console::inputEmpty = nullptr;
SysSemaphore* Console::inputFull = nullptr;
SysSemaphore* Console::inputMutex = nullptr;

// Output buffer semaphores
SysSemaphore* Console::outputEmpty = nullptr;
SysSemaphore* Console::outputFull = nullptr;
SysSemaphore* Console::outputMutex = nullptr;

TCB* Console::outputThread = nullptr;
bool Console::shutdownRequested = false;

void Console::initialize() {
    // Initialize input buffer semaphores (bounded buffer pattern)
    SysSemaphore::sys_sem_open(&inputEmpty, INPUT_BUFFER_SIZE);  // Initially all space available
    SysSemaphore::sys_sem_open(&inputFull, 0);                  // Initially no data available
    SysSemaphore::sys_sem_open(&inputMutex, 1);                 // Mutual exclusion

    // Initialize output buffer semaphores (bounded buffer pattern)
    SysSemaphore::sys_sem_open(&outputEmpty, OUTPUT_BUFFER_SIZE); // Initially all space available
    SysSemaphore::sys_sem_open(&outputFull, 0);                  // Initially no data available
    SysSemaphore::sys_sem_open(&outputMutex, 1);                 // Mutual exclusion

    // Create output thread
    void* outputThreadStack = MemoryAllocator::sys_mem_alloc(DEFAULT_STACK_SIZE);
    TCB::sys_thread_create(&outputThread, outputThreadFunction, nullptr, outputThreadStack);
}

char Console::sys_getc() {
    // Consumer pattern for input buffer
    inputFull->wait();      // Wait for data to be available
    inputMutex->wait();     // Get exclusive access to buffer

    char result = inputBuffer[inputFront];
    inputFront = (inputFront + 1) % INPUT_BUFFER_SIZE;

    inputMutex->signal();   // Release exclusive access
    inputEmpty->signal();   // Signal that space is available

    return result;
}

void Console::sys_putc(char c) {
    // Producer pattern for output buffer
    outputEmpty->wait();    // Wait for space to be available
    outputMutex->wait();    // Get exclusive access to buffer

    outputBuffer[outputRear] = c;
    outputRear = (outputRear + 1) % OUTPUT_BUFFER_SIZE;

    outputMutex->signal();  // Release exclusive access
    outputFull->signal();   // Signal that data is available
}

void Console::handleConsoleInterrupt() {
    uint8 status = *((volatile uint8*)CONSOLE_STATUS);

    while (status & CONSOLE_RX_STATUS_BIT) {
        char c = *((volatile char*)CONSOLE_RX_DATA);

        // Producer pattern for input buffer (interrupt context)
        // We need to be careful in interrupt context - use try operations
        if (inputEmpty->trywait() == 0) {  // If space is available
            if (inputMutex->trywait() == 0) {  // If we can get mutex
                inputBuffer[inputRear] = c;
                inputRear = (inputRear + 1) % INPUT_BUFFER_SIZE;

                inputMutex->signal();
                inputFull->signal();
            } else {
                // Couldn't get mutex, release the empty semaphore
                inputEmpty->signal();
            }
        }
        // If buffer is full or mutex unavailable, character is dropped

        status = *((volatile uint8*)CONSOLE_STATUS);
    }
}

void Console::outputThreadFunction(void* arg) {
    while (!shutdownRequested) {
        // Consumer pattern for output buffer
        outputFull->wait();     // Wait for data to be available

        // Check shutdown again after waking up
        if (shutdownRequested && isOutputBufferEmpty()) {
            break;
        }

        outputMutex->wait();    // Get exclusive access to buffer

        char c = outputBuffer[outputFront];
        outputFront = (outputFront + 1) % OUTPUT_BUFFER_SIZE;
        outputMutex->signal();  // Release exclusive access
        outputEmpty->signal();  // Signal that space is available

        // Send character to hardware
        uint8 status;
        do {
            status = *((volatile uint8*)CONSOLE_STATUS);
        } while (!(status & CONSOLE_TX_STATUS_BIT));

        *((volatile char*)CONSOLE_TX_DATA) = c;


    }

    TCB::sys_thread_exit();
}

bool Console::isOutputEmpty() {
    bool empty;
    outputMutex->wait();
    empty = (outputFront == outputRear);  // Should be outputFront == outputRear
    outputMutex->signal();
    return empty;
}

void Console::flush() {
    // Wait until output buffer is empty
    while (!isOutputEmpty()) {
        TCB::yield();
    }

    // Give additional time for the last character to be transmitted
    for (int i = 0; i < 100; i++) {
        TCB::yield();
    }
}

void Console::cleanup() {
    shutdownRequested = true;

    // Wake up output thread if it's waiting
    if (outputFull) {
        outputFull->signal();
    }

    flush();
}

bool Console::isInputBufferEmpty() {
    bool empty;
    inputMutex->wait();
    empty = (inputFront == inputRear);
    inputMutex->signal();
    return empty;
}

bool Console::isOutputBufferEmpty() {
    bool empty;
    outputMutex->wait();
    empty = (outputFront == outputRear);
    outputMutex->signal();
    return empty;
}