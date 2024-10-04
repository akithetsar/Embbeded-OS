//
// Created by os on 8/9/24.
//

#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/riscv.hpp"
#include "../h/syscall_c.hpp"
#include "../h/proto_print.hpp"
#include "../h/TCB.hpp"
#include "../h/MemoryAllocatorTest.hpp"
#include "test/printing.hpp"
#include "../h/IOBuffer.hpp"
#include "../h/IOSys.hpp"
void userMain();
void userWrapper(void* a){

    userMain();
}

int main(){


    riscv::w_stvec((uint64)&supervisorTrap);


    MemoryAllocator::mem_construct();
//    IOSys::io_construct();

    thread_t mainHandle, userHandle, idleHandle;
    thread_create(&idleHandle, &Scheduler::idle_thread_function, 0);
    Scheduler::idle_tcb = idleHandle;
    thread_create(&mainHandle, nullptr, 0);
    thread_create(&userHandle, &userWrapper, 0);
    riscv::ms_sstatus(riscv::SSTATUS_SIE);

    while(!(userHandle->isFinished())) {
        thread_dispatch();

    }



    riscv::mc_sstatus(riscv::SSTATUS_SIE);

//    IOSys::io_destroy();

    return 0;
}