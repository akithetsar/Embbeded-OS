//
// Created by os on 8/12/24.
//
#include "../h/abi.hpp"
#include "../h/MemoryAllocator.hpp"
#include "../h/proto_print.hpp"
#include "../h/TCB.hpp"
#include "../h/SysSemaphore.hpp"
#include "../h/IOSys.hpp"

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
        nullptr,
        reinterpret_cast<ABI::system_call>(SysSemaphore::sys_sem_trywait),
        reinterpret_cast<ABI::system_call>(TCB::sys_time_sleep),
        reinterpret_cast<ABI::system_call>(IOSys::sys_getc),
        reinterpret_cast<ABI::system_call>(IOSys::sys_putc)
};


void ABI::handleSupervisorTrap(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    uint64 sstatus = riscv::r_sstatus();
    uint64 sepc = riscv::r_sepc();


    uint64 scause = riscv::r_scause();


    if (scause == ECALL_FROM_U_MODE || scause == ECALL_FROM_S_MODE) {
        sstatus = riscv::r_sstatus();
        sepc = riscv::r_sepc() + 4;
        //System call
//        sepc += 4;
        handleEcallTrap(call_code, arg1, arg2, arg3, arg4);
        riscv::mc_sip(riscv::SIP_SSIP);
    } else if (scause == SOFTWARE_INTERRUPT) {
        //Timer
        handleTimerTrap();
        riscv::mc_sip(riscv::SIP_SSIP);


    } else if (scause == EXTERNAL_INTERRUPT) {
        //Console
//        handleConsoleTrap();
        console_handler();
    }
    else if(scause == ILLEGAL_INSTRUCTION){
        __putc('\n');
        __putc('i');
        __putc('l');
        __putc('l');
        __putc('\n');
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
    else if(call_code == ABI::SystemCallCode::GET_C){
        __getc();
    }
    else if(call_code == ABI::SystemCallCode::PUT_C){
        __putc(arg1);
    }
    else{
        system_call_table[call_code](arg1, arg2, arg3, arg4);
    }
}

void ABI::handleTimerTrap() {
//    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IOSys::oBuffer->is_empty()) {
//        char c = IOSys::oBuffer->dequeue();
//        *(volatile char *) CONSOLE_TX_DATA = c;
//    }

    TCB::timeSliceCounter++;
    TCB::sleepCountdown();
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
    if (plic_claim() == CONSOLE_IRQ) {
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IOSys::iBuffer->enqueue(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
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
    : "a0", "a1", "a2", "a3", "a4"
    );

    return to_ret;
}

