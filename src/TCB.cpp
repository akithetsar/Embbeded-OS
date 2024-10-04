//
// Created by os on 8/13/24.
//
#include "../h/TCB.hpp"
#include "../h/riscv.hpp"
#include "../h/abi.hpp"
#include "../h/IOSys.hpp"
TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
Queue TCB::sleepingQueue;
uint64 TCB::clock = 0;

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

}

int TCB::sys_thread_create(thread_t *handle, Body body, void* arg, void* stack) {
    *handle = new TCB(body, arg, stack);
    if(body) Scheduler::put(*handle);
    else TCB::running = *handle;
    if(*handle == nullptr) {
        return -2; // Failed to create object
    }

    return 0;
}

int TCB::sys_thread_exit() {
    running->setFinished(true);
    if(mem_free(TCB::running->stack) < 0) return -1; //Couldn't deallocate stack properly
    TCB::yield();
    return 0;
}

void TCB::sys_thread_dispach() {
    TCB::yield();
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

    riscv::popSppSpie();

    running->body(TCB::running->arg);
    sys_thread_exit();
}

TCB::~TCB() {
    mem_free(stack);
}

int TCB::sys_time_sleep(time_t sleep_time) {
    TCB::running->setSleep(true);
    TCB::running->sleepTime = sleep_time;
    sleepingQueue.put(TCB::running);
    TCB::sys_thread_dispach();
    return 0;
}

void TCB::sleepCountdown() {
    TCB *next = sleepingQueue.peek();
    while(next){
        next->sleepTime--;
        if(next->sleepTime <= 0){
            next->setSleep(false);
            TCB* to_wake = next;

            // Unlink the TCB from the sleepingQueue
            if (to_wake->prev) {
                to_wake->prev->next = to_wake->next;
            } else {
                sleepingQueue.head = to_wake->next; // if to_wake was the head
            }
            if (to_wake->next) {
                to_wake->next->prev = to_wake->prev;
            } else {
                sleepingQueue.tail = to_wake->prev; // if to_wake was the tail
            }

            next = to_wake->next; // Move to the next TCB in the list

            to_wake->next = to_wake->prev = nullptr; // Clean up links in the woken TCB
            Scheduler::put(to_wake); // Add the TCB to the ready queue
        } else{
            next = next->next;
        }
    }
}






