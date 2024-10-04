//
// Created by os on 8/27/24.
//
#include "../h/syscall_cpp.hpp"
#include "../h/TCB.hpp"

void *operator new(size_t size) {
    return mem_alloc(size);
}

void *operator new[](size_t size) {
    return mem_alloc(size);
}

void operator delete(void *mem) {
    mem_free(mem);
}

void operator delete[](void *mem) {
    mem_free(mem);
}

Thread::Thread(void (*body)(void *), void *arg) : body(body), arg(arg) {}

Thread::~Thread() {
    if(myHandle->isFinished()){
        delete myHandle;
    }
}

int Thread::start() {
    return thread_create(&myHandle, &threadWrapper, this);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time_ms) {
    return time_sleep(time_ms);
}

void Thread::threadWrapper(void *arg) {
    Thread *thread = reinterpret_cast<Thread*>(arg);
    if(thread->body){
        thread->body(thread->arg);
    }
    else{
        thread->run();
    }
}

Thread::Thread() : body(nullptr), arg(nullptr) {}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

int Semaphore::timedWait(time_t time) {
    return sem_timedwait(myHandle, time);
}

int Semaphore::tryWait() {
    return sem_trywait(myHandle);
}

void PeriodicThread::terminate() {
    this->period = 0;
}

PeriodicThread::PeriodicThread(time_t period) : period(period){}

void PeriodicThread::run() {
    while(period > 0){
        time_sleep(period);
        periodicActivation();
    }
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}
