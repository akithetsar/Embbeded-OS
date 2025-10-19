#ifndef PROJECT_BASE_CONSOLE_HPP
#define PROJECT_BASE_CONSOLE_HPP

#include "TCB.hpp"
#include "SysSemaphore.hpp"
#include "../lib/hw.h"

class Console {
public:
    static void initialize();
    static char sys_getc();
    static void sys_putc(char c);
    static void handleConsoleInterrupt();

    // Thread functions
    static void outputThreadFunction(void* arg);

    static void flush();
    static void cleanup();
    static bool isOutputEmpty();
    static TCB* outputThread;
private:
    static bool shutdownRequested;

    static const int INPUT_BUFFER_SIZE = 256;
    static const int OUTPUT_BUFFER_SIZE = 256;

    // Input buffer
    static char inputBuffer[INPUT_BUFFER_SIZE];
    static int inputFront;
    static int inputRear;

    // Output buffer
    static char outputBuffer[OUTPUT_BUFFER_SIZE];
    static int outputFront;
    static int outputRear;

    // Input buffer semaphores (bounded buffer pattern)
    static SysSemaphore* inputEmpty;    // Space available in input buffer
    static SysSemaphore* inputFull;     // Data available in input buffer
    static SysSemaphore* inputMutex;    // Mutual exclusion for input buffer

    // Output buffer semaphores (bounded buffer pattern)
    static SysSemaphore* outputEmpty;   // Space available in output buffer
    static SysSemaphore* outputFull;    // Data available in output buffer
    static SysSemaphore* outputMutex;   // Mutual exclusion for output buffer

    // Helper functions
    static void putInputChar(char c);
    static char getInputChar();
    static void putOutputChar(char c);
    static char getOutputChar();
    static bool isInputBufferEmpty();
    static bool isOutputBufferEmpty();
};

#endif