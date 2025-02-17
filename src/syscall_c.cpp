//
// Created by os on 8/10/24.
//
#include "../h/syscall_c.hpp"
#include "../h/abi.hpp"
#include "../h/TCB.hpp"


void *mem_alloc(size_t size) {
    if(size == 0) return nullptr;

    size_t totalSize = (size + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    return (void*) ABI::sys_ecall(ABI::MEM_ALLOC, totalSize);
}

int mem_free(void *ptr) {
    return (int) ABI::sys_ecall(ABI::MEM_FREE, (uint64) ptr);
}

int thread_create(TCB::thread_t *handle, TCB::Body start_routine, void *arg) {
    void *stack = nullptr;
    if(start_routine){
        stack = mem_alloc(DEFAULT_STACK_SIZE);
        if(stack == nullptr) return -1; //Failed to allocate stack for thread
    }
    return (int) ABI::sys_ecall(ABI::THREAD_CREATE, (uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack);
}

int thread_exit() {
    return (int)ABI::sys_ecall(ABI::THREAD_EXIT);
}

void thread_dispatch() {
    (void)ABI::sys_ecall(ABI::THREAD_DISPATCH);
}

char getc(){
    return (char)ABI::sys_ecall(ABI::GET_C);
}
void putc(char ch){
    (void)ABI::sys_ecall(ABI::PUT_C, ch);
}

int sem_open(sem_t *handle, unsigned int init) {
    return (int)ABI::sys_ecall(ABI::SEM_OPEN, (uint64)handle, (uint64)init);
}

int sem_close(sem_t handle) {
    return (int)ABI::sys_ecall(ABI::SEM_CLOSE, (uint64)handle);
}

int sem_wait(sem_t id) {
    return (int)ABI::sys_ecall(ABI::SEM_WAIT, (uint64)id);
}

int sem_signal(sem_t id) {
    return (int)ABI::sys_ecall(ABI::SEM_SIGNAL, (uint64)id);
}

int sem_timedwait(sem_t id, time_t timeout) {
    return 0;
}

int sem_trywait(sem_t id) {
    return (int)ABI::sys_ecall(ABI::SEM_TRYWAIT, (uint64)id);
}

int time_sleep(time_t sleep_time) {

    return (int)ABI::sys_ecall(ABI::TIME_SLEEP, (uint64)sleep_time);
}
