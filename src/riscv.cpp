//
// Created by os on 8/10/24.
//

#include "../h/riscv.hpp"
#include "../lib/console.h"

void riscv::popSppSpie(){
    riscv::mc_sstatus(riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    __asm__ volatile("sret");
}




