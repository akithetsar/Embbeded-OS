//
// Created by os on 8/9/24.
//



#include "../h/MemoryAllocator.hpp"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/MemoryAllocatorTest.hpp"
#include "../h/Console.hpp"

extern void userMain();

void userWrapper(void* a){
    userMain();
}


int main(){
    riscv::w_stvec((uint64)&supervisorTrap);

    MemoryAllocator::mem_construct();


    thread_t mainHandle, idleHandle, userHandle;
    thread_create(&idleHandle, &Scheduler::idle_thread_function, nullptr);
    Scheduler::idle_tcb = idleHandle;
    Console::initialize();
    thread_create(&mainHandle, nullptr, nullptr);

    thread_create(&userHandle, &userWrapper, nullptr);
    riscv::ms_sstatus(riscv::SSTATUS_SIE);

    while((!userHandle->isFinished())) {
        thread_dispatch();
    }

    Console::flush();
    Console::cleanup();
    // MemoryAllocator::deallocateEverything();

    return 0;
}