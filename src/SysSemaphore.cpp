//
// Created by os on 8/19/24.
//

#include "../h/SysSemaphore.hpp"


int SysSemaphore::sys_sem_open(SysSemaphore::sem_t *handle, unsigned int init) {
    sem_t new_sem = (sem_t)mem_alloc(sizeof(SysSemaphore));
    if(new_sem == nullptr) return -1; // Bad allocation
    new_sem->value = init;
    new_sem->waitingQueue.init();
    *handle = new_sem;
    return 0;
}

int SysSemaphore::sys_sem_close(SysSemaphore::sem_t handle) {
    if(handle == nullptr) return -1;
    TCB *next;
    while((next = handle->waitingQueue.get()) != nullptr){
        next->setSuspended(false);
        Scheduler::put(next);
    }
    if(mem_free(handle) < 0) return -2; //Improper de-allocation
    return 0;
}

int SysSemaphore::sys_sem_wait(SysSemaphore::sem_t id) {
    if(id == nullptr) return -1;
    if(--(id->value) < 0){
        TCB *running = TCB::running;
        id->waitingQueue.put(running);
        running->setSuspended(true);
        thread_dispatch();
        if(TCB::running->isSuspended()){
            return -2;
        }
    }
    return 0;
}

int SysSemaphore::sys_sem_signal(SysSemaphore::sem_t id) {
    if(id == nullptr) return -1;
    if(++(id->value) <= 1){
        // Wake up a waiting thread
        TCB* nextThread = id->waitingQueue.get();
        if (nextThread) {
            nextThread->setSuspended(false);
            Scheduler::put(nextThread);
        }
    }
    return 0;
}

int SysSemaphore::sys_sem_timedwait(SysSemaphore::sem_t id, time_t timeout) {
// Step 1: Check for invalid semaphore handle
    if (id == nullptr) return -1; //SEMDEAD
    uint64 limit = TCB::clock + timeout;
    // Step 2: Decrement semaphore value
    if (--(id->value) < 0) {
        // Step 3: Timeout logic
        TCB *running = TCB::running;
        running->setSuspended(true);
        id->waitingQueue.put(running);
        thread_dispatch();

        if(TCB::clock > limit){
            return -2; //TIMEOUT
        }
    }

    return 0;
}

int SysSemaphore::sys_sem_trywait(SysSemaphore::sem_t id) {
    // Check if the semaphore handle is valid
    if (id == nullptr) return -1;  // Error: invalid semaphore handle

    // If the semaphore value is greater than 0, it is available
    if (id->value > 0) {
        id->value--;  // Lock the semaphore by decrementing its value
        return 0;  // Success: semaphore was locked
    } else {
        return 1;  // SysSemaphore is already locked
    }
}


