// Created by os on 8/13/24.

#ifndef PROJECT_BASE_TCB_HPP
#define PROJECT_BASE_TCB_HPP

#include "MemoryAllocator.hpp"
#include "Scheduler.hpp"
#include "proto_print.hpp"
class Queue;
class TCB {
public:
    using Body = void (*)(void *);
    typedef TCB *thread_t;

    static int sys_thread_create(thread_t *handle, Body body, void* arg, void* stack);
    static int sys_thread_exit();
    static void sys_thread_dispach();
    static int sys_time_sleep(time_t);


    static void sleepCountdown();
    void setFinished(bool finished) { TCB::is_finished = finished; }
    bool isFinished() const { return is_finished; }
    void setSuspended(bool suspension) { TCB::is_suspended = suspension; }
    bool isSuspended() const { return is_suspended; }
    void setSleep(bool asleep) { TCB::is_asleep = asleep; }
    bool isAsleep() const { return is_asleep; }
    uint64 getTimeSlice() { return timeSlice; }



    static void yield();
    static void dispatch();

    TCB* next;
    TCB* prev;
    static TCB *running;
    static uint64 timeSliceCounter;
    static time_t clock;
    ~TCB();


private:
    struct Context {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    void* arg;
    void *stack;
    Context context;
    bool is_finished;
    bool is_suspended;
    bool is_asleep;
    uint64 timeSlice;
    static Queue sleepingQueue;
    time_t sleepTime;
    TCB(Body body, void* arg, void* stack);
    static void contextSwitch(Context *oldContext, Context *runningContext);
    static void threadWrapper();
};
#include "Queue.hpp"

#endif // PROJECT_BASE_TCB_HPP