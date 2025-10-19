//
// Created by os on 8/13/24.
//


#include "../h/Scheduler.hpp"
#include "../h/TCB.hpp"
#include "../h/riscv.hpp"

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::idle_tcb = nullptr;

void Scheduler::put(TCB* tcb) {
    if (head == nullptr) {
        head = tail = tcb;
    } else {
        tail->next = tcb;
        tcb->prev = tail;
        tail = tcb;
    }
}

TCB* Scheduler::get() {

    while (head != nullptr && head->isSuspended()) {
        TCB* suspended = head;
        head = head->next;
        if (head != nullptr) {
            head->prev = nullptr;
        } else {
            tail = nullptr;
        }
        suspended->next = suspended->prev = nullptr;

    }

    if (head == nullptr && idle_tcb != nullptr) {
        return idle_tcb;
    }

    if (head == nullptr) return nullptr;

    TCB* tcb = head;
    head = head->next;
    if (head != nullptr) {
        head->prev = nullptr;
    } else {
        tail = nullptr;
    }

    tcb->next = tcb->prev = nullptr;
    return tcb;
}


void Scheduler::idle_thread_function(void*) {
    while (true){
        thread_dispatch();
    }
}

TCB *Scheduler::peek() {
    return head;
}


