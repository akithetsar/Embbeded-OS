//
// Created by os on 8/13/24.
//
#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/abi.hpp"
#include "../h/Console.hpp"

TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
SleepQueue TCB::sleepingQueue;
uint64 TCB::clock = 0;
uint64 TCB::ID = 0;
//Align on 16 bytes: & (~0xFL)
TCB::TCB(TCB::Body body, void* arg, void* stack)
        : next(nullptr),
          prev(nullptr),
          body(body),
          arg(arg),
          stack(stack),
          context({(uint64) &threadWrapper, ((uint64)((char*)stack + DEFAULT_STACK_SIZE)) & (~0xFL)}),
          is_finished(false),
          is_suspended(false),
          is_asleep(false),
          timeSlice(DEFAULT_TIME_SLICE)
{
    this->id = ++TCB::ID;
}


int TCB::sys_thread_create(thread_t *handle, Body body, void* arg, void* stack) {
    *handle = new TCB(body, arg, stack);
    if(body) Scheduler::put(*handle);
    else TCB::running = *handle;
    if(*handle == nullptr) {
        return -2;
    }

    return 0;
}

int TCB::sys_thread_exit() {
    running->setFinished(true);
    if(mem_free(TCB::running->stack) < 0) return -1;
    TCB::yield();
    return 0;
}

void TCB::sys_thread_dispach() {
    TCB::dispatch();
}

void TCB::yield() {
    uint64 call_code = ABI::SystemCallCode::YIELD;
    __asm__ volatile (
            "mv a0, %[code]"
            :
            : [code] "r" (call_code)
    );
    __asm__ volatile ("ecall");
}

void TCB::dispatch() {
    TCB *old = running;
    if(!old->is_finished && !old->is_suspended && !old->is_asleep){
        Scheduler::put(old);
    }
    running = Scheduler::get();

    TCB::contextSwitch(&old->context, &running->context);

}


void TCB::threadWrapper() {
    if (running->body == (Body)&Console::outputThreadFunction) {
        running->body(running->arg);
    } else {
        riscv::popSppSpie();
        running->body(running->arg);
    }
    sys_thread_exit();
}

TCB::~TCB() {
    mem_free(stack);
}

int TCB::sys_time_sleep(time_t sleep_time) {
    if (sleep_time <= 0) return 0;

    TCB::running->setSleep(true);
    TCB::running->sleepTime = sleep_time;
    sleepingQueue.put(TCB::running);
    TCB::dispatch();
    return 0;
}

int TCB::sys_get_thread_id() {
    uint64 t = TCB::running->id;
    yield();
    return t;

}

void TCB::sleepCountdown() {
    TCB* current = sleepingQueue.head;

    while (current != nullptr) {
        current->sleepTime--;

        if (current->sleepTime <= 0) {
            current->setSleep(false);
            TCB* to_wake = current;
            current = current->next;

            sleepingQueue.remove(to_wake);
            Scheduler::put(to_wake);
        } else {
            current = current->next;
        }
    }
}


void SleepQueue::put(TCB* tcb) {
    if (tcb == nullptr) return;

    tcb->next = nullptr;
    tcb->prev = nullptr;

    if (head == nullptr) {
        head = tail = tcb;
    } else {
        tail->next = tcb;
        tcb->prev = tail;
        tail = tcb;
    }
}

void SleepQueue::remove(TCB* tcb) {
    if (tcb == nullptr) return;

    if (tcb->prev) {
        tcb->prev->next = tcb->next;
    } else {
        head = tcb->next;
    }

    if (tcb->next) {
        tcb->next->prev = tcb->prev;
    } else {
        tail = tcb->prev;
    }


    tcb->next = tcb->prev = nullptr;
}






