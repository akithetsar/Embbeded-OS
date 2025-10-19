//
// Created by os on 8/27/24.
//

#ifndef PROJECT_BASE_QUEUE_HPP
#define PROJECT_BASE_QUEUE_HPP
#include "TCB.hpp"
class Queue {
public:

    void init(){
        head = nullptr;
        tail = nullptr;
    }

    void put(TCB* tcb) {
        if (head == nullptr) {
            head = tail = tcb;
        } else {
            tail->next = tcb;
            tcb->prev = tail;
            tail = tcb;
        }
    }

    TCB* get() {
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

    TCB* peek(){
        return head;
    }
    bool isEmpty() const {
        return head == nullptr;
    }

    TCB* head = nullptr;
    TCB* tail = nullptr;
};
#endif //PROJECT_BASE_QUEUE_HPP
