.global _ZN5riscv8pushRegsEv
.type _ZN5riscv8pushRegsEv @function
_ZN5riscv8pushRegsEv:
    li a0, 0
    addi sp, sp, -256
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    li a0, 1
    ret


.global _ZN5riscv7popRegsEv
.type _ZN5riscv7popRegsEv @function
_ZN5riscv7popRegsEv:
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    addi sp, sp, 256
    ret


.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_ @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # a0 -> &old->context
    # a1 -> &runningContext->context

    sd ra, 0 * 8(a0) # &old->context + 0 = old->context.ra
    sd sp, 1 * 8(a0) # &old->context + 8 = old->context.sp

    ld ra, 0 * 8(a1) # &running->context + 0 = running->context.ra
    ld sp, 1 * 8(a1) # &running->context + 8 = running->context.sp
    ret