#ifndef PROJECT_BASE_SEMAPHORE_HPP
#define PROJECT_BASE_SEMAPHORE_HPP

#include "TCB.hpp"

// Error codes
#define SEMDEAD -1
#define TIMEOUT -2

class SysSemaphore {
public:

    static int sys_sem_open(SysSemaphore** handle, unsigned init);
    static int sys_sem_close(SysSemaphore* handle);
    static int sys_sem_wait(SysSemaphore* handle);
    static int sys_sem_signal(SysSemaphore* handle);


    static int sys_sem_timedwait(SysSemaphore* handle, time_t timeout);
    static int sys_sem_trywait(SysSemaphore* handle);


    explicit SysSemaphore(unsigned init = 1);
    ~SysSemaphore();


    void wait();
    void signal();
    int timedwait(time_t timeout);
    int trywait();

private:
    int value;
    bool is_destroyed;


    TCB* blocked_head;
    TCB* blocked_tail;


    struct TimedWaitInfo {
        TCB* tcb;
        time_t wake_time;
        TimedWaitInfo* next;
        TimedWaitInfo* prev;
    };

    TimedWaitInfo* timed_wait_head;
    TimedWaitInfo* timed_wait_tail;


    void enqueue_blocked(TCB* tcb);
    TCB* dequeue_blocked();
    bool is_queue_empty() const;


    void add_timed_wait(TCB* tcb, time_t timeout);
    void remove_timed_wait(TCB* tcb);
    void check_timeouts();
    void remove_from_blocked_queue(TCB* tcb);

    static void global_timeout_check();
    static SysSemaphore* semaphore_list_head;
    SysSemaphore* next_semaphore;
    SysSemaphore* prev_semaphore;

    void add_to_global_list();
    void remove_from_global_list();

public:

    static void handle_timer_tick();
};

#endif // PROJECT_BASE_SEMAPHORE_HPP