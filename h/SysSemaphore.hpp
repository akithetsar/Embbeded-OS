//
// Created by os on 8/19/24.
//

#ifndef PROJECT_BASE_SYSSEMAPHORE_HPP
#define PROJECT_BASE_SYSSEMAPHORE_HPP
#include "Queue.hpp"
#include "TCB.hpp"

class SysSemaphore {
public:

    typedef SysSemaphore* sem_t;
    SysSemaphore(int init = 1) : value(init) {}

    static int sys_sem_open(sem_t *handle, unsigned int init = 1);
    static int sys_sem_close (sem_t handle);
    static int sys_sem_wait (sem_t id);
    static int sys_sem_signal (sem_t id);
    static int sys_sem_timedwait(sem_t id, time_t timeout);
    static int sys_sem_trywait(sem_t id);



private:
    int value;
    Queue waitingQueue;
};
#endif //PROJECT_BASE_SYSSEMAPHORE_HPP
