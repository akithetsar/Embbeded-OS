//
// Created by os on 8/12/24.
//
#include "../h/abi.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/proto_print.hpp"
#include "../h/TCB.hpp"
#include "../h/SysSemaphore.hpp"
#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/Console.hpp"

ABI::system_call ABI::system_call_table[NUMBER_OF_CODES] = {
        reinterpret_cast<ABI::system_call>(MemoryAllocator::sys_mem_alloc),
        reinterpret_cast<ABI::system_call>(MemoryAllocator::sys_mem_free),
        reinterpret_cast<ABI::system_call>(TCB::sys_thread_create),
        reinterpret_cast<ABI::system_call>(TCB::sys_thread_exit),
        reinterpret_cast<ABI::system_call>(TCB::sys_thread_dispach),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_open),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_close),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_wait),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_signal),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_timedwait),
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_trywait),
        reinterpret_cast<ABI::system_call>(TCB::sys_time_sleep),
        reinterpret_cast<ABI::system_call>(Console::sys_getc),
        reinterpret_cast<ABI::system_call>(Console::sys_putc),
};


void ABI::handleSupervisorTrap(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    uint64 sstatus = riscv::r_sstatus();
    uint64 sepc = riscv::r_sepc();
    uint64 scause = riscv::r_scause();

    //Delegate to
    if (scause == ECALL_FROM_U_MODE || scause == ECALL_FROM_S_MODE) {
        // sstatus = riscv::r_sstatus();
        sepc = riscv::r_sepc() + 4;

        handleEcallTrap(call_code, arg1, arg2, arg3, arg4);
        riscv::mc_sip(riscv::SIP_SSIP);
    } else if (scause == SOFTWARE_INTERRUPT) {
        //Timer
        handleTimerTrap();
        riscv::mc_sip(riscv::SIP_SSIP);


    } else if (scause == EXTERNAL_INTERRUPT) {
        //Console
        handleConsoleTrap();
        //console_handler();
    }
    else if(scause == ILLEGAL_INSTRUCTION){
        Console::sys_putc('\n');
        Console::sys_putc('i');
        Console::sys_putc('l');
        Console::sys_putc('l');
        Console::sys_putc('\n');
        Console::flush();
        for (int i = 0; i < 100000000; i++) {
                for (i=0; i<100000000; i++) {

                }
        }
        __asm__ volatile("li t0, 0x5555");
        __asm__ volatile("li t1, 0x100000");
        __asm__ volatile("sw t0, 0(t1)");
        return;
    }
    else {
        //unexpected
        //todo: put prints when printing is implemented
    }

    riscv::w_sepc(sepc);
    riscv::w_sstatus(sstatus);
}
void ABI::handleEcallTrap(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    if(call_code == ABI::SystemCallCode::YIELD) {
        uint64 sepc = riscv::r_sepc(); // sacuvamo sepc jer smo usli iz trapa kojem treba za sret
        uint64 sstatus = riscv::r_sstatus();
        TCB::timeSliceCounter = 0;
        TCB::dispatch(); // sepc ce se sacuvati na steku
        riscv::w_sstatus(sstatus);
        riscv::w_sepc(sepc); // vratimo sepc  pa se vratimo u trap pa sret vrati na dobro mesto prethodne niti
    }
    // else if(call_code == ABI::SystemCallCode::GET_C){
    //     __getc();
    // }
    // else if(call_code == ABI::SystemCallCode::PUT_C){
    //     __putc(arg1);
    // }
    else{
        system_call_table[call_code](arg1, arg2, arg3, arg4);
    }
}

void ABI::handleTimerTrap() {

    TCB::timeSliceCounter++;
    TCB::clock++;
    TCB::sleepCountdown();
    SysSemaphore::handle_timer_tick();
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
        uint64 sepc = riscv::r_sepc(); // sacuvamo sepc jer smo usli iz trapa kojem treba za sret
        uint64 sstatus = riscv::r_sstatus();

        TCB::timeSliceCounter = 0;
        TCB::dispatch(); // sepc ce se sacuvati na steku
        riscv::w_sstatus(sstatus);
        riscv::w_sepc(sepc); // vratimo sepc  pa se vratimo u trap pa sret vrati na dobro mesto prethodne niti
    }
}

void ABI::handleConsoleTrap() {
    int interrupt_id = plic_claim();

    if (interrupt_id == 10) { // Console interrupt
        Console::handleConsoleInterrupt();
    }

    plic_complete(interrupt_id);
}

uint64 ABI::sys_ecall(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    uint64 to_ret;

    __asm__ volatile (
            "mv a0, %[code]\n\t"  // Move call_code to a0
            "mv a1, %[arg1]\n\t"  // Move arg1 to a1
            "mv a2, %[arg2]\n\t"  // Move arg2 to a2
            "mv a3, %[arg3]\n\t"  // Move arg3 to a3
            "mv a4, %[arg4]\n\t"  // Move arg4 to a4
            "ecall\n\t"           // Perform the ecall
            "mv %[ret], a0"       // Move the result from a0 to to_ret
            : [ret] "=r" (to_ret)
    : [code] "r" (call_code),
    [arg1] "r" (arg1),
    [arg2] "r" (arg2),
    [arg3] "r" (arg3),
    [arg4] "r" (arg4)
    : "a0", "a1", "a2", "a3", "a4", "t1", "t2", "t3", "t4", "t5", "t6"
    );

    return to_ret;
}

