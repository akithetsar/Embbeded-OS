//
// Created by os on 8/13/24.
//

#ifndef PROJECT_BASE_SCHEDULER_HPP
#define PROJECT_BASE_SCHEDULER_HPP

#include "syscall_c.hpp"
#include "TCB.hpp"

class Scheduler {
public:
    // Add a coroutine to the queue
    static void put(TCB* ccb);

    // Get the next coroutine (FCFS scheduling)
    static TCB* get();

    static TCB* peek();

    // Clean up the queue and free memory
    static void cleanup();
    static void idle_thread_function(void*);
    static TCB* idle_tcb;

private:
    static TCB* head;
    static TCB* tail;
};





#endif //PROJECT_BASE_SCHEDULER_HPP
