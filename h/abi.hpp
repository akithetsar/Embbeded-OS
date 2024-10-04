//
// Created by os on 8/11/24.
//

#ifndef PROJECT_BASE_ABI_HPP
#define PROJECT_BASE_ABI_HPP
#include "../lib/hw.h"
#include "../h/riscv.hpp"
#include "../lib/console.h"




class ABI {
public:

    static void handleSupervisorTrap(uint64, uint64, uint64, uint64, uint64);
    static void handleEcallTrap(uint64, uint64, uint64, uint64, uint64);
    static void handleTimerTrap();
    static void handleConsoleTrap();

    enum ExceptionCause : unsigned long {
        SOFTWARE_INTERRUPT = 0x8000000000000001UL, // BNT = 1, Vrednost = 1
        EXTERNAL_INTERRUPT = 0x8000000000000009UL, // BNT = 1, Vrednost = 9
        ILLEGAL_INSTRUCTION = 0x0000000000000002UL, // BNT = 0, Vrednost = 2
        MISALIGNED_LOAD = 0x0000000000000005UL,     // BNT = 0, Vrednost = 5
        MISALIGNED_STORE = 0x0000000000000007UL,    // BNT = 0, Vrednost = 7
        ECALL_FROM_U_MODE = 0x0000000000000008UL,   // BNT = 0, Vrednost = 8
        ECALL_FROM_S_MODE = 0x0000000000000009UL    // BNT = 0, Vrednost = 9
    };

    enum SystemCallCode {

        MEM_ALLOC,
        MEM_FREE,
        THREAD_CREATE,
        THREAD_EXIT,
        THREAD_DISPATCH,
        SEM_OPEN,
        SEM_CLOSE,
        SEM_WAIT,
        SEM_SIGNAL,
        SEM_TIMEDWAIT,
        SEM_TRYWAIT,
        TIME_SLEEP,
        GET_C,
        PUT_C,
        NUMBER_OF_CODES,
        YIELD,
        UNDEFINED_CODE = -1


    };

    static uint64 sys_ecall(uint64 call_code, uint64 arg1 = 0, uint64 arg2 = 0, uint64 arg3 = 0, uint64 arg4 = 0);

private:
    typedef uint64 (*system_call)(uint64, uint64, uint64, uint64);
    static system_call system_call_table[NUMBER_OF_CODES];




};

#endif //PROJECT_BASE_ABI_HPP
