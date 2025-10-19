// Created by os on 8/10/24.

#ifndef PROJECT_BASE_SYSCALL_C_HPP
#define PROJECT_BASE_SYSCALL_C_HPP

#include "../lib/hw.h"




void* mem_alloc(size_t size);
int mem_free(void* ptr);

class TCB;
typedef TCB *thread_t;
using Body = void (*)(void *);

int thread_create(thread_t *handle, Body start_routine, void *arg);
int thread_exit();
void thread_dispatch();

class SysSemaphore;
typedef SysSemaphore *sem_t;
int sem_open(sem_t *handle, unsigned int init = 1);
int sem_close (sem_t handle);
int sem_wait (sem_t id);
int sem_signal (sem_t id);
int sem_timedwait(sem_t id, time_t timeout);
int sem_trywait(sem_t id);


int time_sleep(time_t sleep_time);
char getc();
void putc(char);
#endif // PROJECT_BASE_SYSCALL_C_HPP