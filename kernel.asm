
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	97013103          	ld	sp,-1680(sp) # 8000b970 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	48c060ef          	jal	ra,800064a8 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <supervisorTrap>:
.align 4
.global supervisorTrap
.type supervisorTrap @function
supervisorTrap:
    addi sp, sp, -256
    80001000:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00113423          	sd	ra,8(sp)
    80001008:	00213823          	sd	sp,16(sp)
    8000100c:	00313c23          	sd	gp,24(sp)
    80001010:	02413023          	sd	tp,32(sp)
    80001014:	02513423          	sd	t0,40(sp)
    80001018:	02613823          	sd	t1,48(sp)
    8000101c:	02713c23          	sd	t2,56(sp)
    80001020:	04813023          	sd	s0,64(sp)
    80001024:	04913423          	sd	s1,72(sp)
    80001028:	04b13c23          	sd	a1,88(sp)
    8000102c:	06c13023          	sd	a2,96(sp)
    80001030:	06d13423          	sd	a3,104(sp)
    80001034:	06e13823          	sd	a4,112(sp)
    80001038:	06f13c23          	sd	a5,120(sp)
    8000103c:	09013023          	sd	a6,128(sp)
    80001040:	09113423          	sd	a7,136(sp)
    80001044:	09213823          	sd	s2,144(sp)
    80001048:	09313c23          	sd	s3,152(sp)
    8000104c:	0b413023          	sd	s4,160(sp)
    80001050:	0b513423          	sd	s5,168(sp)
    80001054:	0b613823          	sd	s6,176(sp)
    80001058:	0b713c23          	sd	s7,184(sp)
    8000105c:	0d813023          	sd	s8,192(sp)
    80001060:	0d913423          	sd	s9,200(sp)
    80001064:	0da13823          	sd	s10,208(sp)
    80001068:	0db13c23          	sd	s11,216(sp)
    8000106c:	0fc13023          	sd	t3,224(sp)
    80001070:	0fd13423          	sd	t4,232(sp)
    80001074:	0fe13823          	sd	t5,240(sp)
    80001078:	0ff13c23          	sd	t6,248(sp)

    call _ZN3ABI20handleSupervisorTrapEmmmmm
    8000107c:	234050ef          	jal	ra,800062b0 <_ZN3ABI20handleSupervisorTrapEmmmmm>

    .irp index, 1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001080:	00813083          	ld	ra,8(sp)
    80001084:	01013103          	ld	sp,16(sp)
    80001088:	01813183          	ld	gp,24(sp)
    8000108c:	02013203          	ld	tp,32(sp)
    80001090:	02813283          	ld	t0,40(sp)
    80001094:	03013303          	ld	t1,48(sp)
    80001098:	03813383          	ld	t2,56(sp)
    8000109c:	04013403          	ld	s0,64(sp)
    800010a0:	04813483          	ld	s1,72(sp)
    800010a4:	05813583          	ld	a1,88(sp)
    800010a8:	06013603          	ld	a2,96(sp)
    800010ac:	06813683          	ld	a3,104(sp)
    800010b0:	07013703          	ld	a4,112(sp)
    800010b4:	07813783          	ld	a5,120(sp)
    800010b8:	08013803          	ld	a6,128(sp)
    800010bc:	08813883          	ld	a7,136(sp)
    800010c0:	09013903          	ld	s2,144(sp)
    800010c4:	09813983          	ld	s3,152(sp)
    800010c8:	0a013a03          	ld	s4,160(sp)
    800010cc:	0a813a83          	ld	s5,168(sp)
    800010d0:	0b013b03          	ld	s6,176(sp)
    800010d4:	0b813b83          	ld	s7,184(sp)
    800010d8:	0c013c03          	ld	s8,192(sp)
    800010dc:	0c813c83          	ld	s9,200(sp)
    800010e0:	0d013d03          	ld	s10,208(sp)
    800010e4:	0d813d83          	ld	s11,216(sp)
    800010e8:	0e013e03          	ld	t3,224(sp)
    800010ec:	0e813e83          	ld	t4,232(sp)
    800010f0:	0f013f03          	ld	t5,240(sp)
    800010f4:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    800010f8:	10010113          	addi	sp,sp,256
    800010fc:	10200073          	sret

0000000080001100 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001100:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001104:	00b29a63          	bne	t0,a1,80001118 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001108:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000110c:	fe029ae3          	bnez	t0,80001100 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001110:	00000513          	li	a0,0
    jr ra                  # Return.
    80001114:	00008067          	ret

0000000080001118 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001118:	00100513          	li	a0,1
    8000111c:	00008067          	ret

0000000080001120 <_ZN5riscv8pushRegsEv>:
.global _ZN5riscv8pushRegsEv
.type _ZN5riscv8pushRegsEv @function
_ZN5riscv8pushRegsEv:
    addi sp, sp, -256
    80001120:	f0010113          	addi	sp,sp,-256
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001124:	00113423          	sd	ra,8(sp)
    80001128:	00213823          	sd	sp,16(sp)
    8000112c:	00313c23          	sd	gp,24(sp)
    80001130:	02413023          	sd	tp,32(sp)
    80001134:	02513423          	sd	t0,40(sp)
    80001138:	02613823          	sd	t1,48(sp)
    8000113c:	02713c23          	sd	t2,56(sp)
    80001140:	04813023          	sd	s0,64(sp)
    80001144:	04913423          	sd	s1,72(sp)
    80001148:	04a13823          	sd	a0,80(sp)
    8000114c:	04b13c23          	sd	a1,88(sp)
    80001150:	06c13023          	sd	a2,96(sp)
    80001154:	06d13423          	sd	a3,104(sp)
    80001158:	06e13823          	sd	a4,112(sp)
    8000115c:	06f13c23          	sd	a5,120(sp)
    80001160:	09013023          	sd	a6,128(sp)
    80001164:	09113423          	sd	a7,136(sp)
    80001168:	09213823          	sd	s2,144(sp)
    8000116c:	09313c23          	sd	s3,152(sp)
    80001170:	0b413023          	sd	s4,160(sp)
    80001174:	0b513423          	sd	s5,168(sp)
    80001178:	0b613823          	sd	s6,176(sp)
    8000117c:	0b713c23          	sd	s7,184(sp)
    80001180:	0d813023          	sd	s8,192(sp)
    80001184:	0d913423          	sd	s9,200(sp)
    80001188:	0da13823          	sd	s10,208(sp)
    8000118c:	0db13c23          	sd	s11,216(sp)
    80001190:	0fc13023          	sd	t3,224(sp)
    80001194:	0fd13423          	sd	t4,232(sp)
    80001198:	0fe13823          	sd	t5,240(sp)
    8000119c:	0ff13c23          	sd	t6,248(sp)
    ret
    800011a0:	00008067          	ret

00000000800011a4 <_ZN5riscv7popRegsEv>:
.global _ZN5riscv7popRegsEv
.type _ZN5riscv7popRegsEv @function
_ZN5riscv7popRegsEv:
    .irp index, 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011a4:	00813083          	ld	ra,8(sp)
    800011a8:	01013103          	ld	sp,16(sp)
    800011ac:	01813183          	ld	gp,24(sp)
    800011b0:	02013203          	ld	tp,32(sp)
    800011b4:	02813283          	ld	t0,40(sp)
    800011b8:	03013303          	ld	t1,48(sp)
    800011bc:	03813383          	ld	t2,56(sp)
    800011c0:	04013403          	ld	s0,64(sp)
    800011c4:	04813483          	ld	s1,72(sp)
    800011c8:	05013503          	ld	a0,80(sp)
    800011cc:	05813583          	ld	a1,88(sp)
    800011d0:	06013603          	ld	a2,96(sp)
    800011d4:	06813683          	ld	a3,104(sp)
    800011d8:	07013703          	ld	a4,112(sp)
    800011dc:	07813783          	ld	a5,120(sp)
    800011e0:	08013803          	ld	a6,128(sp)
    800011e4:	08813883          	ld	a7,136(sp)
    800011e8:	09013903          	ld	s2,144(sp)
    800011ec:	09813983          	ld	s3,152(sp)
    800011f0:	0a013a03          	ld	s4,160(sp)
    800011f4:	0a813a83          	ld	s5,168(sp)
    800011f8:	0b013b03          	ld	s6,176(sp)
    800011fc:	0b813b83          	ld	s7,184(sp)
    80001200:	0c013c03          	ld	s8,192(sp)
    80001204:	0c813c83          	ld	s9,200(sp)
    80001208:	0d013d03          	ld	s10,208(sp)
    8000120c:	0d813d83          	ld	s11,216(sp)
    80001210:	0e013e03          	ld	t3,224(sp)
    80001214:	0e813e83          	ld	t4,232(sp)
    80001218:	0f013f03          	ld	t5,240(sp)
    8000121c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001220:	10010113          	addi	sp,sp,256
    ret
    80001224:	00008067          	ret

0000000080001228 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_ @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # a0 -> &old->context
    # a1 -> &runningContext->context

    sd ra, 0 * 8(a0) # &old->context + 0 = old->context.ra
    80001228:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0) # &old->context + 8 = old->context.sp
    8000122c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1) # &running->context + 0 = running->context.ra
    80001230:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1) # &running->context + 8 = running->context.sp
    80001234:	0085b103          	ld	sp,8(a1)
    80001238:	00008067          	ret

000000008000123c <_Z9mem_allocm>:
#include "../h/abi.hpp"
#include "../h/TCB.hpp"


void *mem_alloc(size_t size) {
    if(size == 0) return nullptr;
    8000123c:	04050263          	beqz	a0,80001280 <_Z9mem_allocm+0x44>
void *mem_alloc(size_t size) {
    80001240:	ff010113          	addi	sp,sp,-16
    80001244:	00113423          	sd	ra,8(sp)
    80001248:	00813023          	sd	s0,0(sp)
    8000124c:	01010413          	addi	s0,sp,16

    size_t totalSize = (size + MEM_BLOCK_SIZE - 1) & ~(MEM_BLOCK_SIZE - 1);
    80001250:	03f50513          	addi	a0,a0,63
    return (void*) ABI::sys_ecall(ABI::MEM_ALLOC, totalSize);
    80001254:	00000713          	li	a4,0
    80001258:	00000693          	li	a3,0
    8000125c:	00000613          	li	a2,0
    80001260:	fc057593          	andi	a1,a0,-64
    80001264:	00000513          	li	a0,0
    80001268:	00005097          	auipc	ra,0x5
    8000126c:	1f4080e7          	jalr	500(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    80001270:	00813083          	ld	ra,8(sp)
    80001274:	00013403          	ld	s0,0(sp)
    80001278:	01010113          	addi	sp,sp,16
    8000127c:	00008067          	ret
    if(size == 0) return nullptr;
    80001280:	00000513          	li	a0,0
}
    80001284:	00008067          	ret

0000000080001288 <_Z8mem_freePv>:

int mem_free(void *ptr) {
    80001288:	ff010113          	addi	sp,sp,-16
    8000128c:	00113423          	sd	ra,8(sp)
    80001290:	00813023          	sd	s0,0(sp)
    80001294:	01010413          	addi	s0,sp,16
    80001298:	00050593          	mv	a1,a0
    return (int) ABI::sys_ecall(ABI::MEM_FREE, (uint64) ptr);
    8000129c:	00000713          	li	a4,0
    800012a0:	00000693          	li	a3,0
    800012a4:	00000613          	li	a2,0
    800012a8:	00100513          	li	a0,1
    800012ac:	00005097          	auipc	ra,0x5
    800012b0:	1b0080e7          	jalr	432(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800012b4:	0005051b          	sext.w	a0,a0
    800012b8:	00813083          	ld	ra,8(sp)
    800012bc:	00013403          	ld	s0,0(sp)
    800012c0:	01010113          	addi	sp,sp,16
    800012c4:	00008067          	ret

00000000800012c8 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(TCB::thread_t *handle, TCB::Body start_routine, void *arg) {
    800012c8:	fd010113          	addi	sp,sp,-48
    800012cc:	02113423          	sd	ra,40(sp)
    800012d0:	02813023          	sd	s0,32(sp)
    800012d4:	00913c23          	sd	s1,24(sp)
    800012d8:	01213823          	sd	s2,16(sp)
    800012dc:	01313423          	sd	s3,8(sp)
    800012e0:	03010413          	addi	s0,sp,48
    800012e4:	00050913          	mv	s2,a0
    800012e8:	00058493          	mv	s1,a1
    800012ec:	00060993          	mv	s3,a2
    void *stack = nullptr;
    if(start_routine){
    800012f0:	04058863          	beqz	a1,80001340 <_Z13thread_createPP3TCBPFvPvES2_+0x78>
        stack = mem_alloc(DEFAULT_STACK_SIZE);
    800012f4:	00001537          	lui	a0,0x1
    800012f8:	00000097          	auipc	ra,0x0
    800012fc:	f44080e7          	jalr	-188(ra) # 8000123c <_Z9mem_allocm>
    80001300:	00050713          	mv	a4,a0
        if(stack == nullptr) return -1; //Failed to allocate stack for thread
    80001304:	04050263          	beqz	a0,80001348 <_Z13thread_createPP3TCBPFvPvES2_+0x80>
    }
    return (int) ABI::sys_ecall(ABI::THREAD_CREATE, (uint64)handle, (uint64)start_routine, (uint64)arg, (uint64)stack);
    80001308:	00098693          	mv	a3,s3
    8000130c:	00048613          	mv	a2,s1
    80001310:	00090593          	mv	a1,s2
    80001314:	00200513          	li	a0,2
    80001318:	00005097          	auipc	ra,0x5
    8000131c:	144080e7          	jalr	324(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
    80001320:	0005051b          	sext.w	a0,a0
}
    80001324:	02813083          	ld	ra,40(sp)
    80001328:	02013403          	ld	s0,32(sp)
    8000132c:	01813483          	ld	s1,24(sp)
    80001330:	01013903          	ld	s2,16(sp)
    80001334:	00813983          	ld	s3,8(sp)
    80001338:	03010113          	addi	sp,sp,48
    8000133c:	00008067          	ret
    void *stack = nullptr;
    80001340:	00000713          	li	a4,0
    80001344:	fc5ff06f          	j	80001308 <_Z13thread_createPP3TCBPFvPvES2_+0x40>
        if(stack == nullptr) return -1; //Failed to allocate stack for thread
    80001348:	fff00513          	li	a0,-1
    8000134c:	fd9ff06f          	j	80001324 <_Z13thread_createPP3TCBPFvPvES2_+0x5c>

0000000080001350 <_Z11thread_exitv>:

int thread_exit() {
    80001350:	ff010113          	addi	sp,sp,-16
    80001354:	00113423          	sd	ra,8(sp)
    80001358:	00813023          	sd	s0,0(sp)
    8000135c:	01010413          	addi	s0,sp,16
    return (int)ABI::sys_ecall(ABI::THREAD_EXIT);
    80001360:	00000713          	li	a4,0
    80001364:	00000693          	li	a3,0
    80001368:	00000613          	li	a2,0
    8000136c:	00000593          	li	a1,0
    80001370:	00300513          	li	a0,3
    80001374:	00005097          	auipc	ra,0x5
    80001378:	0e8080e7          	jalr	232(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    8000137c:	0005051b          	sext.w	a0,a0
    80001380:	00813083          	ld	ra,8(sp)
    80001384:	00013403          	ld	s0,0(sp)
    80001388:	01010113          	addi	sp,sp,16
    8000138c:	00008067          	ret

0000000080001390 <_Z15thread_dispatchv>:

void thread_dispatch() {
    80001390:	ff010113          	addi	sp,sp,-16
    80001394:	00113423          	sd	ra,8(sp)
    80001398:	00813023          	sd	s0,0(sp)
    8000139c:	01010413          	addi	s0,sp,16
    (void)ABI::sys_ecall(ABI::THREAD_DISPATCH);
    800013a0:	00000713          	li	a4,0
    800013a4:	00000693          	li	a3,0
    800013a8:	00000613          	li	a2,0
    800013ac:	00000593          	li	a1,0
    800013b0:	00400513          	li	a0,4
    800013b4:	00005097          	auipc	ra,0x5
    800013b8:	0a8080e7          	jalr	168(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800013bc:	00813083          	ld	ra,8(sp)
    800013c0:	00013403          	ld	s0,0(sp)
    800013c4:	01010113          	addi	sp,sp,16
    800013c8:	00008067          	ret

00000000800013cc <_Z4getcv>:

char getc(){
    800013cc:	ff010113          	addi	sp,sp,-16
    800013d0:	00113423          	sd	ra,8(sp)
    800013d4:	00813023          	sd	s0,0(sp)
    800013d8:	01010413          	addi	s0,sp,16
    return (char)ABI::sys_ecall(ABI::GET_C);
    800013dc:	00000713          	li	a4,0
    800013e0:	00000693          	li	a3,0
    800013e4:	00000613          	li	a2,0
    800013e8:	00000593          	li	a1,0
    800013ec:	00c00513          	li	a0,12
    800013f0:	00005097          	auipc	ra,0x5
    800013f4:	06c080e7          	jalr	108(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800013f8:	0ff57513          	andi	a0,a0,255
    800013fc:	00813083          	ld	ra,8(sp)
    80001400:	00013403          	ld	s0,0(sp)
    80001404:	01010113          	addi	sp,sp,16
    80001408:	00008067          	ret

000000008000140c <_Z4putcc>:
void putc(char ch){
    8000140c:	ff010113          	addi	sp,sp,-16
    80001410:	00113423          	sd	ra,8(sp)
    80001414:	00813023          	sd	s0,0(sp)
    80001418:	01010413          	addi	s0,sp,16
    8000141c:	00050593          	mv	a1,a0
    (void)ABI::sys_ecall(ABI::PUT_C, ch);
    80001420:	00000713          	li	a4,0
    80001424:	00000693          	li	a3,0
    80001428:	00000613          	li	a2,0
    8000142c:	00d00513          	li	a0,13
    80001430:	00005097          	auipc	ra,0x5
    80001434:	02c080e7          	jalr	44(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    80001438:	00813083          	ld	ra,8(sp)
    8000143c:	00013403          	ld	s0,0(sp)
    80001440:	01010113          	addi	sp,sp,16
    80001444:	00008067          	ret

0000000080001448 <_Z8sem_openPP12SysSemaphorej>:

int sem_open(sem_t *handle, unsigned int init) {
    80001448:	ff010113          	addi	sp,sp,-16
    8000144c:	00113423          	sd	ra,8(sp)
    80001450:	00813023          	sd	s0,0(sp)
    80001454:	01010413          	addi	s0,sp,16
    return (int)ABI::sys_ecall(ABI::SEM_OPEN, (uint64)handle, (uint64)init);
    80001458:	00000713          	li	a4,0
    8000145c:	00000693          	li	a3,0
    80001460:	02059613          	slli	a2,a1,0x20
    80001464:	02065613          	srli	a2,a2,0x20
    80001468:	00050593          	mv	a1,a0
    8000146c:	00500513          	li	a0,5
    80001470:	00005097          	auipc	ra,0x5
    80001474:	fec080e7          	jalr	-20(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    80001478:	0005051b          	sext.w	a0,a0
    8000147c:	00813083          	ld	ra,8(sp)
    80001480:	00013403          	ld	s0,0(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z9sem_closeP12SysSemaphore>:

int sem_close(sem_t handle) {
    8000148c:	ff010113          	addi	sp,sp,-16
    80001490:	00113423          	sd	ra,8(sp)
    80001494:	00813023          	sd	s0,0(sp)
    80001498:	01010413          	addi	s0,sp,16
    8000149c:	00050593          	mv	a1,a0
    return (int)ABI::sys_ecall(ABI::SEM_CLOSE, (uint64)handle);
    800014a0:	00000713          	li	a4,0
    800014a4:	00000693          	li	a3,0
    800014a8:	00000613          	li	a2,0
    800014ac:	00600513          	li	a0,6
    800014b0:	00005097          	auipc	ra,0x5
    800014b4:	fac080e7          	jalr	-84(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800014b8:	0005051b          	sext.w	a0,a0
    800014bc:	00813083          	ld	ra,8(sp)
    800014c0:	00013403          	ld	s0,0(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_Z8sem_waitP12SysSemaphore>:

int sem_wait(sem_t id) {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00113423          	sd	ra,8(sp)
    800014d4:	00813023          	sd	s0,0(sp)
    800014d8:	01010413          	addi	s0,sp,16
    800014dc:	00050593          	mv	a1,a0
    return (int)ABI::sys_ecall(ABI::SEM_WAIT, (uint64)id);
    800014e0:	00000713          	li	a4,0
    800014e4:	00000693          	li	a3,0
    800014e8:	00000613          	li	a2,0
    800014ec:	00700513          	li	a0,7
    800014f0:	00005097          	auipc	ra,0x5
    800014f4:	f6c080e7          	jalr	-148(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800014f8:	0005051b          	sext.w	a0,a0
    800014fc:	00813083          	ld	ra,8(sp)
    80001500:	00013403          	ld	s0,0(sp)
    80001504:	01010113          	addi	sp,sp,16
    80001508:	00008067          	ret

000000008000150c <_Z10sem_signalP12SysSemaphore>:

int sem_signal(sem_t id) {
    8000150c:	ff010113          	addi	sp,sp,-16
    80001510:	00113423          	sd	ra,8(sp)
    80001514:	00813023          	sd	s0,0(sp)
    80001518:	01010413          	addi	s0,sp,16
    8000151c:	00050593          	mv	a1,a0
    return (int)ABI::sys_ecall(ABI::SEM_SIGNAL, (uint64)id);
    80001520:	00000713          	li	a4,0
    80001524:	00000693          	li	a3,0
    80001528:	00000613          	li	a2,0
    8000152c:	00800513          	li	a0,8
    80001530:	00005097          	auipc	ra,0x5
    80001534:	f2c080e7          	jalr	-212(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    80001538:	0005051b          	sext.w	a0,a0
    8000153c:	00813083          	ld	ra,8(sp)
    80001540:	00013403          	ld	s0,0(sp)
    80001544:	01010113          	addi	sp,sp,16
    80001548:	00008067          	ret

000000008000154c <_Z13sem_timedwaitP12SysSemaphorem>:

int sem_timedwait(sem_t id, time_t timeout) {
    8000154c:	ff010113          	addi	sp,sp,-16
    80001550:	00813423          	sd	s0,8(sp)
    80001554:	01010413          	addi	s0,sp,16
    return 0;
}
    80001558:	00000513          	li	a0,0
    8000155c:	00813403          	ld	s0,8(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret

0000000080001568 <_Z11sem_trywaitP12SysSemaphore>:

int sem_trywait(sem_t id) {
    80001568:	ff010113          	addi	sp,sp,-16
    8000156c:	00113423          	sd	ra,8(sp)
    80001570:	00813023          	sd	s0,0(sp)
    80001574:	01010413          	addi	s0,sp,16
    80001578:	00050593          	mv	a1,a0
    return (int)ABI::sys_ecall(ABI::SEM_TRYWAIT, (uint64)id);
    8000157c:	00000713          	li	a4,0
    80001580:	00000693          	li	a3,0
    80001584:	00000613          	li	a2,0
    80001588:	00a00513          	li	a0,10
    8000158c:	00005097          	auipc	ra,0x5
    80001590:	ed0080e7          	jalr	-304(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    80001594:	0005051b          	sext.w	a0,a0
    80001598:	00813083          	ld	ra,8(sp)
    8000159c:	00013403          	ld	s0,0(sp)
    800015a0:	01010113          	addi	sp,sp,16
    800015a4:	00008067          	ret

00000000800015a8 <_Z10time_sleepm>:

int time_sleep(time_t sleep_time) {
    800015a8:	ff010113          	addi	sp,sp,-16
    800015ac:	00113423          	sd	ra,8(sp)
    800015b0:	00813023          	sd	s0,0(sp)
    800015b4:	01010413          	addi	s0,sp,16
    800015b8:	00050593          	mv	a1,a0

    return (int)ABI::sys_ecall(ABI::TIME_SLEEP, (uint64)sleep_time);
    800015bc:	00000713          	li	a4,0
    800015c0:	00000693          	li	a3,0
    800015c4:	00000613          	li	a2,0
    800015c8:	00b00513          	li	a0,11
    800015cc:	00005097          	auipc	ra,0x5
    800015d0:	e90080e7          	jalr	-368(ra) # 8000645c <_ZN3ABI9sys_ecallEmmmmm>
}
    800015d4:	0005051b          	sext.w	a0,a0
    800015d8:	00813083          	ld	ra,8(sp)
    800015dc:	00013403          	ld	s0,0(sp)
    800015e0:	01010113          	addi	sp,sp,16
    800015e4:	00008067          	ret

00000000800015e8 <_ZN8IOBuffer4initEh>:
// Created by os on 8/29/24.
//
#include "../h/IOBuffer.hpp"


void IOBuffer::init(uint8 initial_capacity) {
    800015e8:	fe010113          	addi	sp,sp,-32
    800015ec:	00113c23          	sd	ra,24(sp)
    800015f0:	00813823          	sd	s0,16(sp)
    800015f4:	00913423          	sd	s1,8(sp)
    800015f8:	02010413          	addi	s0,sp,32
    800015fc:	00050493          	mv	s1,a0
    80001600:	00058513          	mv	a0,a1
    capacity = initial_capacity;
    80001604:	00b4b023          	sd	a1,0(s1)
    buffer = nullptr;
    80001608:	0004b423          	sd	zero,8(s1)
    head = 0;
    8000160c:	0004b823          	sd	zero,16(s1)
    tail = 0;
    80001610:	0004bc23          	sd	zero,24(s1)
    size = 0;
    80001614:	0204b023          	sd	zero,32(s1)
    buffer = reinterpret_cast<char*>(mem_alloc(capacity));
    80001618:	00000097          	auipc	ra,0x0
    8000161c:	c24080e7          	jalr	-988(ra) # 8000123c <_Z9mem_allocm>
    80001620:	00a4b423          	sd	a0,8(s1)
    sem_open(&availability, 0);
    80001624:	00000593          	li	a1,0
    80001628:	02848513          	addi	a0,s1,40
    8000162c:	00000097          	auipc	ra,0x0
    80001630:	e1c080e7          	jalr	-484(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
}
    80001634:	01813083          	ld	ra,24(sp)
    80001638:	01013403          	ld	s0,16(sp)
    8000163c:	00813483          	ld	s1,8(sp)
    80001640:	02010113          	addi	sp,sp,32
    80001644:	00008067          	ret

0000000080001648 <_ZN8IOBuffer7destroyEv>:
void IOBuffer::destroy() {
    80001648:	fe010113          	addi	sp,sp,-32
    8000164c:	00113c23          	sd	ra,24(sp)
    80001650:	00813823          	sd	s0,16(sp)
    80001654:	00913423          	sd	s1,8(sp)
    80001658:	02010413          	addi	s0,sp,32
    8000165c:	00050493          	mv	s1,a0
    if (buffer) {
    80001660:	00853503          	ld	a0,8(a0) # 1008 <_entry-0x7fffeff8>
    80001664:	00050663          	beqz	a0,80001670 <_ZN8IOBuffer7destroyEv+0x28>
        mem_free(buffer);
    80001668:	00000097          	auipc	ra,0x0
    8000166c:	c20080e7          	jalr	-992(ra) # 80001288 <_Z8mem_freePv>
    }
    sem_close(availability);
    80001670:	0284b503          	ld	a0,40(s1)
    80001674:	00000097          	auipc	ra,0x0
    80001678:	e18080e7          	jalr	-488(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
}
    8000167c:	01813083          	ld	ra,24(sp)
    80001680:	01013403          	ld	s0,16(sp)
    80001684:	00813483          	ld	s1,8(sp)
    80001688:	02010113          	addi	sp,sp,32
    8000168c:	00008067          	ret

0000000080001690 <_ZN8IOBuffer6resizeEm>:


void IOBuffer::resize(size_t new_capacity) {
    80001690:	fd010113          	addi	sp,sp,-48
    80001694:	02113423          	sd	ra,40(sp)
    80001698:	02813023          	sd	s0,32(sp)
    8000169c:	00913c23          	sd	s1,24(sp)
    800016a0:	01213823          	sd	s2,16(sp)
    800016a4:	01313423          	sd	s3,8(sp)
    800016a8:	03010413          	addi	s0,sp,48
    800016ac:	00050493          	mv	s1,a0
    800016b0:	00058993          	mv	s3,a1
    char* new_buffer = static_cast<char*>(mem_alloc(new_capacity));
    800016b4:	00058513          	mv	a0,a1
    800016b8:	00000097          	auipc	ra,0x0
    800016bc:	b84080e7          	jalr	-1148(ra) # 8000123c <_Z9mem_allocm>
    800016c0:	00050913          	mv	s2,a0

    // Copy data to the new buffer
    for (size_t i = 0; i < size; ++i) {
    800016c4:	00000713          	li	a4,0
    800016c8:	0204b783          	ld	a5,32(s1)
    800016cc:	02f77863          	bgeu	a4,a5,800016fc <_ZN8IOBuffer6resizeEm+0x6c>
        new_buffer[i] = buffer[(head + i) % capacity];
    800016d0:	0084b683          	ld	a3,8(s1)
    800016d4:	0104b783          	ld	a5,16(s1)
    800016d8:	00e787b3          	add	a5,a5,a4
    800016dc:	0004b603          	ld	a2,0(s1)
    800016e0:	02c7f7b3          	remu	a5,a5,a2
    800016e4:	00e90633          	add	a2,s2,a4
    800016e8:	00f687b3          	add	a5,a3,a5
    800016ec:	0007c783          	lbu	a5,0(a5)
    800016f0:	00f60023          	sb	a5,0(a2)
    for (size_t i = 0; i < size; ++i) {
    800016f4:	00170713          	addi	a4,a4,1
    800016f8:	fd1ff06f          	j	800016c8 <_ZN8IOBuffer6resizeEm+0x38>
    }

    // Free the old buffer
    mem_free(buffer);
    800016fc:	0084b503          	ld	a0,8(s1)
    80001700:	00000097          	auipc	ra,0x0
    80001704:	b88080e7          	jalr	-1144(ra) # 80001288 <_Z8mem_freePv>

    // Update pointers and capacity
    buffer = new_buffer;
    80001708:	0124b423          	sd	s2,8(s1)
    capacity = new_capacity;
    8000170c:	0134b023          	sd	s3,0(s1)
    head = 0;
    80001710:	0004b823          	sd	zero,16(s1)
    tail = size;  // New tail is at the end of the current data
    80001714:	0204b783          	ld	a5,32(s1)
    80001718:	00f4bc23          	sd	a5,24(s1)
}
    8000171c:	02813083          	ld	ra,40(sp)
    80001720:	02013403          	ld	s0,32(sp)
    80001724:	01813483          	ld	s1,24(sp)
    80001728:	01013903          	ld	s2,16(sp)
    8000172c:	00813983          	ld	s3,8(sp)
    80001730:	03010113          	addi	sp,sp,48
    80001734:	00008067          	ret

0000000080001738 <_ZN8IOBuffer7dequeueEv>:
    ++size;
    sem_signal(availability);

}

char IOBuffer::dequeue() {
    80001738:	fe010113          	addi	sp,sp,-32
    8000173c:	00113c23          	sd	ra,24(sp)
    80001740:	00813823          	sd	s0,16(sp)
    80001744:	00913423          	sd	s1,8(sp)
    80001748:	02010413          	addi	s0,sp,32
    8000174c:	00050493          	mv	s1,a0

    sem_wait(availability);
    80001750:	02853503          	ld	a0,40(a0)
    80001754:	00000097          	auipc	ra,0x0
    80001758:	d78080e7          	jalr	-648(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>
    char data = buffer[head];
    8000175c:	0084b703          	ld	a4,8(s1)
    80001760:	0104b783          	ld	a5,16(s1)
    80001764:	00f70733          	add	a4,a4,a5
    80001768:	00074503          	lbu	a0,0(a4)
    head = (head + 1) % capacity;
    8000176c:	00178793          	addi	a5,a5,1
    80001770:	0004b703          	ld	a4,0(s1)
    80001774:	02e7f7b3          	remu	a5,a5,a4
    80001778:	00f4b823          	sd	a5,16(s1)
    --size;
    8000177c:	0204b783          	ld	a5,32(s1)
    80001780:	fff78793          	addi	a5,a5,-1
    80001784:	02f4b023          	sd	a5,32(s1)

    return data;
}
    80001788:	01813083          	ld	ra,24(sp)
    8000178c:	01013403          	ld	s0,16(sp)
    80001790:	00813483          	ld	s1,8(sp)
    80001794:	02010113          	addi	sp,sp,32
    80001798:	00008067          	ret

000000008000179c <_ZNK8IOBuffer8is_emptyEv>:

bool IOBuffer::is_empty() const {
    8000179c:	ff010113          	addi	sp,sp,-16
    800017a0:	00813423          	sd	s0,8(sp)
    800017a4:	01010413          	addi	s0,sp,16
    return size == 0;
    800017a8:	02053503          	ld	a0,32(a0)
}
    800017ac:	00153513          	seqz	a0,a0
    800017b0:	00813403          	ld	s0,8(sp)
    800017b4:	01010113          	addi	sp,sp,16
    800017b8:	00008067          	ret

00000000800017bc <_ZNK8IOBuffer7is_fullEv>:

bool IOBuffer::is_full() const {
    800017bc:	ff010113          	addi	sp,sp,-16
    800017c0:	00813423          	sd	s0,8(sp)
    800017c4:	01010413          	addi	s0,sp,16
    return size == capacity;
    800017c8:	02053783          	ld	a5,32(a0)
    800017cc:	00053503          	ld	a0,0(a0)
    800017d0:	40f50533          	sub	a0,a0,a5
}
    800017d4:	00153513          	seqz	a0,a0
    800017d8:	00813403          	ld	s0,8(sp)
    800017dc:	01010113          	addi	sp,sp,16
    800017e0:	00008067          	ret

00000000800017e4 <_ZN8IOBuffer7enqueueEc>:
void IOBuffer::enqueue(char data) {
    800017e4:	fe010113          	addi	sp,sp,-32
    800017e8:	00113c23          	sd	ra,24(sp)
    800017ec:	00813823          	sd	s0,16(sp)
    800017f0:	00913423          	sd	s1,8(sp)
    800017f4:	01213023          	sd	s2,0(sp)
    800017f8:	02010413          	addi	s0,sp,32
    800017fc:	00050493          	mv	s1,a0
    80001800:	00058913          	mv	s2,a1
    if (is_full()) {
    80001804:	00000097          	auipc	ra,0x0
    80001808:	fb8080e7          	jalr	-72(ra) # 800017bc <_ZNK8IOBuffer7is_fullEv>
    8000180c:	04051c63          	bnez	a0,80001864 <_ZN8IOBuffer7enqueueEc+0x80>
    buffer[tail] = data;
    80001810:	0084b783          	ld	a5,8(s1)
    80001814:	0184b703          	ld	a4,24(s1)
    80001818:	00e787b3          	add	a5,a5,a4
    8000181c:	01278023          	sb	s2,0(a5)
    tail = (tail + 1) % capacity;
    80001820:	0184b783          	ld	a5,24(s1)
    80001824:	00178793          	addi	a5,a5,1
    80001828:	0004b703          	ld	a4,0(s1)
    8000182c:	02e7f7b3          	remu	a5,a5,a4
    80001830:	00f4bc23          	sd	a5,24(s1)
    ++size;
    80001834:	0204b783          	ld	a5,32(s1)
    80001838:	00178793          	addi	a5,a5,1
    8000183c:	02f4b023          	sd	a5,32(s1)
    sem_signal(availability);
    80001840:	0284b503          	ld	a0,40(s1)
    80001844:	00000097          	auipc	ra,0x0
    80001848:	cc8080e7          	jalr	-824(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
}
    8000184c:	01813083          	ld	ra,24(sp)
    80001850:	01013403          	ld	s0,16(sp)
    80001854:	00813483          	ld	s1,8(sp)
    80001858:	00013903          	ld	s2,0(sp)
    8000185c:	02010113          	addi	sp,sp,32
    80001860:	00008067          	ret
        resize(capacity * 2);
    80001864:	0004b583          	ld	a1,0(s1)
    80001868:	00159593          	slli	a1,a1,0x1
    8000186c:	00048513          	mv	a0,s1
    80001870:	00000097          	auipc	ra,0x0
    80001874:	e20080e7          	jalr	-480(ra) # 80001690 <_ZN8IOBuffer6resizeEm>
    80001878:	f99ff06f          	j	80001810 <_ZN8IOBuffer7enqueueEc+0x2c>

000000008000187c <_ZNK8IOBuffer8get_sizeEv>:

size_t IOBuffer::get_size() const {
    8000187c:	ff010113          	addi	sp,sp,-16
    80001880:	00813423          	sd	s0,8(sp)
    80001884:	01010413          	addi	s0,sp,16
    return size;
}
    80001888:	02053503          	ld	a0,32(a0)
    8000188c:	00813403          	ld	s0,8(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <_ZNK8IOBuffer12get_capacityEv>:

size_t IOBuffer::get_capacity() const {
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813423          	sd	s0,8(sp)
    800018a0:	01010413          	addi	s0,sp,16
    return capacity;
}
    800018a4:	00053503          	ld	a0,0(a0)
    800018a8:	00813403          	ld	s0,8(sp)
    800018ac:	01010113          	addi	sp,sp,16
    800018b0:	00008067          	ret

00000000800018b4 <_ZN12SysSemaphore12sys_sem_openEPPS_j>:
//

#include "../h/SysSemaphore.hpp"


int SysSemaphore::sys_sem_open(SysSemaphore::sem_t *handle, unsigned int init) {
    800018b4:	fe010113          	addi	sp,sp,-32
    800018b8:	00113c23          	sd	ra,24(sp)
    800018bc:	00813823          	sd	s0,16(sp)
    800018c0:	00913423          	sd	s1,8(sp)
    800018c4:	01213023          	sd	s2,0(sp)
    800018c8:	02010413          	addi	s0,sp,32
    800018cc:	00050493          	mv	s1,a0
    800018d0:	00058913          	mv	s2,a1
    sem_t new_sem = (sem_t)mem_alloc(sizeof(SysSemaphore));
    800018d4:	01800513          	li	a0,24
    800018d8:	00000097          	auipc	ra,0x0
    800018dc:	964080e7          	jalr	-1692(ra) # 8000123c <_Z9mem_allocm>
    if(new_sem == nullptr) return -1; // Bad allocation
    800018e0:	02050863          	beqz	a0,80001910 <_ZN12SysSemaphore12sys_sem_openEPPS_j+0x5c>
    new_sem->value = init;
    800018e4:	01252023          	sw	s2,0(a0)
#include "TCB.hpp"
class Queue {
public:

    void init(){
        head = nullptr;
    800018e8:	00053423          	sd	zero,8(a0)
        tail = nullptr;
    800018ec:	00053823          	sd	zero,16(a0)
    new_sem->waitingQueue.init();
    *handle = new_sem;
    800018f0:	00a4b023          	sd	a0,0(s1)
    return 0;
    800018f4:	00000513          	li	a0,0
}
    800018f8:	01813083          	ld	ra,24(sp)
    800018fc:	01013403          	ld	s0,16(sp)
    80001900:	00813483          	ld	s1,8(sp)
    80001904:	00013903          	ld	s2,0(sp)
    80001908:	02010113          	addi	sp,sp,32
    8000190c:	00008067          	ret
    if(new_sem == nullptr) return -1; // Bad allocation
    80001910:	fff00513          	li	a0,-1
    80001914:	fe5ff06f          	j	800018f8 <_ZN12SysSemaphore12sys_sem_openEPPS_j+0x44>

0000000080001918 <_ZN12SysSemaphore13sys_sem_closeEPS_>:

int SysSemaphore::sys_sem_close(SysSemaphore::sem_t handle) {
    80001918:	fe010113          	addi	sp,sp,-32
    8000191c:	00113c23          	sd	ra,24(sp)
    80001920:	00813823          	sd	s0,16(sp)
    80001924:	00913423          	sd	s1,8(sp)
    80001928:	02010413          	addi	s0,sp,32
    8000192c:	00050493          	mv	s1,a0
    if(handle == nullptr) return -1;
    80001930:	04051663          	bnez	a0,8000197c <_ZN12SysSemaphore13sys_sem_closeEPS_+0x64>
    80001934:	fff00513          	li	a0,-1
    80001938:	0180006f          	j	80001950 <_ZN12SysSemaphore13sys_sem_closeEPS_+0x38>
    TCB *next;
    while((next = handle->waitingQueue.get()) != nullptr){
        next->setSuspended(false);
        Scheduler::put(next);
    }
    if(mem_free(handle) < 0) return -2; //Improper de-allocation
    8000193c:	00048513          	mv	a0,s1
    80001940:	00000097          	auipc	ra,0x0
    80001944:	948080e7          	jalr	-1720(ra) # 80001288 <_Z8mem_freePv>
    80001948:	04054863          	bltz	a0,80001998 <_ZN12SysSemaphore13sys_sem_closeEPS_+0x80>
    return 0;
    8000194c:	00000513          	li	a0,0
}
    80001950:	01813083          	ld	ra,24(sp)
    80001954:	01013403          	ld	s0,16(sp)
    80001958:	00813483          	ld	s1,8(sp)
    8000195c:	02010113          	addi	sp,sp,32
    80001960:	00008067          	ret
        TCB* tcb = head;
        head = head->next;
        if (head != nullptr) {
            head->prev = nullptr;
        } else {
            tail = nullptr;
    80001964:	0004b823          	sd	zero,16(s1)
        }

        tcb->next = tcb->prev = nullptr;
    80001968:	00053423          	sd	zero,8(a0)
    8000196c:	00053023          	sd	zero,0(a0)


    static void sleepCountdown();
    void setFinished(bool finished) { TCB::is_finished = finished; }
    bool isFinished() const { return is_finished; }
    void setSuspended(bool suspension) { TCB::is_suspended = suspension; }
    80001970:	02050ca3          	sb	zero,57(a0)
        Scheduler::put(next);
    80001974:	00004097          	auipc	ra,0x4
    80001978:	930080e7          	jalr	-1744(ra) # 800052a4 <_ZN9Scheduler3putEP3TCB>
        if (head == nullptr) return nullptr;
    8000197c:	0084b503          	ld	a0,8(s1)
    80001980:	fa050ee3          	beqz	a0,8000193c <_ZN12SysSemaphore13sys_sem_closeEPS_+0x24>
        head = head->next;
    80001984:	00053783          	ld	a5,0(a0)
    80001988:	00f4b423          	sd	a5,8(s1)
        if (head != nullptr) {
    8000198c:	fc078ce3          	beqz	a5,80001964 <_ZN12SysSemaphore13sys_sem_closeEPS_+0x4c>
            head->prev = nullptr;
    80001990:	0007b423          	sd	zero,8(a5)
    80001994:	fd5ff06f          	j	80001968 <_ZN12SysSemaphore13sys_sem_closeEPS_+0x50>
    if(mem_free(handle) < 0) return -2; //Improper de-allocation
    80001998:	ffe00513          	li	a0,-2
    8000199c:	fb5ff06f          	j	80001950 <_ZN12SysSemaphore13sys_sem_closeEPS_+0x38>

00000000800019a0 <_ZN12SysSemaphore12sys_sem_waitEPS_>:

int SysSemaphore::sys_sem_wait(SysSemaphore::sem_t id) {
    if(id == nullptr) return -1;
    800019a0:	08050e63          	beqz	a0,80001a3c <_ZN12SysSemaphore12sys_sem_waitEPS_+0x9c>
    if(--(id->value) < 0){
    800019a4:	00052783          	lw	a5,0(a0)
    800019a8:	fff7879b          	addiw	a5,a5,-1
    800019ac:	00f52023          	sw	a5,0(a0)
    800019b0:	02079713          	slli	a4,a5,0x20
    800019b4:	00074663          	bltz	a4,800019c0 <_ZN12SysSemaphore12sys_sem_waitEPS_+0x20>
        thread_dispatch();
        if(TCB::running->isSuspended()){
            return -2;
        }
    }
    return 0;
    800019b8:	00000513          	li	a0,0
}
    800019bc:	00008067          	ret
int SysSemaphore::sys_sem_wait(SysSemaphore::sem_t id) {
    800019c0:	ff010113          	addi	sp,sp,-16
    800019c4:	00113423          	sd	ra,8(sp)
    800019c8:	00813023          	sd	s0,0(sp)
    800019cc:	01010413          	addi	s0,sp,16
        TCB *running = TCB::running;
    800019d0:	0000a797          	auipc	a5,0xa
    800019d4:	fc07b783          	ld	a5,-64(a5) # 8000b990 <_GLOBAL_OFFSET_TABLE_+0x58>
    800019d8:	0007b783          	ld	a5,0(a5)
        if (head == nullptr) {
    800019dc:	00853703          	ld	a4,8(a0)
    800019e0:	04070863          	beqz	a4,80001a30 <_ZN12SysSemaphore12sys_sem_waitEPS_+0x90>
            tail->next = tcb;
    800019e4:	01053703          	ld	a4,16(a0)
    800019e8:	00f73023          	sd	a5,0(a4)
            tcb->prev = tail;
    800019ec:	01053703          	ld	a4,16(a0)
    800019f0:	00e7b423          	sd	a4,8(a5)
            tail = tcb;
    800019f4:	00f53823          	sd	a5,16(a0)
    800019f8:	00100713          	li	a4,1
    800019fc:	02e78ca3          	sb	a4,57(a5)
        thread_dispatch();
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	990080e7          	jalr	-1648(ra) # 80001390 <_Z15thread_dispatchv>
        if(TCB::running->isSuspended()){
    80001a08:	0000a797          	auipc	a5,0xa
    80001a0c:	f887b783          	ld	a5,-120(a5) # 8000b990 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001a10:	0007b783          	ld	a5,0(a5)
    bool isSuspended() const { return is_suspended; }
    80001a14:	0397c783          	lbu	a5,57(a5)
    80001a18:	02079663          	bnez	a5,80001a44 <_ZN12SysSemaphore12sys_sem_waitEPS_+0xa4>
    return 0;
    80001a1c:	00000513          	li	a0,0
}
    80001a20:	00813083          	ld	ra,8(sp)
    80001a24:	00013403          	ld	s0,0(sp)
    80001a28:	01010113          	addi	sp,sp,16
    80001a2c:	00008067          	ret
            head = tail = tcb;
    80001a30:	00f53823          	sd	a5,16(a0)
    80001a34:	00f53423          	sd	a5,8(a0)
    80001a38:	fc1ff06f          	j	800019f8 <_ZN12SysSemaphore12sys_sem_waitEPS_+0x58>
    if(id == nullptr) return -1;
    80001a3c:	fff00513          	li	a0,-1
    80001a40:	00008067          	ret
            return -2;
    80001a44:	ffe00513          	li	a0,-2
    80001a48:	fd9ff06f          	j	80001a20 <_ZN12SysSemaphore12sys_sem_waitEPS_+0x80>

0000000080001a4c <_ZN12SysSemaphore14sys_sem_signalEPS_>:

int SysSemaphore::sys_sem_signal(SysSemaphore::sem_t id) {
    if(id == nullptr) return -1;
    80001a4c:	08050063          	beqz	a0,80001acc <_ZN12SysSemaphore14sys_sem_signalEPS_+0x80>
    80001a50:	00050793          	mv	a5,a0
    if(++(id->value) <= 1){
    80001a54:	00052703          	lw	a4,0(a0)
    80001a58:	0017071b          	addiw	a4,a4,1
    80001a5c:	0007069b          	sext.w	a3,a4
    80001a60:	00e52023          	sw	a4,0(a0)
    80001a64:	00100713          	li	a4,1
    80001a68:	00d75663          	bge	a4,a3,80001a74 <_ZN12SysSemaphore14sys_sem_signalEPS_+0x28>
        if (nextThread) {
            nextThread->setSuspended(false);
            Scheduler::put(nextThread);
        }
    }
    return 0;
    80001a6c:	00000513          	li	a0,0
    80001a70:	00008067          	ret
        if (head == nullptr) return nullptr;
    80001a74:	00853503          	ld	a0,8(a0)
    80001a78:	04050e63          	beqz	a0,80001ad4 <_ZN12SysSemaphore14sys_sem_signalEPS_+0x88>
int SysSemaphore::sys_sem_signal(SysSemaphore::sem_t id) {
    80001a7c:	ff010113          	addi	sp,sp,-16
    80001a80:	00113423          	sd	ra,8(sp)
    80001a84:	00813023          	sd	s0,0(sp)
    80001a88:	01010413          	addi	s0,sp,16
        head = head->next;
    80001a8c:	00053703          	ld	a4,0(a0)
    80001a90:	00e7b423          	sd	a4,8(a5)
        if (head != nullptr) {
    80001a94:	02070863          	beqz	a4,80001ac4 <_ZN12SysSemaphore14sys_sem_signalEPS_+0x78>
            head->prev = nullptr;
    80001a98:	00073423          	sd	zero,8(a4)
        tcb->next = tcb->prev = nullptr;
    80001a9c:	00053423          	sd	zero,8(a0)
    80001aa0:	00053023          	sd	zero,0(a0)
    void setSuspended(bool suspension) { TCB::is_suspended = suspension; }
    80001aa4:	02050ca3          	sb	zero,57(a0)
            Scheduler::put(nextThread);
    80001aa8:	00003097          	auipc	ra,0x3
    80001aac:	7fc080e7          	jalr	2044(ra) # 800052a4 <_ZN9Scheduler3putEP3TCB>
    return 0;
    80001ab0:	00000513          	li	a0,0
}
    80001ab4:	00813083          	ld	ra,8(sp)
    80001ab8:	00013403          	ld	s0,0(sp)
    80001abc:	01010113          	addi	sp,sp,16
    80001ac0:	00008067          	ret
            tail = nullptr;
    80001ac4:	0007b823          	sd	zero,16(a5)
    80001ac8:	fd5ff06f          	j	80001a9c <_ZN12SysSemaphore14sys_sem_signalEPS_+0x50>
    if(id == nullptr) return -1;
    80001acc:	fff00513          	li	a0,-1
    80001ad0:	00008067          	ret
    return 0;
    80001ad4:	00000513          	li	a0,0
}
    80001ad8:	00008067          	ret

0000000080001adc <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m>:

int SysSemaphore::sys_sem_timedwait(SysSemaphore::sem_t id, time_t timeout) {
// Step 1: Check for invalid semaphore handle
    if (id == nullptr) return -1; //SEMDEAD
    80001adc:	0a050863          	beqz	a0,80001b8c <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0xb0>
int SysSemaphore::sys_sem_timedwait(SysSemaphore::sem_t id, time_t timeout) {
    80001ae0:	fe010113          	addi	sp,sp,-32
    80001ae4:	00113c23          	sd	ra,24(sp)
    80001ae8:	00813823          	sd	s0,16(sp)
    80001aec:	00913423          	sd	s1,8(sp)
    80001af0:	02010413          	addi	s0,sp,32
    uint64 limit = TCB::clock + timeout;
    80001af4:	0000a797          	auipc	a5,0xa
    80001af8:	e6c7b783          	ld	a5,-404(a5) # 8000b960 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001afc:	0007b783          	ld	a5,0(a5)
    80001b00:	00b784b3          	add	s1,a5,a1
    // Step 2: Decrement semaphore value
    if (--(id->value) < 0) {
    80001b04:	00052783          	lw	a5,0(a0)
    80001b08:	fff7879b          	addiw	a5,a5,-1
    80001b0c:	00f52023          	sw	a5,0(a0)
    80001b10:	02079713          	slli	a4,a5,0x20
    80001b14:	00074e63          	bltz	a4,80001b30 <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0x54>
        if(TCB::clock > limit){
            return -2; //TIMEOUT
        }
    }

    return 0;
    80001b18:	00000513          	li	a0,0
}
    80001b1c:	01813083          	ld	ra,24(sp)
    80001b20:	01013403          	ld	s0,16(sp)
    80001b24:	00813483          	ld	s1,8(sp)
    80001b28:	02010113          	addi	sp,sp,32
    80001b2c:	00008067          	ret
        TCB *running = TCB::running;
    80001b30:	0000a797          	auipc	a5,0xa
    80001b34:	e607b783          	ld	a5,-416(a5) # 8000b990 <_GLOBAL_OFFSET_TABLE_+0x58>
    80001b38:	0007b783          	ld	a5,0(a5)
    80001b3c:	00100713          	li	a4,1
    80001b40:	02e78ca3          	sb	a4,57(a5)
        if (head == nullptr) {
    80001b44:	00853703          	ld	a4,8(a0)
    80001b48:	02070c63          	beqz	a4,80001b80 <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0xa4>
            tail->next = tcb;
    80001b4c:	01053703          	ld	a4,16(a0)
    80001b50:	00f73023          	sd	a5,0(a4)
            tcb->prev = tail;
    80001b54:	01053703          	ld	a4,16(a0)
    80001b58:	00e7b423          	sd	a4,8(a5)
            tail = tcb;
    80001b5c:	00f53823          	sd	a5,16(a0)
        thread_dispatch();
    80001b60:	00000097          	auipc	ra,0x0
    80001b64:	830080e7          	jalr	-2000(ra) # 80001390 <_Z15thread_dispatchv>
        if(TCB::clock > limit){
    80001b68:	0000a797          	auipc	a5,0xa
    80001b6c:	df87b783          	ld	a5,-520(a5) # 8000b960 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001b70:	0007b783          	ld	a5,0(a5)
    80001b74:	02f4e063          	bltu	s1,a5,80001b94 <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0xb8>
    return 0;
    80001b78:	00000513          	li	a0,0
    80001b7c:	fa1ff06f          	j	80001b1c <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0x40>
            head = tail = tcb;
    80001b80:	00f53823          	sd	a5,16(a0)
    80001b84:	00f53423          	sd	a5,8(a0)
    80001b88:	fd9ff06f          	j	80001b60 <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0x84>
    if (id == nullptr) return -1; //SEMDEAD
    80001b8c:	fff00513          	li	a0,-1
}
    80001b90:	00008067          	ret
            return -2; //TIMEOUT
    80001b94:	ffe00513          	li	a0,-2
    80001b98:	f85ff06f          	j	80001b1c <_ZN12SysSemaphore17sys_sem_timedwaitEPS_m+0x40>

0000000080001b9c <_ZN12SysSemaphore15sys_sem_trywaitEPS_>:

int SysSemaphore::sys_sem_trywait(SysSemaphore::sem_t id) {
    80001b9c:	ff010113          	addi	sp,sp,-16
    80001ba0:	00813423          	sd	s0,8(sp)
    80001ba4:	01010413          	addi	s0,sp,16
    // Check if the semaphore handle is valid
    if (id == nullptr) return -1;  // Error: invalid semaphore handle
    80001ba8:	02050263          	beqz	a0,80001bcc <_ZN12SysSemaphore15sys_sem_trywaitEPS_+0x30>

    // If the semaphore value is greater than 0, it is available
    if (id->value > 0) {
    80001bac:	00052783          	lw	a5,0(a0)
    80001bb0:	02f05263          	blez	a5,80001bd4 <_ZN12SysSemaphore15sys_sem_trywaitEPS_+0x38>
        id->value--;  // Lock the semaphore by decrementing its value
    80001bb4:	fff7879b          	addiw	a5,a5,-1
    80001bb8:	00f52023          	sw	a5,0(a0)
        return 0;  // Success: semaphore was locked
    80001bbc:	00000513          	li	a0,0
    } else {
        return 1;  // SysSemaphore is already locked
    }
}
    80001bc0:	00813403          	ld	s0,8(sp)
    80001bc4:	01010113          	addi	sp,sp,16
    80001bc8:	00008067          	ret
    if (id == nullptr) return -1;  // Error: invalid semaphore handle
    80001bcc:	fff00513          	li	a0,-1
    80001bd0:	ff1ff06f          	j	80001bc0 <_ZN12SysSemaphore15sys_sem_trywaitEPS_+0x24>
        return 1;  // SysSemaphore is already locked
    80001bd4:	00100513          	li	a0,1
    80001bd8:	fe9ff06f          	j	80001bc0 <_ZN12SysSemaphore15sys_sem_trywaitEPS_+0x24>

0000000080001bdc <_Z8userMainv>:
#include "test/ConsumerProducer_CPP_API_test.hpp"
#include "test/System_Mode_test.hpp"

#endif
#include "../h/IOSys.hpp"
void userMain() {
    80001bdc:	fe010113          	addi	sp,sp,-32
    80001be0:	00113c23          	sd	ra,24(sp)
    80001be4:	00813823          	sd	s0,16(sp)
    80001be8:	00913423          	sd	s1,8(sp)
    80001bec:	02010413          	addi	s0,sp,32

    printString("Unesite broj testa? [1-7]\n");
    80001bf0:	00007517          	auipc	a0,0x7
    80001bf4:	43050513          	addi	a0,a0,1072 # 80009020 <CONSOLE_STATUS+0x10>
    80001bf8:	00002097          	auipc	ra,0x2
    80001bfc:	5b0080e7          	jalr	1456(ra) # 800041a8 <_Z11printStringPKc>
    int test = getc() - '0';
    80001c00:	fffff097          	auipc	ra,0xfffff
    80001c04:	7cc080e7          	jalr	1996(ra) # 800013cc <_Z4getcv>
    80001c08:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80001c0c:	fffff097          	auipc	ra,0xfffff
    80001c10:	7c0080e7          	jalr	1984(ra) # 800013cc <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80001c14:	00700793          	li	a5,7
    80001c18:	1097e263          	bltu	a5,s1,80001d1c <_Z8userMainv+0x140>
    80001c1c:	00249493          	slli	s1,s1,0x2
    80001c20:	00007717          	auipc	a4,0x7
    80001c24:	65870713          	addi	a4,a4,1624 # 80009278 <CONSOLE_STATUS+0x268>
    80001c28:	00e484b3          	add	s1,s1,a4
    80001c2c:	0004a783          	lw	a5,0(s1)
    80001c30:	00e787b3          	add	a5,a5,a4
    80001c34:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80001c38:	00002097          	auipc	ra,0x2
    80001c3c:	be8080e7          	jalr	-1048(ra) # 80003820 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80001c40:	00007517          	auipc	a0,0x7
    80001c44:	40050513          	addi	a0,a0,1024 # 80009040 <CONSOLE_STATUS+0x30>
    80001c48:	00002097          	auipc	ra,0x2
    80001c4c:	560080e7          	jalr	1376(ra) # 800041a8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80001c50:	01813083          	ld	ra,24(sp)
    80001c54:	01013403          	ld	s0,16(sp)
    80001c58:	00813483          	ld	s1,8(sp)
    80001c5c:	02010113          	addi	sp,sp,32
    80001c60:	00008067          	ret
            Threads_CPP_API_test();
    80001c64:	00001097          	auipc	ra,0x1
    80001c68:	a9c080e7          	jalr	-1380(ra) # 80002700 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80001c6c:	00007517          	auipc	a0,0x7
    80001c70:	41450513          	addi	a0,a0,1044 # 80009080 <CONSOLE_STATUS+0x70>
    80001c74:	00002097          	auipc	ra,0x2
    80001c78:	534080e7          	jalr	1332(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001c7c:	fd5ff06f          	j	80001c50 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80001c80:	00000097          	auipc	ra,0x0
    80001c84:	2d4080e7          	jalr	724(ra) # 80001f54 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80001c88:	00007517          	auipc	a0,0x7
    80001c8c:	43850513          	addi	a0,a0,1080 # 800090c0 <CONSOLE_STATUS+0xb0>
    80001c90:	00002097          	auipc	ra,0x2
    80001c94:	518080e7          	jalr	1304(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001c98:	fb9ff06f          	j	80001c50 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80001c9c:	00002097          	auipc	ra,0x2
    80001ca0:	ec8080e7          	jalr	-312(ra) # 80003b64 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80001ca4:	00007517          	auipc	a0,0x7
    80001ca8:	46c50513          	addi	a0,a0,1132 # 80009110 <CONSOLE_STATUS+0x100>
    80001cac:	00002097          	auipc	ra,0x2
    80001cb0:	4fc080e7          	jalr	1276(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001cb4:	f9dff06f          	j	80001c50 <_Z8userMainv+0x74>
            testSleeping();
    80001cb8:	00003097          	auipc	ra,0x3
    80001cbc:	c5c080e7          	jalr	-932(ra) # 80004914 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80001cc0:	00007517          	auipc	a0,0x7
    80001cc4:	4a850513          	addi	a0,a0,1192 # 80009168 <CONSOLE_STATUS+0x158>
    80001cc8:	00002097          	auipc	ra,0x2
    80001ccc:	4e0080e7          	jalr	1248(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001cd0:	f81ff06f          	j	80001c50 <_Z8userMainv+0x74>
            testConsumerProducer();
    80001cd4:	00001097          	auipc	ra,0x1
    80001cd8:	eec080e7          	jalr	-276(ra) # 80002bc0 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80001cdc:	00007517          	auipc	a0,0x7
    80001ce0:	4bc50513          	addi	a0,a0,1212 # 80009198 <CONSOLE_STATUS+0x188>
    80001ce4:	00002097          	auipc	ra,0x2
    80001ce8:	4c4080e7          	jalr	1220(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001cec:	f65ff06f          	j	80001c50 <_Z8userMainv+0x74>
            System_Mode_test();
    80001cf0:	00003097          	auipc	ra,0x3
    80001cf4:	198080e7          	jalr	408(ra) # 80004e88 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80001cf8:	00007517          	auipc	a0,0x7
    80001cfc:	4e050513          	addi	a0,a0,1248 # 800091d8 <CONSOLE_STATUS+0x1c8>
    80001d00:	00002097          	auipc	ra,0x2
    80001d04:	4a8080e7          	jalr	1192(ra) # 800041a8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80001d08:	00007517          	auipc	a0,0x7
    80001d0c:	4f050513          	addi	a0,a0,1264 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80001d10:	00002097          	auipc	ra,0x2
    80001d14:	498080e7          	jalr	1176(ra) # 800041a8 <_Z11printStringPKc>
            break;
    80001d18:	f39ff06f          	j	80001c50 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80001d1c:	00007517          	auipc	a0,0x7
    80001d20:	53450513          	addi	a0,a0,1332 # 80009250 <CONSOLE_STATUS+0x240>
    80001d24:	00002097          	auipc	ra,0x2
    80001d28:	484080e7          	jalr	1156(ra) # 800041a8 <_Z11printStringPKc>
    80001d2c:	f25ff06f          	j	80001c50 <_Z8userMainv+0x74>

0000000080001d30 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80001d30:	fe010113          	addi	sp,sp,-32
    80001d34:	00113c23          	sd	ra,24(sp)
    80001d38:	00813823          	sd	s0,16(sp)
    80001d3c:	00913423          	sd	s1,8(sp)
    80001d40:	01213023          	sd	s2,0(sp)
    80001d44:	02010413          	addi	s0,sp,32
    80001d48:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80001d4c:	00000913          	li	s2,0
    80001d50:	00c0006f          	j	80001d5c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != '+') {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001d54:	fffff097          	auipc	ra,0xfffff
    80001d58:	63c080e7          	jalr	1596(ra) # 80001390 <_Z15thread_dispatchv>
    while ((key = getc()) != '+') {
    80001d5c:	fffff097          	auipc	ra,0xfffff
    80001d60:	670080e7          	jalr	1648(ra) # 800013cc <_Z4getcv>
    80001d64:	0005059b          	sext.w	a1,a0
    80001d68:	02b00793          	li	a5,43
    80001d6c:	02f58a63          	beq	a1,a5,80001da0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80001d70:	0084b503          	ld	a0,8(s1)
    80001d74:	00003097          	auipc	ra,0x3
    80001d78:	2ac080e7          	jalr	684(ra) # 80005020 <_ZN6Buffer3putEi>
        i++;
    80001d7c:	0019071b          	addiw	a4,s2,1
    80001d80:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001d84:	0004a683          	lw	a3,0(s1)
    80001d88:	0026979b          	slliw	a5,a3,0x2
    80001d8c:	00d787bb          	addw	a5,a5,a3
    80001d90:	0017979b          	slliw	a5,a5,0x1
    80001d94:	02f767bb          	remw	a5,a4,a5
    80001d98:	fc0792e3          	bnez	a5,80001d5c <_ZL16producerKeyboardPv+0x2c>
    80001d9c:	fb9ff06f          	j	80001d54 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80001da0:	00100793          	li	a5,1
    80001da4:	0000a717          	auipc	a4,0xa
    80001da8:	c2f72e23          	sw	a5,-964(a4) # 8000b9e0 <_ZL9threadEnd>
    data->buffer->put('!');
    80001dac:	02100593          	li	a1,33
    80001db0:	0084b503          	ld	a0,8(s1)
    80001db4:	00003097          	auipc	ra,0x3
    80001db8:	26c080e7          	jalr	620(ra) # 80005020 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80001dbc:	0104b503          	ld	a0,16(s1)
    80001dc0:	fffff097          	auipc	ra,0xfffff
    80001dc4:	74c080e7          	jalr	1868(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
}
    80001dc8:	01813083          	ld	ra,24(sp)
    80001dcc:	01013403          	ld	s0,16(sp)
    80001dd0:	00813483          	ld	s1,8(sp)
    80001dd4:	00013903          	ld	s2,0(sp)
    80001dd8:	02010113          	addi	sp,sp,32
    80001ddc:	00008067          	ret

0000000080001de0 <_ZL8producerPv>:

static void producer(void *arg) {
    80001de0:	fe010113          	addi	sp,sp,-32
    80001de4:	00113c23          	sd	ra,24(sp)
    80001de8:	00813823          	sd	s0,16(sp)
    80001dec:	00913423          	sd	s1,8(sp)
    80001df0:	01213023          	sd	s2,0(sp)
    80001df4:	02010413          	addi	s0,sp,32
    80001df8:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001dfc:	00000913          	li	s2,0
    80001e00:	00c0006f          	j	80001e0c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001e04:	fffff097          	auipc	ra,0xfffff
    80001e08:	58c080e7          	jalr	1420(ra) # 80001390 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80001e0c:	0000a797          	auipc	a5,0xa
    80001e10:	bd47a783          	lw	a5,-1068(a5) # 8000b9e0 <_ZL9threadEnd>
    80001e14:	02079e63          	bnez	a5,80001e50 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80001e18:	0004a583          	lw	a1,0(s1)
    80001e1c:	0305859b          	addiw	a1,a1,48
    80001e20:	0084b503          	ld	a0,8(s1)
    80001e24:	00003097          	auipc	ra,0x3
    80001e28:	1fc080e7          	jalr	508(ra) # 80005020 <_ZN6Buffer3putEi>
        i++;
    80001e2c:	0019071b          	addiw	a4,s2,1
    80001e30:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001e34:	0004a683          	lw	a3,0(s1)
    80001e38:	0026979b          	slliw	a5,a3,0x2
    80001e3c:	00d787bb          	addw	a5,a5,a3
    80001e40:	0017979b          	slliw	a5,a5,0x1
    80001e44:	02f767bb          	remw	a5,a4,a5
    80001e48:	fc0792e3          	bnez	a5,80001e0c <_ZL8producerPv+0x2c>
    80001e4c:	fb9ff06f          	j	80001e04 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80001e50:	0104b503          	ld	a0,16(s1)
    80001e54:	fffff097          	auipc	ra,0xfffff
    80001e58:	6b8080e7          	jalr	1720(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
}
    80001e5c:	01813083          	ld	ra,24(sp)
    80001e60:	01013403          	ld	s0,16(sp)
    80001e64:	00813483          	ld	s1,8(sp)
    80001e68:	00013903          	ld	s2,0(sp)
    80001e6c:	02010113          	addi	sp,sp,32
    80001e70:	00008067          	ret

0000000080001e74 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80001e74:	fd010113          	addi	sp,sp,-48
    80001e78:	02113423          	sd	ra,40(sp)
    80001e7c:	02813023          	sd	s0,32(sp)
    80001e80:	00913c23          	sd	s1,24(sp)
    80001e84:	01213823          	sd	s2,16(sp)
    80001e88:	01313423          	sd	s3,8(sp)
    80001e8c:	03010413          	addi	s0,sp,48
    80001e90:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001e94:	00000993          	li	s3,0
    80001e98:	01c0006f          	j	80001eb4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80001e9c:	fffff097          	auipc	ra,0xfffff
    80001ea0:	4f4080e7          	jalr	1268(ra) # 80001390 <_Z15thread_dispatchv>
    80001ea4:	0500006f          	j	80001ef4 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80001ea8:	00a00513          	li	a0,10
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	560080e7          	jalr	1376(ra) # 8000140c <_Z4putcc>
    while (!threadEnd) {
    80001eb4:	0000a797          	auipc	a5,0xa
    80001eb8:	b2c7a783          	lw	a5,-1236(a5) # 8000b9e0 <_ZL9threadEnd>
    80001ebc:	06079063          	bnez	a5,80001f1c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80001ec0:	00893503          	ld	a0,8(s2)
    80001ec4:	00003097          	auipc	ra,0x3
    80001ec8:	1ec080e7          	jalr	492(ra) # 800050b0 <_ZN6Buffer3getEv>
        i++;
    80001ecc:	0019849b          	addiw	s1,s3,1
    80001ed0:	0004899b          	sext.w	s3,s1
        putc(key);
    80001ed4:	0ff57513          	andi	a0,a0,255
    80001ed8:	fffff097          	auipc	ra,0xfffff
    80001edc:	534080e7          	jalr	1332(ra) # 8000140c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80001ee0:	00092703          	lw	a4,0(s2)
    80001ee4:	0027179b          	slliw	a5,a4,0x2
    80001ee8:	00e787bb          	addw	a5,a5,a4
    80001eec:	02f4e7bb          	remw	a5,s1,a5
    80001ef0:	fa0786e3          	beqz	a5,80001e9c <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80001ef4:	05000793          	li	a5,80
    80001ef8:	02f4e4bb          	remw	s1,s1,a5
    80001efc:	fa049ce3          	bnez	s1,80001eb4 <_ZL8consumerPv+0x40>
    80001f00:	fa9ff06f          	j	80001ea8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80001f04:	00893503          	ld	a0,8(s2)
    80001f08:	00003097          	auipc	ra,0x3
    80001f0c:	1a8080e7          	jalr	424(ra) # 800050b0 <_ZN6Buffer3getEv>
        putc(key);
    80001f10:	0ff57513          	andi	a0,a0,255
    80001f14:	fffff097          	auipc	ra,0xfffff
    80001f18:	4f8080e7          	jalr	1272(ra) # 8000140c <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80001f1c:	00893503          	ld	a0,8(s2)
    80001f20:	00003097          	auipc	ra,0x3
    80001f24:	21c080e7          	jalr	540(ra) # 8000513c <_ZN6Buffer6getCntEv>
    80001f28:	fca04ee3          	bgtz	a0,80001f04 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80001f2c:	01093503          	ld	a0,16(s2)
    80001f30:	fffff097          	auipc	ra,0xfffff
    80001f34:	5dc080e7          	jalr	1500(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
}
    80001f38:	02813083          	ld	ra,40(sp)
    80001f3c:	02013403          	ld	s0,32(sp)
    80001f40:	01813483          	ld	s1,24(sp)
    80001f44:	01013903          	ld	s2,16(sp)
    80001f48:	00813983          	ld	s3,8(sp)
    80001f4c:	03010113          	addi	sp,sp,48
    80001f50:	00008067          	ret

0000000080001f54 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80001f54:	f9010113          	addi	sp,sp,-112
    80001f58:	06113423          	sd	ra,104(sp)
    80001f5c:	06813023          	sd	s0,96(sp)
    80001f60:	04913c23          	sd	s1,88(sp)
    80001f64:	05213823          	sd	s2,80(sp)
    80001f68:	05313423          	sd	s3,72(sp)
    80001f6c:	05413023          	sd	s4,64(sp)
    80001f70:	03513c23          	sd	s5,56(sp)
    80001f74:	03613823          	sd	s6,48(sp)
    80001f78:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80001f7c:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80001f80:	00007517          	auipc	a0,0x7
    80001f84:	31850513          	addi	a0,a0,792 # 80009298 <CONSOLE_STATUS+0x288>
    80001f88:	00002097          	auipc	ra,0x2
    80001f8c:	220080e7          	jalr	544(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80001f90:	01e00593          	li	a1,30
    80001f94:	fa040493          	addi	s1,s0,-96
    80001f98:	00048513          	mv	a0,s1
    80001f9c:	00002097          	auipc	ra,0x2
    80001fa0:	294080e7          	jalr	660(ra) # 80004230 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80001fa4:	00048513          	mv	a0,s1
    80001fa8:	00002097          	auipc	ra,0x2
    80001fac:	360080e7          	jalr	864(ra) # 80004308 <_Z11stringToIntPKc>
    80001fb0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80001fb4:	00007517          	auipc	a0,0x7
    80001fb8:	30450513          	addi	a0,a0,772 # 800092b8 <CONSOLE_STATUS+0x2a8>
    80001fbc:	00002097          	auipc	ra,0x2
    80001fc0:	1ec080e7          	jalr	492(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80001fc4:	01e00593          	li	a1,30
    80001fc8:	00048513          	mv	a0,s1
    80001fcc:	00002097          	auipc	ra,0x2
    80001fd0:	264080e7          	jalr	612(ra) # 80004230 <_Z9getStringPci>
    n = stringToInt(input);
    80001fd4:	00048513          	mv	a0,s1
    80001fd8:	00002097          	auipc	ra,0x2
    80001fdc:	330080e7          	jalr	816(ra) # 80004308 <_Z11stringToIntPKc>
    80001fe0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80001fe4:	00007517          	auipc	a0,0x7
    80001fe8:	2f450513          	addi	a0,a0,756 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80001fec:	00002097          	auipc	ra,0x2
    80001ff0:	1bc080e7          	jalr	444(ra) # 800041a8 <_Z11printStringPKc>
    80001ff4:	00000613          	li	a2,0
    80001ff8:	00a00593          	li	a1,10
    80001ffc:	00090513          	mv	a0,s2
    80002000:	00002097          	auipc	ra,0x2
    80002004:	358080e7          	jalr	856(ra) # 80004358 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002008:	00007517          	auipc	a0,0x7
    8000200c:	2e850513          	addi	a0,a0,744 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80002010:	00002097          	auipc	ra,0x2
    80002014:	198080e7          	jalr	408(ra) # 800041a8 <_Z11printStringPKc>
    80002018:	00000613          	li	a2,0
    8000201c:	00a00593          	li	a1,10
    80002020:	00048513          	mv	a0,s1
    80002024:	00002097          	auipc	ra,0x2
    80002028:	334080e7          	jalr	820(ra) # 80004358 <_Z8printIntiii>
    printString(".\n");
    8000202c:	00007517          	auipc	a0,0x7
    80002030:	2dc50513          	addi	a0,a0,732 # 80009308 <CONSOLE_STATUS+0x2f8>
    80002034:	00002097          	auipc	ra,0x2
    80002038:	174080e7          	jalr	372(ra) # 800041a8 <_Z11printStringPKc>
    if(threadNum > n) {
    8000203c:	0324c463          	blt	s1,s2,80002064 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002040:	03205c63          	blez	s2,80002078 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002044:	03800513          	li	a0,56
    80002048:	00003097          	auipc	ra,0x3
    8000204c:	500080e7          	jalr	1280(ra) # 80005548 <_Znwm>
    80002050:	00050a13          	mv	s4,a0
    80002054:	00048593          	mv	a1,s1
    80002058:	00003097          	auipc	ra,0x3
    8000205c:	f2c080e7          	jalr	-212(ra) # 80004f84 <_ZN6BufferC1Ei>
    80002060:	0300006f          	j	80002090 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002064:	00007517          	auipc	a0,0x7
    80002068:	2ac50513          	addi	a0,a0,684 # 80009310 <CONSOLE_STATUS+0x300>
    8000206c:	00002097          	auipc	ra,0x2
    80002070:	13c080e7          	jalr	316(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80002074:	0140006f          	j	80002088 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002078:	00007517          	auipc	a0,0x7
    8000207c:	2d850513          	addi	a0,a0,728 # 80009350 <CONSOLE_STATUS+0x340>
    80002080:	00002097          	auipc	ra,0x2
    80002084:	128080e7          	jalr	296(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80002088:	000b0113          	mv	sp,s6
    8000208c:	1500006f          	j	800021dc <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002090:	00000593          	li	a1,0
    80002094:	0000a517          	auipc	a0,0xa
    80002098:	95450513          	addi	a0,a0,-1708 # 8000b9e8 <_ZL10waitForAll>
    8000209c:	fffff097          	auipc	ra,0xfffff
    800020a0:	3ac080e7          	jalr	940(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
    thread_t threads[threadNum];
    800020a4:	00391793          	slli	a5,s2,0x3
    800020a8:	00f78793          	addi	a5,a5,15
    800020ac:	ff07f793          	andi	a5,a5,-16
    800020b0:	40f10133          	sub	sp,sp,a5
    800020b4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800020b8:	0019071b          	addiw	a4,s2,1
    800020bc:	00171793          	slli	a5,a4,0x1
    800020c0:	00e787b3          	add	a5,a5,a4
    800020c4:	00379793          	slli	a5,a5,0x3
    800020c8:	00f78793          	addi	a5,a5,15
    800020cc:	ff07f793          	andi	a5,a5,-16
    800020d0:	40f10133          	sub	sp,sp,a5
    800020d4:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800020d8:	00191613          	slli	a2,s2,0x1
    800020dc:	012607b3          	add	a5,a2,s2
    800020e0:	00379793          	slli	a5,a5,0x3
    800020e4:	00f987b3          	add	a5,s3,a5
    800020e8:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800020ec:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800020f0:	0000a717          	auipc	a4,0xa
    800020f4:	8f873703          	ld	a4,-1800(a4) # 8000b9e8 <_ZL10waitForAll>
    800020f8:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800020fc:	00078613          	mv	a2,a5
    80002100:	00000597          	auipc	a1,0x0
    80002104:	d7458593          	addi	a1,a1,-652 # 80001e74 <_ZL8consumerPv>
    80002108:	f9840513          	addi	a0,s0,-104
    8000210c:	fffff097          	auipc	ra,0xfffff
    80002110:	1bc080e7          	jalr	444(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002114:	00000493          	li	s1,0
    80002118:	0280006f          	j	80002140 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    8000211c:	00000597          	auipc	a1,0x0
    80002120:	c1458593          	addi	a1,a1,-1004 # 80001d30 <_ZL16producerKeyboardPv>
                      data + i);
    80002124:	00179613          	slli	a2,a5,0x1
    80002128:	00f60633          	add	a2,a2,a5
    8000212c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002130:	00c98633          	add	a2,s3,a2
    80002134:	fffff097          	auipc	ra,0xfffff
    80002138:	194080e7          	jalr	404(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000213c:	0014849b          	addiw	s1,s1,1
    80002140:	0524d263          	bge	s1,s2,80002184 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80002144:	00149793          	slli	a5,s1,0x1
    80002148:	009787b3          	add	a5,a5,s1
    8000214c:	00379793          	slli	a5,a5,0x3
    80002150:	00f987b3          	add	a5,s3,a5
    80002154:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002158:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    8000215c:	0000a717          	auipc	a4,0xa
    80002160:	88c73703          	ld	a4,-1908(a4) # 8000b9e8 <_ZL10waitForAll>
    80002164:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002168:	00048793          	mv	a5,s1
    8000216c:	00349513          	slli	a0,s1,0x3
    80002170:	00aa8533          	add	a0,s5,a0
    80002174:	fa9054e3          	blez	s1,8000211c <_Z22producerConsumer_C_APIv+0x1c8>
    80002178:	00000597          	auipc	a1,0x0
    8000217c:	c6858593          	addi	a1,a1,-920 # 80001de0 <_ZL8producerPv>
    80002180:	fa5ff06f          	j	80002124 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002184:	fffff097          	auipc	ra,0xfffff
    80002188:	20c080e7          	jalr	524(ra) # 80001390 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    8000218c:	00000493          	li	s1,0
    80002190:	00994e63          	blt	s2,s1,800021ac <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002194:	0000a517          	auipc	a0,0xa
    80002198:	85453503          	ld	a0,-1964(a0) # 8000b9e8 <_ZL10waitForAll>
    8000219c:	fffff097          	auipc	ra,0xfffff
    800021a0:	330080e7          	jalr	816(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>
    for (int i = 0; i <= threadNum; i++) {
    800021a4:	0014849b          	addiw	s1,s1,1
    800021a8:	fe9ff06f          	j	80002190 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    800021ac:	0000a517          	auipc	a0,0xa
    800021b0:	83c53503          	ld	a0,-1988(a0) # 8000b9e8 <_ZL10waitForAll>
    800021b4:	fffff097          	auipc	ra,0xfffff
    800021b8:	2d8080e7          	jalr	728(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
    delete buffer;
    800021bc:	000a0e63          	beqz	s4,800021d8 <_Z22producerConsumer_C_APIv+0x284>
    800021c0:	000a0513          	mv	a0,s4
    800021c4:	00003097          	auipc	ra,0x3
    800021c8:	000080e7          	jalr	ra # 800051c4 <_ZN6BufferD1Ev>
    800021cc:	000a0513          	mv	a0,s4
    800021d0:	00003097          	auipc	ra,0x3
    800021d4:	3c8080e7          	jalr	968(ra) # 80005598 <_ZdlPv>
    800021d8:	000b0113          	mv	sp,s6

}
    800021dc:	f9040113          	addi	sp,s0,-112
    800021e0:	06813083          	ld	ra,104(sp)
    800021e4:	06013403          	ld	s0,96(sp)
    800021e8:	05813483          	ld	s1,88(sp)
    800021ec:	05013903          	ld	s2,80(sp)
    800021f0:	04813983          	ld	s3,72(sp)
    800021f4:	04013a03          	ld	s4,64(sp)
    800021f8:	03813a83          	ld	s5,56(sp)
    800021fc:	03013b03          	ld	s6,48(sp)
    80002200:	07010113          	addi	sp,sp,112
    80002204:	00008067          	ret
    80002208:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    8000220c:	000a0513          	mv	a0,s4
    80002210:	00003097          	auipc	ra,0x3
    80002214:	388080e7          	jalr	904(ra) # 80005598 <_ZdlPv>
    80002218:	00048513          	mv	a0,s1
    8000221c:	0000b097          	auipc	ra,0xb
    80002220:	93c080e7          	jalr	-1732(ra) # 8000cb58 <_Unwind_Resume>

0000000080002224 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80002224:	fe010113          	addi	sp,sp,-32
    80002228:	00113c23          	sd	ra,24(sp)
    8000222c:	00813823          	sd	s0,16(sp)
    80002230:	00913423          	sd	s1,8(sp)
    80002234:	01213023          	sd	s2,0(sp)
    80002238:	02010413          	addi	s0,sp,32
    8000223c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002240:	00100793          	li	a5,1
    80002244:	02a7f863          	bgeu	a5,a0,80002274 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002248:	00a00793          	li	a5,10
    8000224c:	02f577b3          	remu	a5,a0,a5
    80002250:	02078e63          	beqz	a5,8000228c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002254:	fff48513          	addi	a0,s1,-1
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	fcc080e7          	jalr	-52(ra) # 80002224 <_ZL9fibonaccim>
    80002260:	00050913          	mv	s2,a0
    80002264:	ffe48513          	addi	a0,s1,-2
    80002268:	00000097          	auipc	ra,0x0
    8000226c:	fbc080e7          	jalr	-68(ra) # 80002224 <_ZL9fibonaccim>
    80002270:	00a90533          	add	a0,s2,a0
}
    80002274:	01813083          	ld	ra,24(sp)
    80002278:	01013403          	ld	s0,16(sp)
    8000227c:	00813483          	ld	s1,8(sp)
    80002280:	00013903          	ld	s2,0(sp)
    80002284:	02010113          	addi	sp,sp,32
    80002288:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000228c:	fffff097          	auipc	ra,0xfffff
    80002290:	104080e7          	jalr	260(ra) # 80001390 <_Z15thread_dispatchv>
    80002294:	fc1ff06f          	j	80002254 <_ZL9fibonaccim+0x30>

0000000080002298 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002298:	fe010113          	addi	sp,sp,-32
    8000229c:	00113c23          	sd	ra,24(sp)
    800022a0:	00813823          	sd	s0,16(sp)
    800022a4:	00913423          	sd	s1,8(sp)
    800022a8:	01213023          	sd	s2,0(sp)
    800022ac:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800022b0:	00000913          	li	s2,0
    800022b4:	0380006f          	j	800022ec <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800022b8:	fffff097          	auipc	ra,0xfffff
    800022bc:	0d8080e7          	jalr	216(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800022c0:	00148493          	addi	s1,s1,1
    800022c4:	000027b7          	lui	a5,0x2
    800022c8:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800022cc:	0097ee63          	bltu	a5,s1,800022e8 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800022d0:	00000713          	li	a4,0
    800022d4:	000077b7          	lui	a5,0x7
    800022d8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800022dc:	fce7eee3          	bltu	a5,a4,800022b8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    800022e0:	00170713          	addi	a4,a4,1
    800022e4:	ff1ff06f          	j	800022d4 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800022e8:	00190913          	addi	s2,s2,1
    800022ec:	00900793          	li	a5,9
    800022f0:	0527e063          	bltu	a5,s2,80002330 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800022f4:	00007517          	auipc	a0,0x7
    800022f8:	08c50513          	addi	a0,a0,140 # 80009380 <CONSOLE_STATUS+0x370>
    800022fc:	00002097          	auipc	ra,0x2
    80002300:	eac080e7          	jalr	-340(ra) # 800041a8 <_Z11printStringPKc>
    80002304:	00000613          	li	a2,0
    80002308:	00a00593          	li	a1,10
    8000230c:	0009051b          	sext.w	a0,s2
    80002310:	00002097          	auipc	ra,0x2
    80002314:	048080e7          	jalr	72(ra) # 80004358 <_Z8printIntiii>
    80002318:	00007517          	auipc	a0,0x7
    8000231c:	e4850513          	addi	a0,a0,-440 # 80009160 <CONSOLE_STATUS+0x150>
    80002320:	00002097          	auipc	ra,0x2
    80002324:	e88080e7          	jalr	-376(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002328:	00000493          	li	s1,0
    8000232c:	f99ff06f          	j	800022c4 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002330:	00007517          	auipc	a0,0x7
    80002334:	05850513          	addi	a0,a0,88 # 80009388 <CONSOLE_STATUS+0x378>
    80002338:	00002097          	auipc	ra,0x2
    8000233c:	e70080e7          	jalr	-400(ra) # 800041a8 <_Z11printStringPKc>
    finishedA = true;
    80002340:	00100793          	li	a5,1
    80002344:	00009717          	auipc	a4,0x9
    80002348:	6af70623          	sb	a5,1708(a4) # 8000b9f0 <_ZL9finishedA>
}
    8000234c:	01813083          	ld	ra,24(sp)
    80002350:	01013403          	ld	s0,16(sp)
    80002354:	00813483          	ld	s1,8(sp)
    80002358:	00013903          	ld	s2,0(sp)
    8000235c:	02010113          	addi	sp,sp,32
    80002360:	00008067          	ret

0000000080002364 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002364:	fe010113          	addi	sp,sp,-32
    80002368:	00113c23          	sd	ra,24(sp)
    8000236c:	00813823          	sd	s0,16(sp)
    80002370:	00913423          	sd	s1,8(sp)
    80002374:	01213023          	sd	s2,0(sp)
    80002378:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000237c:	00000913          	li	s2,0
    80002380:	0380006f          	j	800023b8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002384:	fffff097          	auipc	ra,0xfffff
    80002388:	00c080e7          	jalr	12(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000238c:	00148493          	addi	s1,s1,1
    80002390:	000027b7          	lui	a5,0x2
    80002394:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002398:	0097ee63          	bltu	a5,s1,800023b4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000239c:	00000713          	li	a4,0
    800023a0:	000077b7          	lui	a5,0x7
    800023a4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800023a8:	fce7eee3          	bltu	a5,a4,80002384 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800023ac:	00170713          	addi	a4,a4,1
    800023b0:	ff1ff06f          	j	800023a0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800023b4:	00190913          	addi	s2,s2,1
    800023b8:	00f00793          	li	a5,15
    800023bc:	0527e063          	bltu	a5,s2,800023fc <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800023c0:	00007517          	auipc	a0,0x7
    800023c4:	fd850513          	addi	a0,a0,-40 # 80009398 <CONSOLE_STATUS+0x388>
    800023c8:	00002097          	auipc	ra,0x2
    800023cc:	de0080e7          	jalr	-544(ra) # 800041a8 <_Z11printStringPKc>
    800023d0:	00000613          	li	a2,0
    800023d4:	00a00593          	li	a1,10
    800023d8:	0009051b          	sext.w	a0,s2
    800023dc:	00002097          	auipc	ra,0x2
    800023e0:	f7c080e7          	jalr	-132(ra) # 80004358 <_Z8printIntiii>
    800023e4:	00007517          	auipc	a0,0x7
    800023e8:	d7c50513          	addi	a0,a0,-644 # 80009160 <CONSOLE_STATUS+0x150>
    800023ec:	00002097          	auipc	ra,0x2
    800023f0:	dbc080e7          	jalr	-580(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800023f4:	00000493          	li	s1,0
    800023f8:	f99ff06f          	j	80002390 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800023fc:	00007517          	auipc	a0,0x7
    80002400:	fa450513          	addi	a0,a0,-92 # 800093a0 <CONSOLE_STATUS+0x390>
    80002404:	00002097          	auipc	ra,0x2
    80002408:	da4080e7          	jalr	-604(ra) # 800041a8 <_Z11printStringPKc>
    finishedB = true;
    8000240c:	00100793          	li	a5,1
    80002410:	00009717          	auipc	a4,0x9
    80002414:	5ef700a3          	sb	a5,1505(a4) # 8000b9f1 <_ZL9finishedB>
    thread_dispatch();
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	f78080e7          	jalr	-136(ra) # 80001390 <_Z15thread_dispatchv>
}
    80002420:	01813083          	ld	ra,24(sp)
    80002424:	01013403          	ld	s0,16(sp)
    80002428:	00813483          	ld	s1,8(sp)
    8000242c:	00013903          	ld	s2,0(sp)
    80002430:	02010113          	addi	sp,sp,32
    80002434:	00008067          	ret

0000000080002438 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80002438:	fe010113          	addi	sp,sp,-32
    8000243c:	00113c23          	sd	ra,24(sp)
    80002440:	00813823          	sd	s0,16(sp)
    80002444:	00913423          	sd	s1,8(sp)
    80002448:	01213023          	sd	s2,0(sp)
    8000244c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80002450:	00000493          	li	s1,0
    80002454:	0400006f          	j	80002494 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002458:	00007517          	auipc	a0,0x7
    8000245c:	f5850513          	addi	a0,a0,-168 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80002460:	00002097          	auipc	ra,0x2
    80002464:	d48080e7          	jalr	-696(ra) # 800041a8 <_Z11printStringPKc>
    80002468:	00000613          	li	a2,0
    8000246c:	00a00593          	li	a1,10
    80002470:	00048513          	mv	a0,s1
    80002474:	00002097          	auipc	ra,0x2
    80002478:	ee4080e7          	jalr	-284(ra) # 80004358 <_Z8printIntiii>
    8000247c:	00007517          	auipc	a0,0x7
    80002480:	ce450513          	addi	a0,a0,-796 # 80009160 <CONSOLE_STATUS+0x150>
    80002484:	00002097          	auipc	ra,0x2
    80002488:	d24080e7          	jalr	-732(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    8000248c:	0014849b          	addiw	s1,s1,1
    80002490:	0ff4f493          	andi	s1,s1,255
    80002494:	00200793          	li	a5,2
    80002498:	fc97f0e3          	bgeu	a5,s1,80002458 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    8000249c:	00007517          	auipc	a0,0x7
    800024a0:	f1c50513          	addi	a0,a0,-228 # 800093b8 <CONSOLE_STATUS+0x3a8>
    800024a4:	00002097          	auipc	ra,0x2
    800024a8:	d04080e7          	jalr	-764(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800024ac:	00700313          	li	t1,7
    thread_dispatch();
    800024b0:	fffff097          	auipc	ra,0xfffff
    800024b4:	ee0080e7          	jalr	-288(ra) # 80001390 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800024b8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800024bc:	00007517          	auipc	a0,0x7
    800024c0:	f0c50513          	addi	a0,a0,-244 # 800093c8 <CONSOLE_STATUS+0x3b8>
    800024c4:	00002097          	auipc	ra,0x2
    800024c8:	ce4080e7          	jalr	-796(ra) # 800041a8 <_Z11printStringPKc>
    800024cc:	00000613          	li	a2,0
    800024d0:	00a00593          	li	a1,10
    800024d4:	0009051b          	sext.w	a0,s2
    800024d8:	00002097          	auipc	ra,0x2
    800024dc:	e80080e7          	jalr	-384(ra) # 80004358 <_Z8printIntiii>
    800024e0:	00007517          	auipc	a0,0x7
    800024e4:	c8050513          	addi	a0,a0,-896 # 80009160 <CONSOLE_STATUS+0x150>
    800024e8:	00002097          	auipc	ra,0x2
    800024ec:	cc0080e7          	jalr	-832(ra) # 800041a8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800024f0:	00c00513          	li	a0,12
    800024f4:	00000097          	auipc	ra,0x0
    800024f8:	d30080e7          	jalr	-720(ra) # 80002224 <_ZL9fibonaccim>
    800024fc:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80002500:	00007517          	auipc	a0,0x7
    80002504:	ed050513          	addi	a0,a0,-304 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80002508:	00002097          	auipc	ra,0x2
    8000250c:	ca0080e7          	jalr	-864(ra) # 800041a8 <_Z11printStringPKc>
    80002510:	00000613          	li	a2,0
    80002514:	00a00593          	li	a1,10
    80002518:	0009051b          	sext.w	a0,s2
    8000251c:	00002097          	auipc	ra,0x2
    80002520:	e3c080e7          	jalr	-452(ra) # 80004358 <_Z8printIntiii>
    80002524:	00007517          	auipc	a0,0x7
    80002528:	c3c50513          	addi	a0,a0,-964 # 80009160 <CONSOLE_STATUS+0x150>
    8000252c:	00002097          	auipc	ra,0x2
    80002530:	c7c080e7          	jalr	-900(ra) # 800041a8 <_Z11printStringPKc>
    80002534:	0400006f          	j	80002574 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80002538:	00007517          	auipc	a0,0x7
    8000253c:	e7850513          	addi	a0,a0,-392 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80002540:	00002097          	auipc	ra,0x2
    80002544:	c68080e7          	jalr	-920(ra) # 800041a8 <_Z11printStringPKc>
    80002548:	00000613          	li	a2,0
    8000254c:	00a00593          	li	a1,10
    80002550:	00048513          	mv	a0,s1
    80002554:	00002097          	auipc	ra,0x2
    80002558:	e04080e7          	jalr	-508(ra) # 80004358 <_Z8printIntiii>
    8000255c:	00007517          	auipc	a0,0x7
    80002560:	c0450513          	addi	a0,a0,-1020 # 80009160 <CONSOLE_STATUS+0x150>
    80002564:	00002097          	auipc	ra,0x2
    80002568:	c44080e7          	jalr	-956(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000256c:	0014849b          	addiw	s1,s1,1
    80002570:	0ff4f493          	andi	s1,s1,255
    80002574:	00500793          	li	a5,5
    80002578:	fc97f0e3          	bgeu	a5,s1,80002538 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    8000257c:	00007517          	auipc	a0,0x7
    80002580:	e0c50513          	addi	a0,a0,-500 # 80009388 <CONSOLE_STATUS+0x378>
    80002584:	00002097          	auipc	ra,0x2
    80002588:	c24080e7          	jalr	-988(ra) # 800041a8 <_Z11printStringPKc>
    finishedC = true;
    8000258c:	00100793          	li	a5,1
    80002590:	00009717          	auipc	a4,0x9
    80002594:	46f70123          	sb	a5,1122(a4) # 8000b9f2 <_ZL9finishedC>
    thread_dispatch();
    80002598:	fffff097          	auipc	ra,0xfffff
    8000259c:	df8080e7          	jalr	-520(ra) # 80001390 <_Z15thread_dispatchv>
}
    800025a0:	01813083          	ld	ra,24(sp)
    800025a4:	01013403          	ld	s0,16(sp)
    800025a8:	00813483          	ld	s1,8(sp)
    800025ac:	00013903          	ld	s2,0(sp)
    800025b0:	02010113          	addi	sp,sp,32
    800025b4:	00008067          	ret

00000000800025b8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800025b8:	fe010113          	addi	sp,sp,-32
    800025bc:	00113c23          	sd	ra,24(sp)
    800025c0:	00813823          	sd	s0,16(sp)
    800025c4:	00913423          	sd	s1,8(sp)
    800025c8:	01213023          	sd	s2,0(sp)
    800025cc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800025d0:	00a00493          	li	s1,10
    800025d4:	0400006f          	j	80002614 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800025d8:	00007517          	auipc	a0,0x7
    800025dc:	e0850513          	addi	a0,a0,-504 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800025e0:	00002097          	auipc	ra,0x2
    800025e4:	bc8080e7          	jalr	-1080(ra) # 800041a8 <_Z11printStringPKc>
    800025e8:	00000613          	li	a2,0
    800025ec:	00a00593          	li	a1,10
    800025f0:	00048513          	mv	a0,s1
    800025f4:	00002097          	auipc	ra,0x2
    800025f8:	d64080e7          	jalr	-668(ra) # 80004358 <_Z8printIntiii>
    800025fc:	00007517          	auipc	a0,0x7
    80002600:	b6450513          	addi	a0,a0,-1180 # 80009160 <CONSOLE_STATUS+0x150>
    80002604:	00002097          	auipc	ra,0x2
    80002608:	ba4080e7          	jalr	-1116(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000260c:	0014849b          	addiw	s1,s1,1
    80002610:	0ff4f493          	andi	s1,s1,255
    80002614:	00c00793          	li	a5,12
    80002618:	fc97f0e3          	bgeu	a5,s1,800025d8 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000261c:	00007517          	auipc	a0,0x7
    80002620:	dcc50513          	addi	a0,a0,-564 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80002624:	00002097          	auipc	ra,0x2
    80002628:	b84080e7          	jalr	-1148(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000262c:	00500313          	li	t1,5
    thread_dispatch();
    80002630:	fffff097          	auipc	ra,0xfffff
    80002634:	d60080e7          	jalr	-672(ra) # 80001390 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80002638:	01000513          	li	a0,16
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	be8080e7          	jalr	-1048(ra) # 80002224 <_ZL9fibonaccim>
    80002644:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80002648:	00007517          	auipc	a0,0x7
    8000264c:	db050513          	addi	a0,a0,-592 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80002650:	00002097          	auipc	ra,0x2
    80002654:	b58080e7          	jalr	-1192(ra) # 800041a8 <_Z11printStringPKc>
    80002658:	00000613          	li	a2,0
    8000265c:	00a00593          	li	a1,10
    80002660:	0009051b          	sext.w	a0,s2
    80002664:	00002097          	auipc	ra,0x2
    80002668:	cf4080e7          	jalr	-780(ra) # 80004358 <_Z8printIntiii>
    8000266c:	00007517          	auipc	a0,0x7
    80002670:	af450513          	addi	a0,a0,-1292 # 80009160 <CONSOLE_STATUS+0x150>
    80002674:	00002097          	auipc	ra,0x2
    80002678:	b34080e7          	jalr	-1228(ra) # 800041a8 <_Z11printStringPKc>
    8000267c:	0400006f          	j	800026bc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002680:	00007517          	auipc	a0,0x7
    80002684:	d6050513          	addi	a0,a0,-672 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80002688:	00002097          	auipc	ra,0x2
    8000268c:	b20080e7          	jalr	-1248(ra) # 800041a8 <_Z11printStringPKc>
    80002690:	00000613          	li	a2,0
    80002694:	00a00593          	li	a1,10
    80002698:	00048513          	mv	a0,s1
    8000269c:	00002097          	auipc	ra,0x2
    800026a0:	cbc080e7          	jalr	-836(ra) # 80004358 <_Z8printIntiii>
    800026a4:	00007517          	auipc	a0,0x7
    800026a8:	abc50513          	addi	a0,a0,-1348 # 80009160 <CONSOLE_STATUS+0x150>
    800026ac:	00002097          	auipc	ra,0x2
    800026b0:	afc080e7          	jalr	-1284(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800026b4:	0014849b          	addiw	s1,s1,1
    800026b8:	0ff4f493          	andi	s1,s1,255
    800026bc:	00f00793          	li	a5,15
    800026c0:	fc97f0e3          	bgeu	a5,s1,80002680 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800026c4:	00007517          	auipc	a0,0x7
    800026c8:	d4450513          	addi	a0,a0,-700 # 80009408 <CONSOLE_STATUS+0x3f8>
    800026cc:	00002097          	auipc	ra,0x2
    800026d0:	adc080e7          	jalr	-1316(ra) # 800041a8 <_Z11printStringPKc>
    finishedD = true;
    800026d4:	00100793          	li	a5,1
    800026d8:	00009717          	auipc	a4,0x9
    800026dc:	30f70da3          	sb	a5,795(a4) # 8000b9f3 <_ZL9finishedD>
    thread_dispatch();
    800026e0:	fffff097          	auipc	ra,0xfffff
    800026e4:	cb0080e7          	jalr	-848(ra) # 80001390 <_Z15thread_dispatchv>
}
    800026e8:	01813083          	ld	ra,24(sp)
    800026ec:	01013403          	ld	s0,16(sp)
    800026f0:	00813483          	ld	s1,8(sp)
    800026f4:	00013903          	ld	s2,0(sp)
    800026f8:	02010113          	addi	sp,sp,32
    800026fc:	00008067          	ret

0000000080002700 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80002700:	fc010113          	addi	sp,sp,-64
    80002704:	02113c23          	sd	ra,56(sp)
    80002708:	02813823          	sd	s0,48(sp)
    8000270c:	02913423          	sd	s1,40(sp)
    80002710:	03213023          	sd	s2,32(sp)
    80002714:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80002718:	02000513          	li	a0,32
    8000271c:	00003097          	auipc	ra,0x3
    80002720:	e2c080e7          	jalr	-468(ra) # 80005548 <_Znwm>
    80002724:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80002728:	00003097          	auipc	ra,0x3
    8000272c:	050080e7          	jalr	80(ra) # 80005778 <_ZN6ThreadC1Ev>
    80002730:	00009797          	auipc	a5,0x9
    80002734:	f8878793          	addi	a5,a5,-120 # 8000b6b8 <_ZTV7WorkerA+0x10>
    80002738:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000273c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80002740:	00007517          	auipc	a0,0x7
    80002744:	cd850513          	addi	a0,a0,-808 # 80009418 <CONSOLE_STATUS+0x408>
    80002748:	00002097          	auipc	ra,0x2
    8000274c:	a60080e7          	jalr	-1440(ra) # 800041a8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002750:	02000513          	li	a0,32
    80002754:	00003097          	auipc	ra,0x3
    80002758:	df4080e7          	jalr	-524(ra) # 80005548 <_Znwm>
    8000275c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80002760:	00003097          	auipc	ra,0x3
    80002764:	018080e7          	jalr	24(ra) # 80005778 <_ZN6ThreadC1Ev>
    80002768:	00009797          	auipc	a5,0x9
    8000276c:	f7878793          	addi	a5,a5,-136 # 8000b6e0 <_ZTV7WorkerB+0x10>
    80002770:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80002774:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80002778:	00007517          	auipc	a0,0x7
    8000277c:	cb850513          	addi	a0,a0,-840 # 80009430 <CONSOLE_STATUS+0x420>
    80002780:	00002097          	auipc	ra,0x2
    80002784:	a28080e7          	jalr	-1496(ra) # 800041a8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80002788:	02000513          	li	a0,32
    8000278c:	00003097          	auipc	ra,0x3
    80002790:	dbc080e7          	jalr	-580(ra) # 80005548 <_Znwm>
    80002794:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80002798:	00003097          	auipc	ra,0x3
    8000279c:	fe0080e7          	jalr	-32(ra) # 80005778 <_ZN6ThreadC1Ev>
    800027a0:	00009797          	auipc	a5,0x9
    800027a4:	f6878793          	addi	a5,a5,-152 # 8000b708 <_ZTV7WorkerC+0x10>
    800027a8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800027ac:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800027b0:	00007517          	auipc	a0,0x7
    800027b4:	c9850513          	addi	a0,a0,-872 # 80009448 <CONSOLE_STATUS+0x438>
    800027b8:	00002097          	auipc	ra,0x2
    800027bc:	9f0080e7          	jalr	-1552(ra) # 800041a8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800027c0:	02000513          	li	a0,32
    800027c4:	00003097          	auipc	ra,0x3
    800027c8:	d84080e7          	jalr	-636(ra) # 80005548 <_Znwm>
    800027cc:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800027d0:	00003097          	auipc	ra,0x3
    800027d4:	fa8080e7          	jalr	-88(ra) # 80005778 <_ZN6ThreadC1Ev>
    800027d8:	00009797          	auipc	a5,0x9
    800027dc:	f5878793          	addi	a5,a5,-168 # 8000b730 <_ZTV7WorkerD+0x10>
    800027e0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800027e4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800027e8:	00007517          	auipc	a0,0x7
    800027ec:	c7850513          	addi	a0,a0,-904 # 80009460 <CONSOLE_STATUS+0x450>
    800027f0:	00002097          	auipc	ra,0x2
    800027f4:	9b8080e7          	jalr	-1608(ra) # 800041a8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800027f8:	00000493          	li	s1,0
    800027fc:	00300793          	li	a5,3
    80002800:	0297c663          	blt	a5,s1,8000282c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002804:	00349793          	slli	a5,s1,0x3
    80002808:	fe040713          	addi	a4,s0,-32
    8000280c:	00f707b3          	add	a5,a4,a5
    80002810:	fe07b503          	ld	a0,-32(a5)
    80002814:	00003097          	auipc	ra,0x3
    80002818:	edc080e7          	jalr	-292(ra) # 800056f0 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000281c:	0014849b          	addiw	s1,s1,1
    80002820:	fddff06f          	j	800027fc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002824:	00003097          	auipc	ra,0x3
    80002828:	f04080e7          	jalr	-252(ra) # 80005728 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000282c:	00009797          	auipc	a5,0x9
    80002830:	1c47c783          	lbu	a5,452(a5) # 8000b9f0 <_ZL9finishedA>
    80002834:	fe0788e3          	beqz	a5,80002824 <_Z20Threads_CPP_API_testv+0x124>
    80002838:	00009797          	auipc	a5,0x9
    8000283c:	1b97c783          	lbu	a5,441(a5) # 8000b9f1 <_ZL9finishedB>
    80002840:	fe0782e3          	beqz	a5,80002824 <_Z20Threads_CPP_API_testv+0x124>
    80002844:	00009797          	auipc	a5,0x9
    80002848:	1ae7c783          	lbu	a5,430(a5) # 8000b9f2 <_ZL9finishedC>
    8000284c:	fc078ce3          	beqz	a5,80002824 <_Z20Threads_CPP_API_testv+0x124>
    80002850:	00009797          	auipc	a5,0x9
    80002854:	1a37c783          	lbu	a5,419(a5) # 8000b9f3 <_ZL9finishedD>
    80002858:	fc0786e3          	beqz	a5,80002824 <_Z20Threads_CPP_API_testv+0x124>
    8000285c:	fc040493          	addi	s1,s0,-64
    80002860:	0080006f          	j	80002868 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80002864:	00848493          	addi	s1,s1,8
    80002868:	fe040793          	addi	a5,s0,-32
    8000286c:	08f48663          	beq	s1,a5,800028f8 <_Z20Threads_CPP_API_testv+0x1f8>
    80002870:	0004b503          	ld	a0,0(s1)
    80002874:	fe0508e3          	beqz	a0,80002864 <_Z20Threads_CPP_API_testv+0x164>
    80002878:	00053783          	ld	a5,0(a0)
    8000287c:	0087b783          	ld	a5,8(a5)
    80002880:	000780e7          	jalr	a5
    80002884:	fe1ff06f          	j	80002864 <_Z20Threads_CPP_API_testv+0x164>
    80002888:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000288c:	00048513          	mv	a0,s1
    80002890:	00003097          	auipc	ra,0x3
    80002894:	d08080e7          	jalr	-760(ra) # 80005598 <_ZdlPv>
    80002898:	00090513          	mv	a0,s2
    8000289c:	0000a097          	auipc	ra,0xa
    800028a0:	2bc080e7          	jalr	700(ra) # 8000cb58 <_Unwind_Resume>
    800028a4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800028a8:	00048513          	mv	a0,s1
    800028ac:	00003097          	auipc	ra,0x3
    800028b0:	cec080e7          	jalr	-788(ra) # 80005598 <_ZdlPv>
    800028b4:	00090513          	mv	a0,s2
    800028b8:	0000a097          	auipc	ra,0xa
    800028bc:	2a0080e7          	jalr	672(ra) # 8000cb58 <_Unwind_Resume>
    800028c0:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800028c4:	00048513          	mv	a0,s1
    800028c8:	00003097          	auipc	ra,0x3
    800028cc:	cd0080e7          	jalr	-816(ra) # 80005598 <_ZdlPv>
    800028d0:	00090513          	mv	a0,s2
    800028d4:	0000a097          	auipc	ra,0xa
    800028d8:	284080e7          	jalr	644(ra) # 8000cb58 <_Unwind_Resume>
    800028dc:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800028e0:	00048513          	mv	a0,s1
    800028e4:	00003097          	auipc	ra,0x3
    800028e8:	cb4080e7          	jalr	-844(ra) # 80005598 <_ZdlPv>
    800028ec:	00090513          	mv	a0,s2
    800028f0:	0000a097          	auipc	ra,0xa
    800028f4:	268080e7          	jalr	616(ra) # 8000cb58 <_Unwind_Resume>
}
    800028f8:	03813083          	ld	ra,56(sp)
    800028fc:	03013403          	ld	s0,48(sp)
    80002900:	02813483          	ld	s1,40(sp)
    80002904:	02013903          	ld	s2,32(sp)
    80002908:	04010113          	addi	sp,sp,64
    8000290c:	00008067          	ret

0000000080002910 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80002910:	ff010113          	addi	sp,sp,-16
    80002914:	00113423          	sd	ra,8(sp)
    80002918:	00813023          	sd	s0,0(sp)
    8000291c:	01010413          	addi	s0,sp,16
    80002920:	00009797          	auipc	a5,0x9
    80002924:	d9878793          	addi	a5,a5,-616 # 8000b6b8 <_ZTV7WorkerA+0x10>
    80002928:	00f53023          	sd	a5,0(a0)
    8000292c:	00003097          	auipc	ra,0x3
    80002930:	c94080e7          	jalr	-876(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002934:	00813083          	ld	ra,8(sp)
    80002938:	00013403          	ld	s0,0(sp)
    8000293c:	01010113          	addi	sp,sp,16
    80002940:	00008067          	ret

0000000080002944 <_ZN7WorkerAD0Ev>:
    80002944:	fe010113          	addi	sp,sp,-32
    80002948:	00113c23          	sd	ra,24(sp)
    8000294c:	00813823          	sd	s0,16(sp)
    80002950:	00913423          	sd	s1,8(sp)
    80002954:	02010413          	addi	s0,sp,32
    80002958:	00050493          	mv	s1,a0
    8000295c:	00009797          	auipc	a5,0x9
    80002960:	d5c78793          	addi	a5,a5,-676 # 8000b6b8 <_ZTV7WorkerA+0x10>
    80002964:	00f53023          	sd	a5,0(a0)
    80002968:	00003097          	auipc	ra,0x3
    8000296c:	c58080e7          	jalr	-936(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002970:	00048513          	mv	a0,s1
    80002974:	00003097          	auipc	ra,0x3
    80002978:	c24080e7          	jalr	-988(ra) # 80005598 <_ZdlPv>
    8000297c:	01813083          	ld	ra,24(sp)
    80002980:	01013403          	ld	s0,16(sp)
    80002984:	00813483          	ld	s1,8(sp)
    80002988:	02010113          	addi	sp,sp,32
    8000298c:	00008067          	ret

0000000080002990 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002990:	ff010113          	addi	sp,sp,-16
    80002994:	00113423          	sd	ra,8(sp)
    80002998:	00813023          	sd	s0,0(sp)
    8000299c:	01010413          	addi	s0,sp,16
    800029a0:	00009797          	auipc	a5,0x9
    800029a4:	d4078793          	addi	a5,a5,-704 # 8000b6e0 <_ZTV7WorkerB+0x10>
    800029a8:	00f53023          	sd	a5,0(a0)
    800029ac:	00003097          	auipc	ra,0x3
    800029b0:	c14080e7          	jalr	-1004(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800029b4:	00813083          	ld	ra,8(sp)
    800029b8:	00013403          	ld	s0,0(sp)
    800029bc:	01010113          	addi	sp,sp,16
    800029c0:	00008067          	ret

00000000800029c4 <_ZN7WorkerBD0Ev>:
    800029c4:	fe010113          	addi	sp,sp,-32
    800029c8:	00113c23          	sd	ra,24(sp)
    800029cc:	00813823          	sd	s0,16(sp)
    800029d0:	00913423          	sd	s1,8(sp)
    800029d4:	02010413          	addi	s0,sp,32
    800029d8:	00050493          	mv	s1,a0
    800029dc:	00009797          	auipc	a5,0x9
    800029e0:	d0478793          	addi	a5,a5,-764 # 8000b6e0 <_ZTV7WorkerB+0x10>
    800029e4:	00f53023          	sd	a5,0(a0)
    800029e8:	00003097          	auipc	ra,0x3
    800029ec:	bd8080e7          	jalr	-1064(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800029f0:	00048513          	mv	a0,s1
    800029f4:	00003097          	auipc	ra,0x3
    800029f8:	ba4080e7          	jalr	-1116(ra) # 80005598 <_ZdlPv>
    800029fc:	01813083          	ld	ra,24(sp)
    80002a00:	01013403          	ld	s0,16(sp)
    80002a04:	00813483          	ld	s1,8(sp)
    80002a08:	02010113          	addi	sp,sp,32
    80002a0c:	00008067          	ret

0000000080002a10 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80002a10:	ff010113          	addi	sp,sp,-16
    80002a14:	00113423          	sd	ra,8(sp)
    80002a18:	00813023          	sd	s0,0(sp)
    80002a1c:	01010413          	addi	s0,sp,16
    80002a20:	00009797          	auipc	a5,0x9
    80002a24:	ce878793          	addi	a5,a5,-792 # 8000b708 <_ZTV7WorkerC+0x10>
    80002a28:	00f53023          	sd	a5,0(a0)
    80002a2c:	00003097          	auipc	ra,0x3
    80002a30:	b94080e7          	jalr	-1132(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002a34:	00813083          	ld	ra,8(sp)
    80002a38:	00013403          	ld	s0,0(sp)
    80002a3c:	01010113          	addi	sp,sp,16
    80002a40:	00008067          	ret

0000000080002a44 <_ZN7WorkerCD0Ev>:
    80002a44:	fe010113          	addi	sp,sp,-32
    80002a48:	00113c23          	sd	ra,24(sp)
    80002a4c:	00813823          	sd	s0,16(sp)
    80002a50:	00913423          	sd	s1,8(sp)
    80002a54:	02010413          	addi	s0,sp,32
    80002a58:	00050493          	mv	s1,a0
    80002a5c:	00009797          	auipc	a5,0x9
    80002a60:	cac78793          	addi	a5,a5,-852 # 8000b708 <_ZTV7WorkerC+0x10>
    80002a64:	00f53023          	sd	a5,0(a0)
    80002a68:	00003097          	auipc	ra,0x3
    80002a6c:	b58080e7          	jalr	-1192(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002a70:	00048513          	mv	a0,s1
    80002a74:	00003097          	auipc	ra,0x3
    80002a78:	b24080e7          	jalr	-1244(ra) # 80005598 <_ZdlPv>
    80002a7c:	01813083          	ld	ra,24(sp)
    80002a80:	01013403          	ld	s0,16(sp)
    80002a84:	00813483          	ld	s1,8(sp)
    80002a88:	02010113          	addi	sp,sp,32
    80002a8c:	00008067          	ret

0000000080002a90 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002a90:	ff010113          	addi	sp,sp,-16
    80002a94:	00113423          	sd	ra,8(sp)
    80002a98:	00813023          	sd	s0,0(sp)
    80002a9c:	01010413          	addi	s0,sp,16
    80002aa0:	00009797          	auipc	a5,0x9
    80002aa4:	c9078793          	addi	a5,a5,-880 # 8000b730 <_ZTV7WorkerD+0x10>
    80002aa8:	00f53023          	sd	a5,0(a0)
    80002aac:	00003097          	auipc	ra,0x3
    80002ab0:	b14080e7          	jalr	-1260(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002ab4:	00813083          	ld	ra,8(sp)
    80002ab8:	00013403          	ld	s0,0(sp)
    80002abc:	01010113          	addi	sp,sp,16
    80002ac0:	00008067          	ret

0000000080002ac4 <_ZN7WorkerDD0Ev>:
    80002ac4:	fe010113          	addi	sp,sp,-32
    80002ac8:	00113c23          	sd	ra,24(sp)
    80002acc:	00813823          	sd	s0,16(sp)
    80002ad0:	00913423          	sd	s1,8(sp)
    80002ad4:	02010413          	addi	s0,sp,32
    80002ad8:	00050493          	mv	s1,a0
    80002adc:	00009797          	auipc	a5,0x9
    80002ae0:	c5478793          	addi	a5,a5,-940 # 8000b730 <_ZTV7WorkerD+0x10>
    80002ae4:	00f53023          	sd	a5,0(a0)
    80002ae8:	00003097          	auipc	ra,0x3
    80002aec:	ad8080e7          	jalr	-1320(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80002af0:	00048513          	mv	a0,s1
    80002af4:	00003097          	auipc	ra,0x3
    80002af8:	aa4080e7          	jalr	-1372(ra) # 80005598 <_ZdlPv>
    80002afc:	01813083          	ld	ra,24(sp)
    80002b00:	01013403          	ld	s0,16(sp)
    80002b04:	00813483          	ld	s1,8(sp)
    80002b08:	02010113          	addi	sp,sp,32
    80002b0c:	00008067          	ret

0000000080002b10 <_ZN7WorkerA3runEv>:
    void run() override {
    80002b10:	ff010113          	addi	sp,sp,-16
    80002b14:	00113423          	sd	ra,8(sp)
    80002b18:	00813023          	sd	s0,0(sp)
    80002b1c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80002b20:	00000593          	li	a1,0
    80002b24:	fffff097          	auipc	ra,0xfffff
    80002b28:	774080e7          	jalr	1908(ra) # 80002298 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002b2c:	00813083          	ld	ra,8(sp)
    80002b30:	00013403          	ld	s0,0(sp)
    80002b34:	01010113          	addi	sp,sp,16
    80002b38:	00008067          	ret

0000000080002b3c <_ZN7WorkerB3runEv>:
    void run() override {
    80002b3c:	ff010113          	addi	sp,sp,-16
    80002b40:	00113423          	sd	ra,8(sp)
    80002b44:	00813023          	sd	s0,0(sp)
    80002b48:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80002b4c:	00000593          	li	a1,0
    80002b50:	00000097          	auipc	ra,0x0
    80002b54:	814080e7          	jalr	-2028(ra) # 80002364 <_ZN7WorkerB11workerBodyBEPv>
    }
    80002b58:	00813083          	ld	ra,8(sp)
    80002b5c:	00013403          	ld	s0,0(sp)
    80002b60:	01010113          	addi	sp,sp,16
    80002b64:	00008067          	ret

0000000080002b68 <_ZN7WorkerC3runEv>:
    void run() override {
    80002b68:	ff010113          	addi	sp,sp,-16
    80002b6c:	00113423          	sd	ra,8(sp)
    80002b70:	00813023          	sd	s0,0(sp)
    80002b74:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002b78:	00000593          	li	a1,0
    80002b7c:	00000097          	auipc	ra,0x0
    80002b80:	8bc080e7          	jalr	-1860(ra) # 80002438 <_ZN7WorkerC11workerBodyCEPv>
    }
    80002b84:	00813083          	ld	ra,8(sp)
    80002b88:	00013403          	ld	s0,0(sp)
    80002b8c:	01010113          	addi	sp,sp,16
    80002b90:	00008067          	ret

0000000080002b94 <_ZN7WorkerD3runEv>:
    void run() override {
    80002b94:	ff010113          	addi	sp,sp,-16
    80002b98:	00113423          	sd	ra,8(sp)
    80002b9c:	00813023          	sd	s0,0(sp)
    80002ba0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80002ba4:	00000593          	li	a1,0
    80002ba8:	00000097          	auipc	ra,0x0
    80002bac:	a10080e7          	jalr	-1520(ra) # 800025b8 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002bb0:	00813083          	ld	ra,8(sp)
    80002bb4:	00013403          	ld	s0,0(sp)
    80002bb8:	01010113          	addi	sp,sp,16
    80002bbc:	00008067          	ret

0000000080002bc0 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80002bc0:	f8010113          	addi	sp,sp,-128
    80002bc4:	06113c23          	sd	ra,120(sp)
    80002bc8:	06813823          	sd	s0,112(sp)
    80002bcc:	06913423          	sd	s1,104(sp)
    80002bd0:	07213023          	sd	s2,96(sp)
    80002bd4:	05313c23          	sd	s3,88(sp)
    80002bd8:	05413823          	sd	s4,80(sp)
    80002bdc:	05513423          	sd	s5,72(sp)
    80002be0:	05613023          	sd	s6,64(sp)
    80002be4:	03713c23          	sd	s7,56(sp)
    80002be8:	03813823          	sd	s8,48(sp)
    80002bec:	03913423          	sd	s9,40(sp)
    80002bf0:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80002bf4:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80002bf8:	00006517          	auipc	a0,0x6
    80002bfc:	6a050513          	addi	a0,a0,1696 # 80009298 <CONSOLE_STATUS+0x288>
    80002c00:	00001097          	auipc	ra,0x1
    80002c04:	5a8080e7          	jalr	1448(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80002c08:	01e00593          	li	a1,30
    80002c0c:	f8040493          	addi	s1,s0,-128
    80002c10:	00048513          	mv	a0,s1
    80002c14:	00001097          	auipc	ra,0x1
    80002c18:	61c080e7          	jalr	1564(ra) # 80004230 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002c1c:	00048513          	mv	a0,s1
    80002c20:	00001097          	auipc	ra,0x1
    80002c24:	6e8080e7          	jalr	1768(ra) # 80004308 <_Z11stringToIntPKc>
    80002c28:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80002c2c:	00006517          	auipc	a0,0x6
    80002c30:	68c50513          	addi	a0,a0,1676 # 800092b8 <CONSOLE_STATUS+0x2a8>
    80002c34:	00001097          	auipc	ra,0x1
    80002c38:	574080e7          	jalr	1396(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80002c3c:	01e00593          	li	a1,30
    80002c40:	00048513          	mv	a0,s1
    80002c44:	00001097          	auipc	ra,0x1
    80002c48:	5ec080e7          	jalr	1516(ra) # 80004230 <_Z9getStringPci>
    n = stringToInt(input);
    80002c4c:	00048513          	mv	a0,s1
    80002c50:	00001097          	auipc	ra,0x1
    80002c54:	6b8080e7          	jalr	1720(ra) # 80004308 <_Z11stringToIntPKc>
    80002c58:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80002c5c:	00006517          	auipc	a0,0x6
    80002c60:	67c50513          	addi	a0,a0,1660 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80002c64:	00001097          	auipc	ra,0x1
    80002c68:	544080e7          	jalr	1348(ra) # 800041a8 <_Z11printStringPKc>
    printInt(threadNum);
    80002c6c:	00000613          	li	a2,0
    80002c70:	00a00593          	li	a1,10
    80002c74:	00098513          	mv	a0,s3
    80002c78:	00001097          	auipc	ra,0x1
    80002c7c:	6e0080e7          	jalr	1760(ra) # 80004358 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80002c80:	00006517          	auipc	a0,0x6
    80002c84:	67050513          	addi	a0,a0,1648 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80002c88:	00001097          	auipc	ra,0x1
    80002c8c:	520080e7          	jalr	1312(ra) # 800041a8 <_Z11printStringPKc>
    printInt(n);
    80002c90:	00000613          	li	a2,0
    80002c94:	00a00593          	li	a1,10
    80002c98:	00048513          	mv	a0,s1
    80002c9c:	00001097          	auipc	ra,0x1
    80002ca0:	6bc080e7          	jalr	1724(ra) # 80004358 <_Z8printIntiii>
    printString(".\n");
    80002ca4:	00006517          	auipc	a0,0x6
    80002ca8:	66450513          	addi	a0,a0,1636 # 80009308 <CONSOLE_STATUS+0x2f8>
    80002cac:	00001097          	auipc	ra,0x1
    80002cb0:	4fc080e7          	jalr	1276(ra) # 800041a8 <_Z11printStringPKc>
    if (threadNum > n) {
    80002cb4:	0334c463          	blt	s1,s3,80002cdc <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80002cb8:	03305c63          	blez	s3,80002cf0 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80002cbc:	03800513          	li	a0,56
    80002cc0:	00003097          	auipc	ra,0x3
    80002cc4:	888080e7          	jalr	-1912(ra) # 80005548 <_Znwm>
    80002cc8:	00050a93          	mv	s5,a0
    80002ccc:	00048593          	mv	a1,s1
    80002cd0:	00001097          	auipc	ra,0x1
    80002cd4:	7a8080e7          	jalr	1960(ra) # 80004478 <_ZN9BufferCPPC1Ei>
    80002cd8:	0300006f          	j	80002d08 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002cdc:	00006517          	auipc	a0,0x6
    80002ce0:	63450513          	addi	a0,a0,1588 # 80009310 <CONSOLE_STATUS+0x300>
    80002ce4:	00001097          	auipc	ra,0x1
    80002ce8:	4c4080e7          	jalr	1220(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80002cec:	0140006f          	j	80002d00 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002cf0:	00006517          	auipc	a0,0x6
    80002cf4:	66050513          	addi	a0,a0,1632 # 80009350 <CONSOLE_STATUS+0x340>
    80002cf8:	00001097          	auipc	ra,0x1
    80002cfc:	4b0080e7          	jalr	1200(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80002d00:	000c0113          	mv	sp,s8
    80002d04:	2140006f          	j	80002f18 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80002d08:	01000513          	li	a0,16
    80002d0c:	00003097          	auipc	ra,0x3
    80002d10:	83c080e7          	jalr	-1988(ra) # 80005548 <_Znwm>
    80002d14:	00050913          	mv	s2,a0
    80002d18:	00000593          	li	a1,0
    80002d1c:	00003097          	auipc	ra,0x3
    80002d20:	a88080e7          	jalr	-1400(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    80002d24:	00009797          	auipc	a5,0x9
    80002d28:	cd27be23          	sd	s2,-804(a5) # 8000ba00 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80002d2c:	00399793          	slli	a5,s3,0x3
    80002d30:	00f78793          	addi	a5,a5,15
    80002d34:	ff07f793          	andi	a5,a5,-16
    80002d38:	40f10133          	sub	sp,sp,a5
    80002d3c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80002d40:	0019871b          	addiw	a4,s3,1
    80002d44:	00171793          	slli	a5,a4,0x1
    80002d48:	00e787b3          	add	a5,a5,a4
    80002d4c:	00379793          	slli	a5,a5,0x3
    80002d50:	00f78793          	addi	a5,a5,15
    80002d54:	ff07f793          	andi	a5,a5,-16
    80002d58:	40f10133          	sub	sp,sp,a5
    80002d5c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80002d60:	00199493          	slli	s1,s3,0x1
    80002d64:	013484b3          	add	s1,s1,s3
    80002d68:	00349493          	slli	s1,s1,0x3
    80002d6c:	009b04b3          	add	s1,s6,s1
    80002d70:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80002d74:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80002d78:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80002d7c:	02800513          	li	a0,40
    80002d80:	00002097          	auipc	ra,0x2
    80002d84:	7c8080e7          	jalr	1992(ra) # 80005548 <_Znwm>
    80002d88:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80002d8c:	00003097          	auipc	ra,0x3
    80002d90:	9ec080e7          	jalr	-1556(ra) # 80005778 <_ZN6ThreadC1Ev>
    80002d94:	00009797          	auipc	a5,0x9
    80002d98:	a1478793          	addi	a5,a5,-1516 # 8000b7a8 <_ZTV8Consumer+0x10>
    80002d9c:	00fbb023          	sd	a5,0(s7)
    80002da0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    80002da4:	000b8513          	mv	a0,s7
    80002da8:	00003097          	auipc	ra,0x3
    80002dac:	948080e7          	jalr	-1720(ra) # 800056f0 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80002db0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80002db4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80002db8:	00009797          	auipc	a5,0x9
    80002dbc:	c487b783          	ld	a5,-952(a5) # 8000ba00 <_ZL10waitForAll>
    80002dc0:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80002dc4:	02800513          	li	a0,40
    80002dc8:	00002097          	auipc	ra,0x2
    80002dcc:	780080e7          	jalr	1920(ra) # 80005548 <_Znwm>
    80002dd0:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80002dd4:	00003097          	auipc	ra,0x3
    80002dd8:	9a4080e7          	jalr	-1628(ra) # 80005778 <_ZN6ThreadC1Ev>
    80002ddc:	00009797          	auipc	a5,0x9
    80002de0:	97c78793          	addi	a5,a5,-1668 # 8000b758 <_ZTV16ProducerKeyborad+0x10>
    80002de4:	00f4b023          	sd	a5,0(s1)
    80002de8:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80002dec:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80002df0:	00048513          	mv	a0,s1
    80002df4:	00003097          	auipc	ra,0x3
    80002df8:	8fc080e7          	jalr	-1796(ra) # 800056f0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80002dfc:	00100913          	li	s2,1
    80002e00:	0300006f          	j	80002e30 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80002e04:	00009797          	auipc	a5,0x9
    80002e08:	97c78793          	addi	a5,a5,-1668 # 8000b780 <_ZTV8Producer+0x10>
    80002e0c:	00fcb023          	sd	a5,0(s9)
    80002e10:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80002e14:	00391793          	slli	a5,s2,0x3
    80002e18:	00fa07b3          	add	a5,s4,a5
    80002e1c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80002e20:	000c8513          	mv	a0,s9
    80002e24:	00003097          	auipc	ra,0x3
    80002e28:	8cc080e7          	jalr	-1844(ra) # 800056f0 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80002e2c:	0019091b          	addiw	s2,s2,1
    80002e30:	05395263          	bge	s2,s3,80002e74 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80002e34:	00191493          	slli	s1,s2,0x1
    80002e38:	012484b3          	add	s1,s1,s2
    80002e3c:	00349493          	slli	s1,s1,0x3
    80002e40:	009b04b3          	add	s1,s6,s1
    80002e44:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80002e48:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80002e4c:	00009797          	auipc	a5,0x9
    80002e50:	bb47b783          	ld	a5,-1100(a5) # 8000ba00 <_ZL10waitForAll>
    80002e54:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80002e58:	02800513          	li	a0,40
    80002e5c:	00002097          	auipc	ra,0x2
    80002e60:	6ec080e7          	jalr	1772(ra) # 80005548 <_Znwm>
    80002e64:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80002e68:	00003097          	auipc	ra,0x3
    80002e6c:	910080e7          	jalr	-1776(ra) # 80005778 <_ZN6ThreadC1Ev>
    80002e70:	f95ff06f          	j	80002e04 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80002e74:	00003097          	auipc	ra,0x3
    80002e78:	8b4080e7          	jalr	-1868(ra) # 80005728 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80002e7c:	00000493          	li	s1,0
    80002e80:	0099ce63          	blt	s3,s1,80002e9c <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80002e84:	00009517          	auipc	a0,0x9
    80002e88:	b7c53503          	ld	a0,-1156(a0) # 8000ba00 <_ZL10waitForAll>
    80002e8c:	00003097          	auipc	ra,0x3
    80002e90:	950080e7          	jalr	-1712(ra) # 800057dc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80002e94:	0014849b          	addiw	s1,s1,1
    80002e98:	fe9ff06f          	j	80002e80 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80002e9c:	00009517          	auipc	a0,0x9
    80002ea0:	b6453503          	ld	a0,-1180(a0) # 8000ba00 <_ZL10waitForAll>
    80002ea4:	00050863          	beqz	a0,80002eb4 <_Z20testConsumerProducerv+0x2f4>
    80002ea8:	00053783          	ld	a5,0(a0)
    80002eac:	0087b783          	ld	a5,8(a5)
    80002eb0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80002eb4:	00000493          	li	s1,0
    80002eb8:	0080006f          	j	80002ec0 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80002ebc:	0014849b          	addiw	s1,s1,1
    80002ec0:	0334d263          	bge	s1,s3,80002ee4 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80002ec4:	00349793          	slli	a5,s1,0x3
    80002ec8:	00fa07b3          	add	a5,s4,a5
    80002ecc:	0007b503          	ld	a0,0(a5)
    80002ed0:	fe0506e3          	beqz	a0,80002ebc <_Z20testConsumerProducerv+0x2fc>
    80002ed4:	00053783          	ld	a5,0(a0)
    80002ed8:	0087b783          	ld	a5,8(a5)
    80002edc:	000780e7          	jalr	a5
    80002ee0:	fddff06f          	j	80002ebc <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80002ee4:	000b8a63          	beqz	s7,80002ef8 <_Z20testConsumerProducerv+0x338>
    80002ee8:	000bb783          	ld	a5,0(s7)
    80002eec:	0087b783          	ld	a5,8(a5)
    80002ef0:	000b8513          	mv	a0,s7
    80002ef4:	000780e7          	jalr	a5
    delete buffer;
    80002ef8:	000a8e63          	beqz	s5,80002f14 <_Z20testConsumerProducerv+0x354>
    80002efc:	000a8513          	mv	a0,s5
    80002f00:	00002097          	auipc	ra,0x2
    80002f04:	870080e7          	jalr	-1936(ra) # 80004770 <_ZN9BufferCPPD1Ev>
    80002f08:	000a8513          	mv	a0,s5
    80002f0c:	00002097          	auipc	ra,0x2
    80002f10:	68c080e7          	jalr	1676(ra) # 80005598 <_ZdlPv>
    80002f14:	000c0113          	mv	sp,s8
}
    80002f18:	f8040113          	addi	sp,s0,-128
    80002f1c:	07813083          	ld	ra,120(sp)
    80002f20:	07013403          	ld	s0,112(sp)
    80002f24:	06813483          	ld	s1,104(sp)
    80002f28:	06013903          	ld	s2,96(sp)
    80002f2c:	05813983          	ld	s3,88(sp)
    80002f30:	05013a03          	ld	s4,80(sp)
    80002f34:	04813a83          	ld	s5,72(sp)
    80002f38:	04013b03          	ld	s6,64(sp)
    80002f3c:	03813b83          	ld	s7,56(sp)
    80002f40:	03013c03          	ld	s8,48(sp)
    80002f44:	02813c83          	ld	s9,40(sp)
    80002f48:	08010113          	addi	sp,sp,128
    80002f4c:	00008067          	ret
    80002f50:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80002f54:	000a8513          	mv	a0,s5
    80002f58:	00002097          	auipc	ra,0x2
    80002f5c:	640080e7          	jalr	1600(ra) # 80005598 <_ZdlPv>
    80002f60:	00048513          	mv	a0,s1
    80002f64:	0000a097          	auipc	ra,0xa
    80002f68:	bf4080e7          	jalr	-1036(ra) # 8000cb58 <_Unwind_Resume>
    80002f6c:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80002f70:	00090513          	mv	a0,s2
    80002f74:	00002097          	auipc	ra,0x2
    80002f78:	624080e7          	jalr	1572(ra) # 80005598 <_ZdlPv>
    80002f7c:	00048513          	mv	a0,s1
    80002f80:	0000a097          	auipc	ra,0xa
    80002f84:	bd8080e7          	jalr	-1064(ra) # 8000cb58 <_Unwind_Resume>
    80002f88:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80002f8c:	000b8513          	mv	a0,s7
    80002f90:	00002097          	auipc	ra,0x2
    80002f94:	608080e7          	jalr	1544(ra) # 80005598 <_ZdlPv>
    80002f98:	00048513          	mv	a0,s1
    80002f9c:	0000a097          	auipc	ra,0xa
    80002fa0:	bbc080e7          	jalr	-1092(ra) # 8000cb58 <_Unwind_Resume>
    80002fa4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80002fa8:	00048513          	mv	a0,s1
    80002fac:	00002097          	auipc	ra,0x2
    80002fb0:	5ec080e7          	jalr	1516(ra) # 80005598 <_ZdlPv>
    80002fb4:	00090513          	mv	a0,s2
    80002fb8:	0000a097          	auipc	ra,0xa
    80002fbc:	ba0080e7          	jalr	-1120(ra) # 8000cb58 <_Unwind_Resume>
    80002fc0:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80002fc4:	000c8513          	mv	a0,s9
    80002fc8:	00002097          	auipc	ra,0x2
    80002fcc:	5d0080e7          	jalr	1488(ra) # 80005598 <_ZdlPv>
    80002fd0:	00048513          	mv	a0,s1
    80002fd4:	0000a097          	auipc	ra,0xa
    80002fd8:	b84080e7          	jalr	-1148(ra) # 8000cb58 <_Unwind_Resume>

0000000080002fdc <_ZN8Consumer3runEv>:
    void run() override {
    80002fdc:	fd010113          	addi	sp,sp,-48
    80002fe0:	02113423          	sd	ra,40(sp)
    80002fe4:	02813023          	sd	s0,32(sp)
    80002fe8:	00913c23          	sd	s1,24(sp)
    80002fec:	01213823          	sd	s2,16(sp)
    80002ff0:	01313423          	sd	s3,8(sp)
    80002ff4:	03010413          	addi	s0,sp,48
    80002ff8:	00050913          	mv	s2,a0
        int i = 0;
    80002ffc:	00000993          	li	s3,0
    80003000:	0100006f          	j	80003010 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80003004:	00a00513          	li	a0,10
    80003008:	00003097          	auipc	ra,0x3
    8000300c:	918080e7          	jalr	-1768(ra) # 80005920 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80003010:	00009797          	auipc	a5,0x9
    80003014:	9e87a783          	lw	a5,-1560(a5) # 8000b9f8 <_ZL9threadEnd>
    80003018:	04079a63          	bnez	a5,8000306c <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000301c:	02093783          	ld	a5,32(s2)
    80003020:	0087b503          	ld	a0,8(a5)
    80003024:	00001097          	auipc	ra,0x1
    80003028:	638080e7          	jalr	1592(ra) # 8000465c <_ZN9BufferCPP3getEv>
            i++;
    8000302c:	0019849b          	addiw	s1,s3,1
    80003030:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80003034:	0ff57513          	andi	a0,a0,255
    80003038:	00003097          	auipc	ra,0x3
    8000303c:	8e8080e7          	jalr	-1816(ra) # 80005920 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80003040:	05000793          	li	a5,80
    80003044:	02f4e4bb          	remw	s1,s1,a5
    80003048:	fc0494e3          	bnez	s1,80003010 <_ZN8Consumer3runEv+0x34>
    8000304c:	fb9ff06f          	j	80003004 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003050:	02093783          	ld	a5,32(s2)
    80003054:	0087b503          	ld	a0,8(a5)
    80003058:	00001097          	auipc	ra,0x1
    8000305c:	604080e7          	jalr	1540(ra) # 8000465c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80003060:	0ff57513          	andi	a0,a0,255
    80003064:	00003097          	auipc	ra,0x3
    80003068:	8bc080e7          	jalr	-1860(ra) # 80005920 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    8000306c:	02093783          	ld	a5,32(s2)
    80003070:	0087b503          	ld	a0,8(a5)
    80003074:	00001097          	auipc	ra,0x1
    80003078:	674080e7          	jalr	1652(ra) # 800046e8 <_ZN9BufferCPP6getCntEv>
    8000307c:	fca04ae3          	bgtz	a0,80003050 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003080:	02093783          	ld	a5,32(s2)
    80003084:	0107b503          	ld	a0,16(a5)
    80003088:	00002097          	auipc	ra,0x2
    8000308c:	780080e7          	jalr	1920(ra) # 80005808 <_ZN9Semaphore6signalEv>
    }
    80003090:	02813083          	ld	ra,40(sp)
    80003094:	02013403          	ld	s0,32(sp)
    80003098:	01813483          	ld	s1,24(sp)
    8000309c:	01013903          	ld	s2,16(sp)
    800030a0:	00813983          	ld	s3,8(sp)
    800030a4:	03010113          	addi	sp,sp,48
    800030a8:	00008067          	ret

00000000800030ac <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800030ac:	ff010113          	addi	sp,sp,-16
    800030b0:	00113423          	sd	ra,8(sp)
    800030b4:	00813023          	sd	s0,0(sp)
    800030b8:	01010413          	addi	s0,sp,16
    800030bc:	00008797          	auipc	a5,0x8
    800030c0:	6ec78793          	addi	a5,a5,1772 # 8000b7a8 <_ZTV8Consumer+0x10>
    800030c4:	00f53023          	sd	a5,0(a0)
    800030c8:	00002097          	auipc	ra,0x2
    800030cc:	4f8080e7          	jalr	1272(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800030d0:	00813083          	ld	ra,8(sp)
    800030d4:	00013403          	ld	s0,0(sp)
    800030d8:	01010113          	addi	sp,sp,16
    800030dc:	00008067          	ret

00000000800030e0 <_ZN8ConsumerD0Ev>:
    800030e0:	fe010113          	addi	sp,sp,-32
    800030e4:	00113c23          	sd	ra,24(sp)
    800030e8:	00813823          	sd	s0,16(sp)
    800030ec:	00913423          	sd	s1,8(sp)
    800030f0:	02010413          	addi	s0,sp,32
    800030f4:	00050493          	mv	s1,a0
    800030f8:	00008797          	auipc	a5,0x8
    800030fc:	6b078793          	addi	a5,a5,1712 # 8000b7a8 <_ZTV8Consumer+0x10>
    80003100:	00f53023          	sd	a5,0(a0)
    80003104:	00002097          	auipc	ra,0x2
    80003108:	4bc080e7          	jalr	1212(ra) # 800055c0 <_ZN6ThreadD1Ev>
    8000310c:	00048513          	mv	a0,s1
    80003110:	00002097          	auipc	ra,0x2
    80003114:	488080e7          	jalr	1160(ra) # 80005598 <_ZdlPv>
    80003118:	01813083          	ld	ra,24(sp)
    8000311c:	01013403          	ld	s0,16(sp)
    80003120:	00813483          	ld	s1,8(sp)
    80003124:	02010113          	addi	sp,sp,32
    80003128:	00008067          	ret

000000008000312c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    8000312c:	ff010113          	addi	sp,sp,-16
    80003130:	00113423          	sd	ra,8(sp)
    80003134:	00813023          	sd	s0,0(sp)
    80003138:	01010413          	addi	s0,sp,16
    8000313c:	00008797          	auipc	a5,0x8
    80003140:	61c78793          	addi	a5,a5,1564 # 8000b758 <_ZTV16ProducerKeyborad+0x10>
    80003144:	00f53023          	sd	a5,0(a0)
    80003148:	00002097          	auipc	ra,0x2
    8000314c:	478080e7          	jalr	1144(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80003150:	00813083          	ld	ra,8(sp)
    80003154:	00013403          	ld	s0,0(sp)
    80003158:	01010113          	addi	sp,sp,16
    8000315c:	00008067          	ret

0000000080003160 <_ZN16ProducerKeyboradD0Ev>:
    80003160:	fe010113          	addi	sp,sp,-32
    80003164:	00113c23          	sd	ra,24(sp)
    80003168:	00813823          	sd	s0,16(sp)
    8000316c:	00913423          	sd	s1,8(sp)
    80003170:	02010413          	addi	s0,sp,32
    80003174:	00050493          	mv	s1,a0
    80003178:	00008797          	auipc	a5,0x8
    8000317c:	5e078793          	addi	a5,a5,1504 # 8000b758 <_ZTV16ProducerKeyborad+0x10>
    80003180:	00f53023          	sd	a5,0(a0)
    80003184:	00002097          	auipc	ra,0x2
    80003188:	43c080e7          	jalr	1084(ra) # 800055c0 <_ZN6ThreadD1Ev>
    8000318c:	00048513          	mv	a0,s1
    80003190:	00002097          	auipc	ra,0x2
    80003194:	408080e7          	jalr	1032(ra) # 80005598 <_ZdlPv>
    80003198:	01813083          	ld	ra,24(sp)
    8000319c:	01013403          	ld	s0,16(sp)
    800031a0:	00813483          	ld	s1,8(sp)
    800031a4:	02010113          	addi	sp,sp,32
    800031a8:	00008067          	ret

00000000800031ac <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    800031ac:	ff010113          	addi	sp,sp,-16
    800031b0:	00113423          	sd	ra,8(sp)
    800031b4:	00813023          	sd	s0,0(sp)
    800031b8:	01010413          	addi	s0,sp,16
    800031bc:	00008797          	auipc	a5,0x8
    800031c0:	5c478793          	addi	a5,a5,1476 # 8000b780 <_ZTV8Producer+0x10>
    800031c4:	00f53023          	sd	a5,0(a0)
    800031c8:	00002097          	auipc	ra,0x2
    800031cc:	3f8080e7          	jalr	1016(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800031d0:	00813083          	ld	ra,8(sp)
    800031d4:	00013403          	ld	s0,0(sp)
    800031d8:	01010113          	addi	sp,sp,16
    800031dc:	00008067          	ret

00000000800031e0 <_ZN8ProducerD0Ev>:
    800031e0:	fe010113          	addi	sp,sp,-32
    800031e4:	00113c23          	sd	ra,24(sp)
    800031e8:	00813823          	sd	s0,16(sp)
    800031ec:	00913423          	sd	s1,8(sp)
    800031f0:	02010413          	addi	s0,sp,32
    800031f4:	00050493          	mv	s1,a0
    800031f8:	00008797          	auipc	a5,0x8
    800031fc:	58878793          	addi	a5,a5,1416 # 8000b780 <_ZTV8Producer+0x10>
    80003200:	00f53023          	sd	a5,0(a0)
    80003204:	00002097          	auipc	ra,0x2
    80003208:	3bc080e7          	jalr	956(ra) # 800055c0 <_ZN6ThreadD1Ev>
    8000320c:	00048513          	mv	a0,s1
    80003210:	00002097          	auipc	ra,0x2
    80003214:	388080e7          	jalr	904(ra) # 80005598 <_ZdlPv>
    80003218:	01813083          	ld	ra,24(sp)
    8000321c:	01013403          	ld	s0,16(sp)
    80003220:	00813483          	ld	s1,8(sp)
    80003224:	02010113          	addi	sp,sp,32
    80003228:	00008067          	ret

000000008000322c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    8000322c:	fe010113          	addi	sp,sp,-32
    80003230:	00113c23          	sd	ra,24(sp)
    80003234:	00813823          	sd	s0,16(sp)
    80003238:	00913423          	sd	s1,8(sp)
    8000323c:	02010413          	addi	s0,sp,32
    80003240:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80003244:	ffffe097          	auipc	ra,0xffffe
    80003248:	188080e7          	jalr	392(ra) # 800013cc <_Z4getcv>
    8000324c:	0005059b          	sext.w	a1,a0
    80003250:	01b00793          	li	a5,27
    80003254:	00f58c63          	beq	a1,a5,8000326c <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80003258:	0204b783          	ld	a5,32(s1)
    8000325c:	0087b503          	ld	a0,8(a5)
    80003260:	00001097          	auipc	ra,0x1
    80003264:	36c080e7          	jalr	876(ra) # 800045cc <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80003268:	fddff06f          	j	80003244 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    8000326c:	00100793          	li	a5,1
    80003270:	00008717          	auipc	a4,0x8
    80003274:	78f72423          	sw	a5,1928(a4) # 8000b9f8 <_ZL9threadEnd>
        td->buffer->put('!');
    80003278:	0204b783          	ld	a5,32(s1)
    8000327c:	02100593          	li	a1,33
    80003280:	0087b503          	ld	a0,8(a5)
    80003284:	00001097          	auipc	ra,0x1
    80003288:	348080e7          	jalr	840(ra) # 800045cc <_ZN9BufferCPP3putEi>
        td->sem->signal();
    8000328c:	0204b783          	ld	a5,32(s1)
    80003290:	0107b503          	ld	a0,16(a5)
    80003294:	00002097          	auipc	ra,0x2
    80003298:	574080e7          	jalr	1396(ra) # 80005808 <_ZN9Semaphore6signalEv>
    }
    8000329c:	01813083          	ld	ra,24(sp)
    800032a0:	01013403          	ld	s0,16(sp)
    800032a4:	00813483          	ld	s1,8(sp)
    800032a8:	02010113          	addi	sp,sp,32
    800032ac:	00008067          	ret

00000000800032b0 <_ZN8Producer3runEv>:
    void run() override {
    800032b0:	fe010113          	addi	sp,sp,-32
    800032b4:	00113c23          	sd	ra,24(sp)
    800032b8:	00813823          	sd	s0,16(sp)
    800032bc:	00913423          	sd	s1,8(sp)
    800032c0:	01213023          	sd	s2,0(sp)
    800032c4:	02010413          	addi	s0,sp,32
    800032c8:	00050493          	mv	s1,a0
        int i = 0;
    800032cc:	00000913          	li	s2,0
        while (!threadEnd) {
    800032d0:	00008797          	auipc	a5,0x8
    800032d4:	7287a783          	lw	a5,1832(a5) # 8000b9f8 <_ZL9threadEnd>
    800032d8:	04079263          	bnez	a5,8000331c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800032dc:	0204b783          	ld	a5,32(s1)
    800032e0:	0007a583          	lw	a1,0(a5)
    800032e4:	0305859b          	addiw	a1,a1,48
    800032e8:	0087b503          	ld	a0,8(a5)
    800032ec:	00001097          	auipc	ra,0x1
    800032f0:	2e0080e7          	jalr	736(ra) # 800045cc <_ZN9BufferCPP3putEi>
            i++;
    800032f4:	0019071b          	addiw	a4,s2,1
    800032f8:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800032fc:	0204b783          	ld	a5,32(s1)
    80003300:	0007a783          	lw	a5,0(a5)
    80003304:	00e787bb          	addw	a5,a5,a4
    80003308:	00500513          	li	a0,5
    8000330c:	02a7e53b          	remw	a0,a5,a0
    80003310:	00002097          	auipc	ra,0x2
    80003314:	440080e7          	jalr	1088(ra) # 80005750 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80003318:	fb9ff06f          	j	800032d0 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    8000331c:	0204b783          	ld	a5,32(s1)
    80003320:	0107b503          	ld	a0,16(a5)
    80003324:	00002097          	auipc	ra,0x2
    80003328:	4e4080e7          	jalr	1252(ra) # 80005808 <_ZN9Semaphore6signalEv>
    }
    8000332c:	01813083          	ld	ra,24(sp)
    80003330:	01013403          	ld	s0,16(sp)
    80003334:	00813483          	ld	s1,8(sp)
    80003338:	00013903          	ld	s2,0(sp)
    8000333c:	02010113          	addi	sp,sp,32
    80003340:	00008067          	ret

0000000080003344 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003344:	fe010113          	addi	sp,sp,-32
    80003348:	00113c23          	sd	ra,24(sp)
    8000334c:	00813823          	sd	s0,16(sp)
    80003350:	00913423          	sd	s1,8(sp)
    80003354:	01213023          	sd	s2,0(sp)
    80003358:	02010413          	addi	s0,sp,32
    8000335c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003360:	00100793          	li	a5,1
    80003364:	02a7f863          	bgeu	a5,a0,80003394 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003368:	00a00793          	li	a5,10
    8000336c:	02f577b3          	remu	a5,a0,a5
    80003370:	02078e63          	beqz	a5,800033ac <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003374:	fff48513          	addi	a0,s1,-1
    80003378:	00000097          	auipc	ra,0x0
    8000337c:	fcc080e7          	jalr	-52(ra) # 80003344 <_ZL9fibonaccim>
    80003380:	00050913          	mv	s2,a0
    80003384:	ffe48513          	addi	a0,s1,-2
    80003388:	00000097          	auipc	ra,0x0
    8000338c:	fbc080e7          	jalr	-68(ra) # 80003344 <_ZL9fibonaccim>
    80003390:	00a90533          	add	a0,s2,a0
}
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	00013903          	ld	s2,0(sp)
    800033a4:	02010113          	addi	sp,sp,32
    800033a8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800033ac:	ffffe097          	auipc	ra,0xffffe
    800033b0:	fe4080e7          	jalr	-28(ra) # 80001390 <_Z15thread_dispatchv>
    800033b4:	fc1ff06f          	j	80003374 <_ZL9fibonaccim+0x30>

00000000800033b8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800033b8:	fe010113          	addi	sp,sp,-32
    800033bc:	00113c23          	sd	ra,24(sp)
    800033c0:	00813823          	sd	s0,16(sp)
    800033c4:	00913423          	sd	s1,8(sp)
    800033c8:	01213023          	sd	s2,0(sp)
    800033cc:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800033d0:	00a00493          	li	s1,10
    800033d4:	0400006f          	j	80003414 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800033d8:	00006517          	auipc	a0,0x6
    800033dc:	00850513          	addi	a0,a0,8 # 800093e0 <CONSOLE_STATUS+0x3d0>
    800033e0:	00001097          	auipc	ra,0x1
    800033e4:	dc8080e7          	jalr	-568(ra) # 800041a8 <_Z11printStringPKc>
    800033e8:	00000613          	li	a2,0
    800033ec:	00a00593          	li	a1,10
    800033f0:	00048513          	mv	a0,s1
    800033f4:	00001097          	auipc	ra,0x1
    800033f8:	f64080e7          	jalr	-156(ra) # 80004358 <_Z8printIntiii>
    800033fc:	00006517          	auipc	a0,0x6
    80003400:	d6450513          	addi	a0,a0,-668 # 80009160 <CONSOLE_STATUS+0x150>
    80003404:	00001097          	auipc	ra,0x1
    80003408:	da4080e7          	jalr	-604(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000340c:	0014849b          	addiw	s1,s1,1
    80003410:	0ff4f493          	andi	s1,s1,255
    80003414:	00c00793          	li	a5,12
    80003418:	fc97f0e3          	bgeu	a5,s1,800033d8 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000341c:	00006517          	auipc	a0,0x6
    80003420:	fcc50513          	addi	a0,a0,-52 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80003424:	00001097          	auipc	ra,0x1
    80003428:	d84080e7          	jalr	-636(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000342c:	00500313          	li	t1,5
    thread_dispatch();
    80003430:	ffffe097          	auipc	ra,0xffffe
    80003434:	f60080e7          	jalr	-160(ra) # 80001390 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003438:	01000513          	li	a0,16
    8000343c:	00000097          	auipc	ra,0x0
    80003440:	f08080e7          	jalr	-248(ra) # 80003344 <_ZL9fibonaccim>
    80003444:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003448:	00006517          	auipc	a0,0x6
    8000344c:	fb050513          	addi	a0,a0,-80 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80003450:	00001097          	auipc	ra,0x1
    80003454:	d58080e7          	jalr	-680(ra) # 800041a8 <_Z11printStringPKc>
    80003458:	00000613          	li	a2,0
    8000345c:	00a00593          	li	a1,10
    80003460:	0009051b          	sext.w	a0,s2
    80003464:	00001097          	auipc	ra,0x1
    80003468:	ef4080e7          	jalr	-268(ra) # 80004358 <_Z8printIntiii>
    8000346c:	00006517          	auipc	a0,0x6
    80003470:	cf450513          	addi	a0,a0,-780 # 80009160 <CONSOLE_STATUS+0x150>
    80003474:	00001097          	auipc	ra,0x1
    80003478:	d34080e7          	jalr	-716(ra) # 800041a8 <_Z11printStringPKc>
    8000347c:	0400006f          	j	800034bc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003480:	00006517          	auipc	a0,0x6
    80003484:	f6050513          	addi	a0,a0,-160 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80003488:	00001097          	auipc	ra,0x1
    8000348c:	d20080e7          	jalr	-736(ra) # 800041a8 <_Z11printStringPKc>
    80003490:	00000613          	li	a2,0
    80003494:	00a00593          	li	a1,10
    80003498:	00048513          	mv	a0,s1
    8000349c:	00001097          	auipc	ra,0x1
    800034a0:	ebc080e7          	jalr	-324(ra) # 80004358 <_Z8printIntiii>
    800034a4:	00006517          	auipc	a0,0x6
    800034a8:	cbc50513          	addi	a0,a0,-836 # 80009160 <CONSOLE_STATUS+0x150>
    800034ac:	00001097          	auipc	ra,0x1
    800034b0:	cfc080e7          	jalr	-772(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800034b4:	0014849b          	addiw	s1,s1,1
    800034b8:	0ff4f493          	andi	s1,s1,255
    800034bc:	00f00793          	li	a5,15
    800034c0:	fc97f0e3          	bgeu	a5,s1,80003480 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800034c4:	00006517          	auipc	a0,0x6
    800034c8:	f4450513          	addi	a0,a0,-188 # 80009408 <CONSOLE_STATUS+0x3f8>
    800034cc:	00001097          	auipc	ra,0x1
    800034d0:	cdc080e7          	jalr	-804(ra) # 800041a8 <_Z11printStringPKc>
    finishedD = true;
    800034d4:	00100793          	li	a5,1
    800034d8:	00008717          	auipc	a4,0x8
    800034dc:	52f70823          	sb	a5,1328(a4) # 8000ba08 <_ZL9finishedD>
    thread_dispatch();
    800034e0:	ffffe097          	auipc	ra,0xffffe
    800034e4:	eb0080e7          	jalr	-336(ra) # 80001390 <_Z15thread_dispatchv>
}
    800034e8:	01813083          	ld	ra,24(sp)
    800034ec:	01013403          	ld	s0,16(sp)
    800034f0:	00813483          	ld	s1,8(sp)
    800034f4:	00013903          	ld	s2,0(sp)
    800034f8:	02010113          	addi	sp,sp,32
    800034fc:	00008067          	ret

0000000080003500 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80003500:	fe010113          	addi	sp,sp,-32
    80003504:	00113c23          	sd	ra,24(sp)
    80003508:	00813823          	sd	s0,16(sp)
    8000350c:	00913423          	sd	s1,8(sp)
    80003510:	01213023          	sd	s2,0(sp)
    80003514:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003518:	00000493          	li	s1,0
    8000351c:	0400006f          	j	8000355c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80003520:	00006517          	auipc	a0,0x6
    80003524:	e9050513          	addi	a0,a0,-368 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003528:	00001097          	auipc	ra,0x1
    8000352c:	c80080e7          	jalr	-896(ra) # 800041a8 <_Z11printStringPKc>
    80003530:	00000613          	li	a2,0
    80003534:	00a00593          	li	a1,10
    80003538:	00048513          	mv	a0,s1
    8000353c:	00001097          	auipc	ra,0x1
    80003540:	e1c080e7          	jalr	-484(ra) # 80004358 <_Z8printIntiii>
    80003544:	00006517          	auipc	a0,0x6
    80003548:	c1c50513          	addi	a0,a0,-996 # 80009160 <CONSOLE_STATUS+0x150>
    8000354c:	00001097          	auipc	ra,0x1
    80003550:	c5c080e7          	jalr	-932(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003554:	0014849b          	addiw	s1,s1,1
    80003558:	0ff4f493          	andi	s1,s1,255
    8000355c:	00200793          	li	a5,2
    80003560:	fc97f0e3          	bgeu	a5,s1,80003520 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80003564:	00006517          	auipc	a0,0x6
    80003568:	e5450513          	addi	a0,a0,-428 # 800093b8 <CONSOLE_STATUS+0x3a8>
    8000356c:	00001097          	auipc	ra,0x1
    80003570:	c3c080e7          	jalr	-964(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003574:	00700313          	li	t1,7
    thread_dispatch();
    80003578:	ffffe097          	auipc	ra,0xffffe
    8000357c:	e18080e7          	jalr	-488(ra) # 80001390 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003580:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80003584:	00006517          	auipc	a0,0x6
    80003588:	e4450513          	addi	a0,a0,-444 # 800093c8 <CONSOLE_STATUS+0x3b8>
    8000358c:	00001097          	auipc	ra,0x1
    80003590:	c1c080e7          	jalr	-996(ra) # 800041a8 <_Z11printStringPKc>
    80003594:	00000613          	li	a2,0
    80003598:	00a00593          	li	a1,10
    8000359c:	0009051b          	sext.w	a0,s2
    800035a0:	00001097          	auipc	ra,0x1
    800035a4:	db8080e7          	jalr	-584(ra) # 80004358 <_Z8printIntiii>
    800035a8:	00006517          	auipc	a0,0x6
    800035ac:	bb850513          	addi	a0,a0,-1096 # 80009160 <CONSOLE_STATUS+0x150>
    800035b0:	00001097          	auipc	ra,0x1
    800035b4:	bf8080e7          	jalr	-1032(ra) # 800041a8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800035b8:	00c00513          	li	a0,12
    800035bc:	00000097          	auipc	ra,0x0
    800035c0:	d88080e7          	jalr	-632(ra) # 80003344 <_ZL9fibonaccim>
    800035c4:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800035c8:	00006517          	auipc	a0,0x6
    800035cc:	e0850513          	addi	a0,a0,-504 # 800093d0 <CONSOLE_STATUS+0x3c0>
    800035d0:	00001097          	auipc	ra,0x1
    800035d4:	bd8080e7          	jalr	-1064(ra) # 800041a8 <_Z11printStringPKc>
    800035d8:	00000613          	li	a2,0
    800035dc:	00a00593          	li	a1,10
    800035e0:	0009051b          	sext.w	a0,s2
    800035e4:	00001097          	auipc	ra,0x1
    800035e8:	d74080e7          	jalr	-652(ra) # 80004358 <_Z8printIntiii>
    800035ec:	00006517          	auipc	a0,0x6
    800035f0:	b7450513          	addi	a0,a0,-1164 # 80009160 <CONSOLE_STATUS+0x150>
    800035f4:	00001097          	auipc	ra,0x1
    800035f8:	bb4080e7          	jalr	-1100(ra) # 800041a8 <_Z11printStringPKc>
    800035fc:	0400006f          	j	8000363c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80003600:	00006517          	auipc	a0,0x6
    80003604:	db050513          	addi	a0,a0,-592 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003608:	00001097          	auipc	ra,0x1
    8000360c:	ba0080e7          	jalr	-1120(ra) # 800041a8 <_Z11printStringPKc>
    80003610:	00000613          	li	a2,0
    80003614:	00a00593          	li	a1,10
    80003618:	00048513          	mv	a0,s1
    8000361c:	00001097          	auipc	ra,0x1
    80003620:	d3c080e7          	jalr	-708(ra) # 80004358 <_Z8printIntiii>
    80003624:	00006517          	auipc	a0,0x6
    80003628:	b3c50513          	addi	a0,a0,-1220 # 80009160 <CONSOLE_STATUS+0x150>
    8000362c:	00001097          	auipc	ra,0x1
    80003630:	b7c080e7          	jalr	-1156(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003634:	0014849b          	addiw	s1,s1,1
    80003638:	0ff4f493          	andi	s1,s1,255
    8000363c:	00500793          	li	a5,5
    80003640:	fc97f0e3          	bgeu	a5,s1,80003600 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80003644:	00006517          	auipc	a0,0x6
    80003648:	d4450513          	addi	a0,a0,-700 # 80009388 <CONSOLE_STATUS+0x378>
    8000364c:	00001097          	auipc	ra,0x1
    80003650:	b5c080e7          	jalr	-1188(ra) # 800041a8 <_Z11printStringPKc>
    finishedC = true;
    80003654:	00100793          	li	a5,1
    80003658:	00008717          	auipc	a4,0x8
    8000365c:	3af708a3          	sb	a5,945(a4) # 8000ba09 <_ZL9finishedC>
    thread_dispatch();
    80003660:	ffffe097          	auipc	ra,0xffffe
    80003664:	d30080e7          	jalr	-720(ra) # 80001390 <_Z15thread_dispatchv>
}
    80003668:	01813083          	ld	ra,24(sp)
    8000366c:	01013403          	ld	s0,16(sp)
    80003670:	00813483          	ld	s1,8(sp)
    80003674:	00013903          	ld	s2,0(sp)
    80003678:	02010113          	addi	sp,sp,32
    8000367c:	00008067          	ret

0000000080003680 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80003680:	fe010113          	addi	sp,sp,-32
    80003684:	00113c23          	sd	ra,24(sp)
    80003688:	00813823          	sd	s0,16(sp)
    8000368c:	00913423          	sd	s1,8(sp)
    80003690:	01213023          	sd	s2,0(sp)
    80003694:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003698:	00000913          	li	s2,0
    8000369c:	0380006f          	j	800036d4 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	cf0080e7          	jalr	-784(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800036a8:	00148493          	addi	s1,s1,1
    800036ac:	000027b7          	lui	a5,0x2
    800036b0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800036b4:	0097ee63          	bltu	a5,s1,800036d0 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800036b8:	00000713          	li	a4,0
    800036bc:	000077b7          	lui	a5,0x7
    800036c0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800036c4:	fce7eee3          	bltu	a5,a4,800036a0 <_ZL11workerBodyBPv+0x20>
    800036c8:	00170713          	addi	a4,a4,1
    800036cc:	ff1ff06f          	j	800036bc <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800036d0:	00190913          	addi	s2,s2,1
    800036d4:	00f00793          	li	a5,15
    800036d8:	0527e063          	bltu	a5,s2,80003718 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800036dc:	00006517          	auipc	a0,0x6
    800036e0:	cbc50513          	addi	a0,a0,-836 # 80009398 <CONSOLE_STATUS+0x388>
    800036e4:	00001097          	auipc	ra,0x1
    800036e8:	ac4080e7          	jalr	-1340(ra) # 800041a8 <_Z11printStringPKc>
    800036ec:	00000613          	li	a2,0
    800036f0:	00a00593          	li	a1,10
    800036f4:	0009051b          	sext.w	a0,s2
    800036f8:	00001097          	auipc	ra,0x1
    800036fc:	c60080e7          	jalr	-928(ra) # 80004358 <_Z8printIntiii>
    80003700:	00006517          	auipc	a0,0x6
    80003704:	a6050513          	addi	a0,a0,-1440 # 80009160 <CONSOLE_STATUS+0x150>
    80003708:	00001097          	auipc	ra,0x1
    8000370c:	aa0080e7          	jalr	-1376(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003710:	00000493          	li	s1,0
    80003714:	f99ff06f          	j	800036ac <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80003718:	00006517          	auipc	a0,0x6
    8000371c:	c8850513          	addi	a0,a0,-888 # 800093a0 <CONSOLE_STATUS+0x390>
    80003720:	00001097          	auipc	ra,0x1
    80003724:	a88080e7          	jalr	-1400(ra) # 800041a8 <_Z11printStringPKc>
    finishedB = true;
    80003728:	00100793          	li	a5,1
    8000372c:	00008717          	auipc	a4,0x8
    80003730:	2cf70f23          	sb	a5,734(a4) # 8000ba0a <_ZL9finishedB>
    thread_dispatch();
    80003734:	ffffe097          	auipc	ra,0xffffe
    80003738:	c5c080e7          	jalr	-932(ra) # 80001390 <_Z15thread_dispatchv>
}
    8000373c:	01813083          	ld	ra,24(sp)
    80003740:	01013403          	ld	s0,16(sp)
    80003744:	00813483          	ld	s1,8(sp)
    80003748:	00013903          	ld	s2,0(sp)
    8000374c:	02010113          	addi	sp,sp,32
    80003750:	00008067          	ret

0000000080003754 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80003754:	fe010113          	addi	sp,sp,-32
    80003758:	00113c23          	sd	ra,24(sp)
    8000375c:	00813823          	sd	s0,16(sp)
    80003760:	00913423          	sd	s1,8(sp)
    80003764:	01213023          	sd	s2,0(sp)
    80003768:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    8000376c:	00000913          	li	s2,0
    80003770:	0380006f          	j	800037a8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80003774:	ffffe097          	auipc	ra,0xffffe
    80003778:	c1c080e7          	jalr	-996(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000377c:	00148493          	addi	s1,s1,1
    80003780:	000027b7          	lui	a5,0x2
    80003784:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003788:	0097ee63          	bltu	a5,s1,800037a4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    8000378c:	00000713          	li	a4,0
    80003790:	000077b7          	lui	a5,0x7
    80003794:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003798:	fce7eee3          	bltu	a5,a4,80003774 <_ZL11workerBodyAPv+0x20>
    8000379c:	00170713          	addi	a4,a4,1
    800037a0:	ff1ff06f          	j	80003790 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800037a4:	00190913          	addi	s2,s2,1
    800037a8:	00900793          	li	a5,9
    800037ac:	0527e063          	bltu	a5,s2,800037ec <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800037b0:	00006517          	auipc	a0,0x6
    800037b4:	bd050513          	addi	a0,a0,-1072 # 80009380 <CONSOLE_STATUS+0x370>
    800037b8:	00001097          	auipc	ra,0x1
    800037bc:	9f0080e7          	jalr	-1552(ra) # 800041a8 <_Z11printStringPKc>
    800037c0:	00000613          	li	a2,0
    800037c4:	00a00593          	li	a1,10
    800037c8:	0009051b          	sext.w	a0,s2
    800037cc:	00001097          	auipc	ra,0x1
    800037d0:	b8c080e7          	jalr	-1140(ra) # 80004358 <_Z8printIntiii>
    800037d4:	00006517          	auipc	a0,0x6
    800037d8:	98c50513          	addi	a0,a0,-1652 # 80009160 <CONSOLE_STATUS+0x150>
    800037dc:	00001097          	auipc	ra,0x1
    800037e0:	9cc080e7          	jalr	-1588(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800037e4:	00000493          	li	s1,0
    800037e8:	f99ff06f          	j	80003780 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800037ec:	00006517          	auipc	a0,0x6
    800037f0:	b9c50513          	addi	a0,a0,-1124 # 80009388 <CONSOLE_STATUS+0x378>
    800037f4:	00001097          	auipc	ra,0x1
    800037f8:	9b4080e7          	jalr	-1612(ra) # 800041a8 <_Z11printStringPKc>
    finishedA = true;
    800037fc:	00100793          	li	a5,1
    80003800:	00008717          	auipc	a4,0x8
    80003804:	20f705a3          	sb	a5,523(a4) # 8000ba0b <_ZL9finishedA>
}
    80003808:	01813083          	ld	ra,24(sp)
    8000380c:	01013403          	ld	s0,16(sp)
    80003810:	00813483          	ld	s1,8(sp)
    80003814:	00013903          	ld	s2,0(sp)
    80003818:	02010113          	addi	sp,sp,32
    8000381c:	00008067          	ret

0000000080003820 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80003820:	fd010113          	addi	sp,sp,-48
    80003824:	02113423          	sd	ra,40(sp)
    80003828:	02813023          	sd	s0,32(sp)
    8000382c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80003830:	00000613          	li	a2,0
    80003834:	00000597          	auipc	a1,0x0
    80003838:	f2058593          	addi	a1,a1,-224 # 80003754 <_ZL11workerBodyAPv>
    8000383c:	fd040513          	addi	a0,s0,-48
    80003840:	ffffe097          	auipc	ra,0xffffe
    80003844:	a88080e7          	jalr	-1400(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80003848:	00006517          	auipc	a0,0x6
    8000384c:	bd050513          	addi	a0,a0,-1072 # 80009418 <CONSOLE_STATUS+0x408>
    80003850:	00001097          	auipc	ra,0x1
    80003854:	958080e7          	jalr	-1704(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80003858:	00000613          	li	a2,0
    8000385c:	00000597          	auipc	a1,0x0
    80003860:	e2458593          	addi	a1,a1,-476 # 80003680 <_ZL11workerBodyBPv>
    80003864:	fd840513          	addi	a0,s0,-40
    80003868:	ffffe097          	auipc	ra,0xffffe
    8000386c:	a60080e7          	jalr	-1440(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80003870:	00006517          	auipc	a0,0x6
    80003874:	bc050513          	addi	a0,a0,-1088 # 80009430 <CONSOLE_STATUS+0x420>
    80003878:	00001097          	auipc	ra,0x1
    8000387c:	930080e7          	jalr	-1744(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80003880:	00000613          	li	a2,0
    80003884:	00000597          	auipc	a1,0x0
    80003888:	c7c58593          	addi	a1,a1,-900 # 80003500 <_ZL11workerBodyCPv>
    8000388c:	fe040513          	addi	a0,s0,-32
    80003890:	ffffe097          	auipc	ra,0xffffe
    80003894:	a38080e7          	jalr	-1480(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80003898:	00006517          	auipc	a0,0x6
    8000389c:	bb050513          	addi	a0,a0,-1104 # 80009448 <CONSOLE_STATUS+0x438>
    800038a0:	00001097          	auipc	ra,0x1
    800038a4:	908080e7          	jalr	-1784(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800038a8:	00000613          	li	a2,0
    800038ac:	00000597          	auipc	a1,0x0
    800038b0:	b0c58593          	addi	a1,a1,-1268 # 800033b8 <_ZL11workerBodyDPv>
    800038b4:	fe840513          	addi	a0,s0,-24
    800038b8:	ffffe097          	auipc	ra,0xffffe
    800038bc:	a10080e7          	jalr	-1520(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800038c0:	00006517          	auipc	a0,0x6
    800038c4:	ba050513          	addi	a0,a0,-1120 # 80009460 <CONSOLE_STATUS+0x450>
    800038c8:	00001097          	auipc	ra,0x1
    800038cc:	8e0080e7          	jalr	-1824(ra) # 800041a8 <_Z11printStringPKc>
    800038d0:	00c0006f          	j	800038dc <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800038d4:	ffffe097          	auipc	ra,0xffffe
    800038d8:	abc080e7          	jalr	-1348(ra) # 80001390 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800038dc:	00008797          	auipc	a5,0x8
    800038e0:	12f7c783          	lbu	a5,303(a5) # 8000ba0b <_ZL9finishedA>
    800038e4:	fe0788e3          	beqz	a5,800038d4 <_Z18Threads_C_API_testv+0xb4>
    800038e8:	00008797          	auipc	a5,0x8
    800038ec:	1227c783          	lbu	a5,290(a5) # 8000ba0a <_ZL9finishedB>
    800038f0:	fe0782e3          	beqz	a5,800038d4 <_Z18Threads_C_API_testv+0xb4>
    800038f4:	00008797          	auipc	a5,0x8
    800038f8:	1157c783          	lbu	a5,277(a5) # 8000ba09 <_ZL9finishedC>
    800038fc:	fc078ce3          	beqz	a5,800038d4 <_Z18Threads_C_API_testv+0xb4>
    80003900:	00008797          	auipc	a5,0x8
    80003904:	1087c783          	lbu	a5,264(a5) # 8000ba08 <_ZL9finishedD>
    80003908:	fc0786e3          	beqz	a5,800038d4 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000390c:	02813083          	ld	ra,40(sp)
    80003910:	02013403          	ld	s0,32(sp)
    80003914:	03010113          	addi	sp,sp,48
    80003918:	00008067          	ret

000000008000391c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000391c:	fd010113          	addi	sp,sp,-48
    80003920:	02113423          	sd	ra,40(sp)
    80003924:	02813023          	sd	s0,32(sp)
    80003928:	00913c23          	sd	s1,24(sp)
    8000392c:	01213823          	sd	s2,16(sp)
    80003930:	01313423          	sd	s3,8(sp)
    80003934:	03010413          	addi	s0,sp,48
    80003938:	00050993          	mv	s3,a0
    8000393c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80003940:	00000913          	li	s2,0
    80003944:	00c0006f          	j	80003950 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003948:	00002097          	auipc	ra,0x2
    8000394c:	de0080e7          	jalr	-544(ra) # 80005728 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80003950:	ffffe097          	auipc	ra,0xffffe
    80003954:	a7c080e7          	jalr	-1412(ra) # 800013cc <_Z4getcv>
    80003958:	0005059b          	sext.w	a1,a0
    8000395c:	01b00793          	li	a5,27
    80003960:	02f58a63          	beq	a1,a5,80003994 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80003964:	0084b503          	ld	a0,8(s1)
    80003968:	00001097          	auipc	ra,0x1
    8000396c:	c64080e7          	jalr	-924(ra) # 800045cc <_ZN9BufferCPP3putEi>
        i++;
    80003970:	0019071b          	addiw	a4,s2,1
    80003974:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003978:	0004a683          	lw	a3,0(s1)
    8000397c:	0026979b          	slliw	a5,a3,0x2
    80003980:	00d787bb          	addw	a5,a5,a3
    80003984:	0017979b          	slliw	a5,a5,0x1
    80003988:	02f767bb          	remw	a5,a4,a5
    8000398c:	fc0792e3          	bnez	a5,80003950 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80003990:	fb9ff06f          	j	80003948 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80003994:	00100793          	li	a5,1
    80003998:	00008717          	auipc	a4,0x8
    8000399c:	06f72c23          	sw	a5,120(a4) # 8000ba10 <_ZL9threadEnd>
    td->buffer->put('!');
    800039a0:	0209b783          	ld	a5,32(s3)
    800039a4:	02100593          	li	a1,33
    800039a8:	0087b503          	ld	a0,8(a5)
    800039ac:	00001097          	auipc	ra,0x1
    800039b0:	c20080e7          	jalr	-992(ra) # 800045cc <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800039b4:	0104b503          	ld	a0,16(s1)
    800039b8:	00002097          	auipc	ra,0x2
    800039bc:	e50080e7          	jalr	-432(ra) # 80005808 <_ZN9Semaphore6signalEv>
}
    800039c0:	02813083          	ld	ra,40(sp)
    800039c4:	02013403          	ld	s0,32(sp)
    800039c8:	01813483          	ld	s1,24(sp)
    800039cc:	01013903          	ld	s2,16(sp)
    800039d0:	00813983          	ld	s3,8(sp)
    800039d4:	03010113          	addi	sp,sp,48
    800039d8:	00008067          	ret

00000000800039dc <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800039dc:	fe010113          	addi	sp,sp,-32
    800039e0:	00113c23          	sd	ra,24(sp)
    800039e4:	00813823          	sd	s0,16(sp)
    800039e8:	00913423          	sd	s1,8(sp)
    800039ec:	01213023          	sd	s2,0(sp)
    800039f0:	02010413          	addi	s0,sp,32
    800039f4:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800039f8:	00000913          	li	s2,0
    800039fc:	00c0006f          	j	80003a08 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80003a00:	00002097          	auipc	ra,0x2
    80003a04:	d28080e7          	jalr	-728(ra) # 80005728 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80003a08:	00008797          	auipc	a5,0x8
    80003a0c:	0087a783          	lw	a5,8(a5) # 8000ba10 <_ZL9threadEnd>
    80003a10:	02079e63          	bnez	a5,80003a4c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80003a14:	0004a583          	lw	a1,0(s1)
    80003a18:	0305859b          	addiw	a1,a1,48
    80003a1c:	0084b503          	ld	a0,8(s1)
    80003a20:	00001097          	auipc	ra,0x1
    80003a24:	bac080e7          	jalr	-1108(ra) # 800045cc <_ZN9BufferCPP3putEi>
        i++;
    80003a28:	0019071b          	addiw	a4,s2,1
    80003a2c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003a30:	0004a683          	lw	a3,0(s1)
    80003a34:	0026979b          	slliw	a5,a3,0x2
    80003a38:	00d787bb          	addw	a5,a5,a3
    80003a3c:	0017979b          	slliw	a5,a5,0x1
    80003a40:	02f767bb          	remw	a5,a4,a5
    80003a44:	fc0792e3          	bnez	a5,80003a08 <_ZN12ProducerSync8producerEPv+0x2c>
    80003a48:	fb9ff06f          	j	80003a00 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80003a4c:	0104b503          	ld	a0,16(s1)
    80003a50:	00002097          	auipc	ra,0x2
    80003a54:	db8080e7          	jalr	-584(ra) # 80005808 <_ZN9Semaphore6signalEv>
}
    80003a58:	01813083          	ld	ra,24(sp)
    80003a5c:	01013403          	ld	s0,16(sp)
    80003a60:	00813483          	ld	s1,8(sp)
    80003a64:	00013903          	ld	s2,0(sp)
    80003a68:	02010113          	addi	sp,sp,32
    80003a6c:	00008067          	ret

0000000080003a70 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80003a70:	fd010113          	addi	sp,sp,-48
    80003a74:	02113423          	sd	ra,40(sp)
    80003a78:	02813023          	sd	s0,32(sp)
    80003a7c:	00913c23          	sd	s1,24(sp)
    80003a80:	01213823          	sd	s2,16(sp)
    80003a84:	01313423          	sd	s3,8(sp)
    80003a88:	01413023          	sd	s4,0(sp)
    80003a8c:	03010413          	addi	s0,sp,48
    80003a90:	00050993          	mv	s3,a0
    80003a94:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80003a98:	00000a13          	li	s4,0
    80003a9c:	01c0006f          	j	80003ab8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	c88080e7          	jalr	-888(ra) # 80005728 <_ZN6Thread8dispatchEv>
    80003aa8:	0500006f          	j	80003af8 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003aac:	00a00513          	li	a0,10
    80003ab0:	ffffe097          	auipc	ra,0xffffe
    80003ab4:	95c080e7          	jalr	-1700(ra) # 8000140c <_Z4putcc>
    while (!threadEnd) {
    80003ab8:	00008797          	auipc	a5,0x8
    80003abc:	f587a783          	lw	a5,-168(a5) # 8000ba10 <_ZL9threadEnd>
    80003ac0:	06079263          	bnez	a5,80003b24 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80003ac4:	00893503          	ld	a0,8(s2)
    80003ac8:	00001097          	auipc	ra,0x1
    80003acc:	b94080e7          	jalr	-1132(ra) # 8000465c <_ZN9BufferCPP3getEv>
        i++;
    80003ad0:	001a049b          	addiw	s1,s4,1
    80003ad4:	00048a1b          	sext.w	s4,s1
        putc(key);
    80003ad8:	0ff57513          	andi	a0,a0,255
    80003adc:	ffffe097          	auipc	ra,0xffffe
    80003ae0:	930080e7          	jalr	-1744(ra) # 8000140c <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003ae4:	00092703          	lw	a4,0(s2)
    80003ae8:	0027179b          	slliw	a5,a4,0x2
    80003aec:	00e787bb          	addw	a5,a5,a4
    80003af0:	02f4e7bb          	remw	a5,s1,a5
    80003af4:	fa0786e3          	beqz	a5,80003aa0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80003af8:	05000793          	li	a5,80
    80003afc:	02f4e4bb          	remw	s1,s1,a5
    80003b00:	fa049ce3          	bnez	s1,80003ab8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80003b04:	fa9ff06f          	j	80003aac <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80003b08:	0209b783          	ld	a5,32(s3)
    80003b0c:	0087b503          	ld	a0,8(a5)
    80003b10:	00001097          	auipc	ra,0x1
    80003b14:	b4c080e7          	jalr	-1204(ra) # 8000465c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80003b18:	0ff57513          	andi	a0,a0,255
    80003b1c:	00002097          	auipc	ra,0x2
    80003b20:	e04080e7          	jalr	-508(ra) # 80005920 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80003b24:	0209b783          	ld	a5,32(s3)
    80003b28:	0087b503          	ld	a0,8(a5)
    80003b2c:	00001097          	auipc	ra,0x1
    80003b30:	bbc080e7          	jalr	-1092(ra) # 800046e8 <_ZN9BufferCPP6getCntEv>
    80003b34:	fca04ae3          	bgtz	a0,80003b08 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80003b38:	01093503          	ld	a0,16(s2)
    80003b3c:	00002097          	auipc	ra,0x2
    80003b40:	ccc080e7          	jalr	-820(ra) # 80005808 <_ZN9Semaphore6signalEv>
}
    80003b44:	02813083          	ld	ra,40(sp)
    80003b48:	02013403          	ld	s0,32(sp)
    80003b4c:	01813483          	ld	s1,24(sp)
    80003b50:	01013903          	ld	s2,16(sp)
    80003b54:	00813983          	ld	s3,8(sp)
    80003b58:	00013a03          	ld	s4,0(sp)
    80003b5c:	03010113          	addi	sp,sp,48
    80003b60:	00008067          	ret

0000000080003b64 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80003b64:	f8010113          	addi	sp,sp,-128
    80003b68:	06113c23          	sd	ra,120(sp)
    80003b6c:	06813823          	sd	s0,112(sp)
    80003b70:	06913423          	sd	s1,104(sp)
    80003b74:	07213023          	sd	s2,96(sp)
    80003b78:	05313c23          	sd	s3,88(sp)
    80003b7c:	05413823          	sd	s4,80(sp)
    80003b80:	05513423          	sd	s5,72(sp)
    80003b84:	05613023          	sd	s6,64(sp)
    80003b88:	03713c23          	sd	s7,56(sp)
    80003b8c:	03813823          	sd	s8,48(sp)
    80003b90:	03913423          	sd	s9,40(sp)
    80003b94:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80003b98:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80003b9c:	00005517          	auipc	a0,0x5
    80003ba0:	6fc50513          	addi	a0,a0,1788 # 80009298 <CONSOLE_STATUS+0x288>
    80003ba4:	00000097          	auipc	ra,0x0
    80003ba8:	604080e7          	jalr	1540(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80003bac:	01e00593          	li	a1,30
    80003bb0:	f8040493          	addi	s1,s0,-128
    80003bb4:	00048513          	mv	a0,s1
    80003bb8:	00000097          	auipc	ra,0x0
    80003bbc:	678080e7          	jalr	1656(ra) # 80004230 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003bc0:	00048513          	mv	a0,s1
    80003bc4:	00000097          	auipc	ra,0x0
    80003bc8:	744080e7          	jalr	1860(ra) # 80004308 <_Z11stringToIntPKc>
    80003bcc:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80003bd0:	00005517          	auipc	a0,0x5
    80003bd4:	6e850513          	addi	a0,a0,1768 # 800092b8 <CONSOLE_STATUS+0x2a8>
    80003bd8:	00000097          	auipc	ra,0x0
    80003bdc:	5d0080e7          	jalr	1488(ra) # 800041a8 <_Z11printStringPKc>
    getString(input, 30);
    80003be0:	01e00593          	li	a1,30
    80003be4:	00048513          	mv	a0,s1
    80003be8:	00000097          	auipc	ra,0x0
    80003bec:	648080e7          	jalr	1608(ra) # 80004230 <_Z9getStringPci>
    n = stringToInt(input);
    80003bf0:	00048513          	mv	a0,s1
    80003bf4:	00000097          	auipc	ra,0x0
    80003bf8:	714080e7          	jalr	1812(ra) # 80004308 <_Z11stringToIntPKc>
    80003bfc:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003c00:	00005517          	auipc	a0,0x5
    80003c04:	6d850513          	addi	a0,a0,1752 # 800092d8 <CONSOLE_STATUS+0x2c8>
    80003c08:	00000097          	auipc	ra,0x0
    80003c0c:	5a0080e7          	jalr	1440(ra) # 800041a8 <_Z11printStringPKc>
    80003c10:	00000613          	li	a2,0
    80003c14:	00a00593          	li	a1,10
    80003c18:	00090513          	mv	a0,s2
    80003c1c:	00000097          	auipc	ra,0x0
    80003c20:	73c080e7          	jalr	1852(ra) # 80004358 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003c24:	00005517          	auipc	a0,0x5
    80003c28:	6cc50513          	addi	a0,a0,1740 # 800092f0 <CONSOLE_STATUS+0x2e0>
    80003c2c:	00000097          	auipc	ra,0x0
    80003c30:	57c080e7          	jalr	1404(ra) # 800041a8 <_Z11printStringPKc>
    80003c34:	00000613          	li	a2,0
    80003c38:	00a00593          	li	a1,10
    80003c3c:	00048513          	mv	a0,s1
    80003c40:	00000097          	auipc	ra,0x0
    80003c44:	718080e7          	jalr	1816(ra) # 80004358 <_Z8printIntiii>
    printString(".\n");
    80003c48:	00005517          	auipc	a0,0x5
    80003c4c:	6c050513          	addi	a0,a0,1728 # 80009308 <CONSOLE_STATUS+0x2f8>
    80003c50:	00000097          	auipc	ra,0x0
    80003c54:	558080e7          	jalr	1368(ra) # 800041a8 <_Z11printStringPKc>
    if(threadNum > n) {
    80003c58:	0324c463          	blt	s1,s2,80003c80 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80003c5c:	03205c63          	blez	s2,80003c94 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003c60:	03800513          	li	a0,56
    80003c64:	00002097          	auipc	ra,0x2
    80003c68:	8e4080e7          	jalr	-1820(ra) # 80005548 <_Znwm>
    80003c6c:	00050a93          	mv	s5,a0
    80003c70:	00048593          	mv	a1,s1
    80003c74:	00001097          	auipc	ra,0x1
    80003c78:	804080e7          	jalr	-2044(ra) # 80004478 <_ZN9BufferCPPC1Ei>
    80003c7c:	0300006f          	j	80003cac <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003c80:	00005517          	auipc	a0,0x5
    80003c84:	69050513          	addi	a0,a0,1680 # 80009310 <CONSOLE_STATUS+0x300>
    80003c88:	00000097          	auipc	ra,0x0
    80003c8c:	520080e7          	jalr	1312(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80003c90:	0140006f          	j	80003ca4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003c94:	00005517          	auipc	a0,0x5
    80003c98:	6bc50513          	addi	a0,a0,1724 # 80009350 <CONSOLE_STATUS+0x340>
    80003c9c:	00000097          	auipc	ra,0x0
    80003ca0:	50c080e7          	jalr	1292(ra) # 800041a8 <_Z11printStringPKc>
        return;
    80003ca4:	000b8113          	mv	sp,s7
    80003ca8:	2380006f          	j	80003ee0 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80003cac:	01000513          	li	a0,16
    80003cb0:	00002097          	auipc	ra,0x2
    80003cb4:	898080e7          	jalr	-1896(ra) # 80005548 <_Znwm>
    80003cb8:	00050493          	mv	s1,a0
    80003cbc:	00000593          	li	a1,0
    80003cc0:	00002097          	auipc	ra,0x2
    80003cc4:	ae4080e7          	jalr	-1308(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    80003cc8:	00008797          	auipc	a5,0x8
    80003ccc:	d497b823          	sd	s1,-688(a5) # 8000ba18 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80003cd0:	00391793          	slli	a5,s2,0x3
    80003cd4:	00f78793          	addi	a5,a5,15
    80003cd8:	ff07f793          	andi	a5,a5,-16
    80003cdc:	40f10133          	sub	sp,sp,a5
    80003ce0:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80003ce4:	0019071b          	addiw	a4,s2,1
    80003ce8:	00171793          	slli	a5,a4,0x1
    80003cec:	00e787b3          	add	a5,a5,a4
    80003cf0:	00379793          	slli	a5,a5,0x3
    80003cf4:	00f78793          	addi	a5,a5,15
    80003cf8:	ff07f793          	andi	a5,a5,-16
    80003cfc:	40f10133          	sub	sp,sp,a5
    80003d00:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80003d04:	00191c13          	slli	s8,s2,0x1
    80003d08:	012c07b3          	add	a5,s8,s2
    80003d0c:	00379793          	slli	a5,a5,0x3
    80003d10:	00fa07b3          	add	a5,s4,a5
    80003d14:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003d18:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80003d1c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80003d20:	02800513          	li	a0,40
    80003d24:	00002097          	auipc	ra,0x2
    80003d28:	824080e7          	jalr	-2012(ra) # 80005548 <_Znwm>
    80003d2c:	00050b13          	mv	s6,a0
    80003d30:	012c0c33          	add	s8,s8,s2
    80003d34:	003c1c13          	slli	s8,s8,0x3
    80003d38:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80003d3c:	00002097          	auipc	ra,0x2
    80003d40:	a3c080e7          	jalr	-1476(ra) # 80005778 <_ZN6ThreadC1Ev>
    80003d44:	00008797          	auipc	a5,0x8
    80003d48:	adc78793          	addi	a5,a5,-1316 # 8000b820 <_ZTV12ConsumerSync+0x10>
    80003d4c:	00fb3023          	sd	a5,0(s6)
    80003d50:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80003d54:	000b0513          	mv	a0,s6
    80003d58:	00002097          	auipc	ra,0x2
    80003d5c:	998080e7          	jalr	-1640(ra) # 800056f0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003d60:	00000493          	li	s1,0
    80003d64:	0380006f          	j	80003d9c <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80003d68:	00008797          	auipc	a5,0x8
    80003d6c:	a9078793          	addi	a5,a5,-1392 # 8000b7f8 <_ZTV12ProducerSync+0x10>
    80003d70:	00fcb023          	sd	a5,0(s9)
    80003d74:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    80003d78:	00349793          	slli	a5,s1,0x3
    80003d7c:	00f987b3          	add	a5,s3,a5
    80003d80:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80003d84:	00349793          	slli	a5,s1,0x3
    80003d88:	00f987b3          	add	a5,s3,a5
    80003d8c:	0007b503          	ld	a0,0(a5)
    80003d90:	00002097          	auipc	ra,0x2
    80003d94:	960080e7          	jalr	-1696(ra) # 800056f0 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80003d98:	0014849b          	addiw	s1,s1,1
    80003d9c:	0b24d063          	bge	s1,s2,80003e3c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80003da0:	00149793          	slli	a5,s1,0x1
    80003da4:	009787b3          	add	a5,a5,s1
    80003da8:	00379793          	slli	a5,a5,0x3
    80003dac:	00fa07b3          	add	a5,s4,a5
    80003db0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003db4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80003db8:	00008717          	auipc	a4,0x8
    80003dbc:	c6073703          	ld	a4,-928(a4) # 8000ba18 <_ZL10waitForAll>
    80003dc0:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80003dc4:	02905863          	blez	s1,80003df4 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80003dc8:	02800513          	li	a0,40
    80003dcc:	00001097          	auipc	ra,0x1
    80003dd0:	77c080e7          	jalr	1916(ra) # 80005548 <_Znwm>
    80003dd4:	00050c93          	mv	s9,a0
    80003dd8:	00149c13          	slli	s8,s1,0x1
    80003ddc:	009c0c33          	add	s8,s8,s1
    80003de0:	003c1c13          	slli	s8,s8,0x3
    80003de4:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80003de8:	00002097          	auipc	ra,0x2
    80003dec:	990080e7          	jalr	-1648(ra) # 80005778 <_ZN6ThreadC1Ev>
    80003df0:	f79ff06f          	j	80003d68 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80003df4:	02800513          	li	a0,40
    80003df8:	00001097          	auipc	ra,0x1
    80003dfc:	750080e7          	jalr	1872(ra) # 80005548 <_Znwm>
    80003e00:	00050c93          	mv	s9,a0
    80003e04:	00149c13          	slli	s8,s1,0x1
    80003e08:	009c0c33          	add	s8,s8,s1
    80003e0c:	003c1c13          	slli	s8,s8,0x3
    80003e10:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80003e14:	00002097          	auipc	ra,0x2
    80003e18:	964080e7          	jalr	-1692(ra) # 80005778 <_ZN6ThreadC1Ev>
    80003e1c:	00008797          	auipc	a5,0x8
    80003e20:	9b478793          	addi	a5,a5,-1612 # 8000b7d0 <_ZTV16ProducerKeyboard+0x10>
    80003e24:	00fcb023          	sd	a5,0(s9)
    80003e28:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80003e2c:	00349793          	slli	a5,s1,0x3
    80003e30:	00f987b3          	add	a5,s3,a5
    80003e34:	0197b023          	sd	s9,0(a5)
    80003e38:	f4dff06f          	j	80003d84 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80003e3c:	00002097          	auipc	ra,0x2
    80003e40:	8ec080e7          	jalr	-1812(ra) # 80005728 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003e44:	00000493          	li	s1,0
    80003e48:	00994e63          	blt	s2,s1,80003e64 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80003e4c:	00008517          	auipc	a0,0x8
    80003e50:	bcc53503          	ld	a0,-1076(a0) # 8000ba18 <_ZL10waitForAll>
    80003e54:	00002097          	auipc	ra,0x2
    80003e58:	988080e7          	jalr	-1656(ra) # 800057dc <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003e5c:	0014849b          	addiw	s1,s1,1
    80003e60:	fe9ff06f          	j	80003e48 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80003e64:	00000493          	li	s1,0
    80003e68:	0080006f          	j	80003e70 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80003e6c:	0014849b          	addiw	s1,s1,1
    80003e70:	0324d263          	bge	s1,s2,80003e94 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80003e74:	00349793          	slli	a5,s1,0x3
    80003e78:	00f987b3          	add	a5,s3,a5
    80003e7c:	0007b503          	ld	a0,0(a5)
    80003e80:	fe0506e3          	beqz	a0,80003e6c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80003e84:	00053783          	ld	a5,0(a0)
    80003e88:	0087b783          	ld	a5,8(a5)
    80003e8c:	000780e7          	jalr	a5
    80003e90:	fddff06f          	j	80003e6c <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80003e94:	000b0a63          	beqz	s6,80003ea8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80003e98:	000b3783          	ld	a5,0(s6)
    80003e9c:	0087b783          	ld	a5,8(a5)
    80003ea0:	000b0513          	mv	a0,s6
    80003ea4:	000780e7          	jalr	a5
    delete waitForAll;
    80003ea8:	00008517          	auipc	a0,0x8
    80003eac:	b7053503          	ld	a0,-1168(a0) # 8000ba18 <_ZL10waitForAll>
    80003eb0:	00050863          	beqz	a0,80003ec0 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80003eb4:	00053783          	ld	a5,0(a0)
    80003eb8:	0087b783          	ld	a5,8(a5)
    80003ebc:	000780e7          	jalr	a5
    delete buffer;
    80003ec0:	000a8e63          	beqz	s5,80003edc <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80003ec4:	000a8513          	mv	a0,s5
    80003ec8:	00001097          	auipc	ra,0x1
    80003ecc:	8a8080e7          	jalr	-1880(ra) # 80004770 <_ZN9BufferCPPD1Ev>
    80003ed0:	000a8513          	mv	a0,s5
    80003ed4:	00001097          	auipc	ra,0x1
    80003ed8:	6c4080e7          	jalr	1732(ra) # 80005598 <_ZdlPv>
    80003edc:	000b8113          	mv	sp,s7

}
    80003ee0:	f8040113          	addi	sp,s0,-128
    80003ee4:	07813083          	ld	ra,120(sp)
    80003ee8:	07013403          	ld	s0,112(sp)
    80003eec:	06813483          	ld	s1,104(sp)
    80003ef0:	06013903          	ld	s2,96(sp)
    80003ef4:	05813983          	ld	s3,88(sp)
    80003ef8:	05013a03          	ld	s4,80(sp)
    80003efc:	04813a83          	ld	s5,72(sp)
    80003f00:	04013b03          	ld	s6,64(sp)
    80003f04:	03813b83          	ld	s7,56(sp)
    80003f08:	03013c03          	ld	s8,48(sp)
    80003f0c:	02813c83          	ld	s9,40(sp)
    80003f10:	08010113          	addi	sp,sp,128
    80003f14:	00008067          	ret
    80003f18:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003f1c:	000a8513          	mv	a0,s5
    80003f20:	00001097          	auipc	ra,0x1
    80003f24:	678080e7          	jalr	1656(ra) # 80005598 <_ZdlPv>
    80003f28:	00048513          	mv	a0,s1
    80003f2c:	00009097          	auipc	ra,0x9
    80003f30:	c2c080e7          	jalr	-980(ra) # 8000cb58 <_Unwind_Resume>
    80003f34:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80003f38:	00048513          	mv	a0,s1
    80003f3c:	00001097          	auipc	ra,0x1
    80003f40:	65c080e7          	jalr	1628(ra) # 80005598 <_ZdlPv>
    80003f44:	00090513          	mv	a0,s2
    80003f48:	00009097          	auipc	ra,0x9
    80003f4c:	c10080e7          	jalr	-1008(ra) # 8000cb58 <_Unwind_Resume>
    80003f50:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80003f54:	000b0513          	mv	a0,s6
    80003f58:	00001097          	auipc	ra,0x1
    80003f5c:	640080e7          	jalr	1600(ra) # 80005598 <_ZdlPv>
    80003f60:	00048513          	mv	a0,s1
    80003f64:	00009097          	auipc	ra,0x9
    80003f68:	bf4080e7          	jalr	-1036(ra) # 8000cb58 <_Unwind_Resume>
    80003f6c:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80003f70:	000c8513          	mv	a0,s9
    80003f74:	00001097          	auipc	ra,0x1
    80003f78:	624080e7          	jalr	1572(ra) # 80005598 <_ZdlPv>
    80003f7c:	00048513          	mv	a0,s1
    80003f80:	00009097          	auipc	ra,0x9
    80003f84:	bd8080e7          	jalr	-1064(ra) # 8000cb58 <_Unwind_Resume>
    80003f88:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80003f8c:	000c8513          	mv	a0,s9
    80003f90:	00001097          	auipc	ra,0x1
    80003f94:	608080e7          	jalr	1544(ra) # 80005598 <_ZdlPv>
    80003f98:	00048513          	mv	a0,s1
    80003f9c:	00009097          	auipc	ra,0x9
    80003fa0:	bbc080e7          	jalr	-1092(ra) # 8000cb58 <_Unwind_Resume>

0000000080003fa4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80003fa4:	ff010113          	addi	sp,sp,-16
    80003fa8:	00113423          	sd	ra,8(sp)
    80003fac:	00813023          	sd	s0,0(sp)
    80003fb0:	01010413          	addi	s0,sp,16
    80003fb4:	00008797          	auipc	a5,0x8
    80003fb8:	86c78793          	addi	a5,a5,-1940 # 8000b820 <_ZTV12ConsumerSync+0x10>
    80003fbc:	00f53023          	sd	a5,0(a0)
    80003fc0:	00001097          	auipc	ra,0x1
    80003fc4:	600080e7          	jalr	1536(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80003fc8:	00813083          	ld	ra,8(sp)
    80003fcc:	00013403          	ld	s0,0(sp)
    80003fd0:	01010113          	addi	sp,sp,16
    80003fd4:	00008067          	ret

0000000080003fd8 <_ZN12ConsumerSyncD0Ev>:
    80003fd8:	fe010113          	addi	sp,sp,-32
    80003fdc:	00113c23          	sd	ra,24(sp)
    80003fe0:	00813823          	sd	s0,16(sp)
    80003fe4:	00913423          	sd	s1,8(sp)
    80003fe8:	02010413          	addi	s0,sp,32
    80003fec:	00050493          	mv	s1,a0
    80003ff0:	00008797          	auipc	a5,0x8
    80003ff4:	83078793          	addi	a5,a5,-2000 # 8000b820 <_ZTV12ConsumerSync+0x10>
    80003ff8:	00f53023          	sd	a5,0(a0)
    80003ffc:	00001097          	auipc	ra,0x1
    80004000:	5c4080e7          	jalr	1476(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80004004:	00048513          	mv	a0,s1
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	590080e7          	jalr	1424(ra) # 80005598 <_ZdlPv>
    80004010:	01813083          	ld	ra,24(sp)
    80004014:	01013403          	ld	s0,16(sp)
    80004018:	00813483          	ld	s1,8(sp)
    8000401c:	02010113          	addi	sp,sp,32
    80004020:	00008067          	ret

0000000080004024 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004024:	ff010113          	addi	sp,sp,-16
    80004028:	00113423          	sd	ra,8(sp)
    8000402c:	00813023          	sd	s0,0(sp)
    80004030:	01010413          	addi	s0,sp,16
    80004034:	00007797          	auipc	a5,0x7
    80004038:	7c478793          	addi	a5,a5,1988 # 8000b7f8 <_ZTV12ProducerSync+0x10>
    8000403c:	00f53023          	sd	a5,0(a0)
    80004040:	00001097          	auipc	ra,0x1
    80004044:	580080e7          	jalr	1408(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80004048:	00813083          	ld	ra,8(sp)
    8000404c:	00013403          	ld	s0,0(sp)
    80004050:	01010113          	addi	sp,sp,16
    80004054:	00008067          	ret

0000000080004058 <_ZN12ProducerSyncD0Ev>:
    80004058:	fe010113          	addi	sp,sp,-32
    8000405c:	00113c23          	sd	ra,24(sp)
    80004060:	00813823          	sd	s0,16(sp)
    80004064:	00913423          	sd	s1,8(sp)
    80004068:	02010413          	addi	s0,sp,32
    8000406c:	00050493          	mv	s1,a0
    80004070:	00007797          	auipc	a5,0x7
    80004074:	78878793          	addi	a5,a5,1928 # 8000b7f8 <_ZTV12ProducerSync+0x10>
    80004078:	00f53023          	sd	a5,0(a0)
    8000407c:	00001097          	auipc	ra,0x1
    80004080:	544080e7          	jalr	1348(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80004084:	00048513          	mv	a0,s1
    80004088:	00001097          	auipc	ra,0x1
    8000408c:	510080e7          	jalr	1296(ra) # 80005598 <_ZdlPv>
    80004090:	01813083          	ld	ra,24(sp)
    80004094:	01013403          	ld	s0,16(sp)
    80004098:	00813483          	ld	s1,8(sp)
    8000409c:	02010113          	addi	sp,sp,32
    800040a0:	00008067          	ret

00000000800040a4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800040a4:	ff010113          	addi	sp,sp,-16
    800040a8:	00113423          	sd	ra,8(sp)
    800040ac:	00813023          	sd	s0,0(sp)
    800040b0:	01010413          	addi	s0,sp,16
    800040b4:	00007797          	auipc	a5,0x7
    800040b8:	71c78793          	addi	a5,a5,1820 # 8000b7d0 <_ZTV16ProducerKeyboard+0x10>
    800040bc:	00f53023          	sd	a5,0(a0)
    800040c0:	00001097          	auipc	ra,0x1
    800040c4:	500080e7          	jalr	1280(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800040c8:	00813083          	ld	ra,8(sp)
    800040cc:	00013403          	ld	s0,0(sp)
    800040d0:	01010113          	addi	sp,sp,16
    800040d4:	00008067          	ret

00000000800040d8 <_ZN16ProducerKeyboardD0Ev>:
    800040d8:	fe010113          	addi	sp,sp,-32
    800040dc:	00113c23          	sd	ra,24(sp)
    800040e0:	00813823          	sd	s0,16(sp)
    800040e4:	00913423          	sd	s1,8(sp)
    800040e8:	02010413          	addi	s0,sp,32
    800040ec:	00050493          	mv	s1,a0
    800040f0:	00007797          	auipc	a5,0x7
    800040f4:	6e078793          	addi	a5,a5,1760 # 8000b7d0 <_ZTV16ProducerKeyboard+0x10>
    800040f8:	00f53023          	sd	a5,0(a0)
    800040fc:	00001097          	auipc	ra,0x1
    80004100:	4c4080e7          	jalr	1220(ra) # 800055c0 <_ZN6ThreadD1Ev>
    80004104:	00048513          	mv	a0,s1
    80004108:	00001097          	auipc	ra,0x1
    8000410c:	490080e7          	jalr	1168(ra) # 80005598 <_ZdlPv>
    80004110:	01813083          	ld	ra,24(sp)
    80004114:	01013403          	ld	s0,16(sp)
    80004118:	00813483          	ld	s1,8(sp)
    8000411c:	02010113          	addi	sp,sp,32
    80004120:	00008067          	ret

0000000080004124 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004124:	ff010113          	addi	sp,sp,-16
    80004128:	00113423          	sd	ra,8(sp)
    8000412c:	00813023          	sd	s0,0(sp)
    80004130:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004134:	02053583          	ld	a1,32(a0)
    80004138:	fffff097          	auipc	ra,0xfffff
    8000413c:	7e4080e7          	jalr	2020(ra) # 8000391c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004140:	00813083          	ld	ra,8(sp)
    80004144:	00013403          	ld	s0,0(sp)
    80004148:	01010113          	addi	sp,sp,16
    8000414c:	00008067          	ret

0000000080004150 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004150:	ff010113          	addi	sp,sp,-16
    80004154:	00113423          	sd	ra,8(sp)
    80004158:	00813023          	sd	s0,0(sp)
    8000415c:	01010413          	addi	s0,sp,16
        producer(td);
    80004160:	02053583          	ld	a1,32(a0)
    80004164:	00000097          	auipc	ra,0x0
    80004168:	878080e7          	jalr	-1928(ra) # 800039dc <_ZN12ProducerSync8producerEPv>
    }
    8000416c:	00813083          	ld	ra,8(sp)
    80004170:	00013403          	ld	s0,0(sp)
    80004174:	01010113          	addi	sp,sp,16
    80004178:	00008067          	ret

000000008000417c <_ZN12ConsumerSync3runEv>:
    void run() override {
    8000417c:	ff010113          	addi	sp,sp,-16
    80004180:	00113423          	sd	ra,8(sp)
    80004184:	00813023          	sd	s0,0(sp)
    80004188:	01010413          	addi	s0,sp,16
        consumer(td);
    8000418c:	02053583          	ld	a1,32(a0)
    80004190:	00000097          	auipc	ra,0x0
    80004194:	8e0080e7          	jalr	-1824(ra) # 80003a70 <_ZN12ConsumerSync8consumerEPv>
    }
    80004198:	00813083          	ld	ra,8(sp)
    8000419c:	00013403          	ld	s0,0(sp)
    800041a0:	01010113          	addi	sp,sp,16
    800041a4:	00008067          	ret

00000000800041a8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800041a8:	fe010113          	addi	sp,sp,-32
    800041ac:	00113c23          	sd	ra,24(sp)
    800041b0:	00813823          	sd	s0,16(sp)
    800041b4:	00913423          	sd	s1,8(sp)
    800041b8:	02010413          	addi	s0,sp,32
    800041bc:	00050493          	mv	s1,a0
    LOCK();
    800041c0:	00100613          	li	a2,1
    800041c4:	00000593          	li	a1,0
    800041c8:	00008517          	auipc	a0,0x8
    800041cc:	85850513          	addi	a0,a0,-1960 # 8000ba20 <lockPrint>
    800041d0:	ffffd097          	auipc	ra,0xffffd
    800041d4:	f30080e7          	jalr	-208(ra) # 80001100 <copy_and_swap>
    800041d8:	00050863          	beqz	a0,800041e8 <_Z11printStringPKc+0x40>
    800041dc:	ffffd097          	auipc	ra,0xffffd
    800041e0:	1b4080e7          	jalr	436(ra) # 80001390 <_Z15thread_dispatchv>
    800041e4:	fddff06f          	j	800041c0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800041e8:	0004c503          	lbu	a0,0(s1)
    800041ec:	00050a63          	beqz	a0,80004200 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    800041f0:	ffffd097          	auipc	ra,0xffffd
    800041f4:	21c080e7          	jalr	540(ra) # 8000140c <_Z4putcc>
        string++;
    800041f8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    800041fc:	fedff06f          	j	800041e8 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004200:	00000613          	li	a2,0
    80004204:	00100593          	li	a1,1
    80004208:	00008517          	auipc	a0,0x8
    8000420c:	81850513          	addi	a0,a0,-2024 # 8000ba20 <lockPrint>
    80004210:	ffffd097          	auipc	ra,0xffffd
    80004214:	ef0080e7          	jalr	-272(ra) # 80001100 <copy_and_swap>
    80004218:	fe0514e3          	bnez	a0,80004200 <_Z11printStringPKc+0x58>
}
    8000421c:	01813083          	ld	ra,24(sp)
    80004220:	01013403          	ld	s0,16(sp)
    80004224:	00813483          	ld	s1,8(sp)
    80004228:	02010113          	addi	sp,sp,32
    8000422c:	00008067          	ret

0000000080004230 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80004230:	fd010113          	addi	sp,sp,-48
    80004234:	02113423          	sd	ra,40(sp)
    80004238:	02813023          	sd	s0,32(sp)
    8000423c:	00913c23          	sd	s1,24(sp)
    80004240:	01213823          	sd	s2,16(sp)
    80004244:	01313423          	sd	s3,8(sp)
    80004248:	01413023          	sd	s4,0(sp)
    8000424c:	03010413          	addi	s0,sp,48
    80004250:	00050993          	mv	s3,a0
    80004254:	00058a13          	mv	s4,a1
    LOCK();
    80004258:	00100613          	li	a2,1
    8000425c:	00000593          	li	a1,0
    80004260:	00007517          	auipc	a0,0x7
    80004264:	7c050513          	addi	a0,a0,1984 # 8000ba20 <lockPrint>
    80004268:	ffffd097          	auipc	ra,0xffffd
    8000426c:	e98080e7          	jalr	-360(ra) # 80001100 <copy_and_swap>
    80004270:	00050863          	beqz	a0,80004280 <_Z9getStringPci+0x50>
    80004274:	ffffd097          	auipc	ra,0xffffd
    80004278:	11c080e7          	jalr	284(ra) # 80001390 <_Z15thread_dispatchv>
    8000427c:	fddff06f          	j	80004258 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80004280:	00000913          	li	s2,0
    80004284:	00090493          	mv	s1,s2
    80004288:	0019091b          	addiw	s2,s2,1
    8000428c:	03495a63          	bge	s2,s4,800042c0 <_Z9getStringPci+0x90>
        cc = getc();
    80004290:	ffffd097          	auipc	ra,0xffffd
    80004294:	13c080e7          	jalr	316(ra) # 800013cc <_Z4getcv>
        if(cc < 1)
    80004298:	02050463          	beqz	a0,800042c0 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    8000429c:	009984b3          	add	s1,s3,s1
    800042a0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800042a4:	00a00793          	li	a5,10
    800042a8:	00f50a63          	beq	a0,a5,800042bc <_Z9getStringPci+0x8c>
    800042ac:	00d00793          	li	a5,13
    800042b0:	fcf51ae3          	bne	a0,a5,80004284 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800042b4:	00090493          	mv	s1,s2
    800042b8:	0080006f          	j	800042c0 <_Z9getStringPci+0x90>
    800042bc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800042c0:	009984b3          	add	s1,s3,s1
    800042c4:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800042c8:	00000613          	li	a2,0
    800042cc:	00100593          	li	a1,1
    800042d0:	00007517          	auipc	a0,0x7
    800042d4:	75050513          	addi	a0,a0,1872 # 8000ba20 <lockPrint>
    800042d8:	ffffd097          	auipc	ra,0xffffd
    800042dc:	e28080e7          	jalr	-472(ra) # 80001100 <copy_and_swap>
    800042e0:	fe0514e3          	bnez	a0,800042c8 <_Z9getStringPci+0x98>
    return buf;
}
    800042e4:	00098513          	mv	a0,s3
    800042e8:	02813083          	ld	ra,40(sp)
    800042ec:	02013403          	ld	s0,32(sp)
    800042f0:	01813483          	ld	s1,24(sp)
    800042f4:	01013903          	ld	s2,16(sp)
    800042f8:	00813983          	ld	s3,8(sp)
    800042fc:	00013a03          	ld	s4,0(sp)
    80004300:	03010113          	addi	sp,sp,48
    80004304:	00008067          	ret

0000000080004308 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80004308:	ff010113          	addi	sp,sp,-16
    8000430c:	00813423          	sd	s0,8(sp)
    80004310:	01010413          	addi	s0,sp,16
    80004314:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80004318:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    8000431c:	0006c603          	lbu	a2,0(a3)
    80004320:	fd06071b          	addiw	a4,a2,-48
    80004324:	0ff77713          	andi	a4,a4,255
    80004328:	00900793          	li	a5,9
    8000432c:	02e7e063          	bltu	a5,a4,8000434c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80004330:	0025179b          	slliw	a5,a0,0x2
    80004334:	00a787bb          	addw	a5,a5,a0
    80004338:	0017979b          	slliw	a5,a5,0x1
    8000433c:	00168693          	addi	a3,a3,1
    80004340:	00c787bb          	addw	a5,a5,a2
    80004344:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80004348:	fd5ff06f          	j	8000431c <_Z11stringToIntPKc+0x14>
    return n;
}
    8000434c:	00813403          	ld	s0,8(sp)
    80004350:	01010113          	addi	sp,sp,16
    80004354:	00008067          	ret

0000000080004358 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80004358:	fc010113          	addi	sp,sp,-64
    8000435c:	02113c23          	sd	ra,56(sp)
    80004360:	02813823          	sd	s0,48(sp)
    80004364:	02913423          	sd	s1,40(sp)
    80004368:	03213023          	sd	s2,32(sp)
    8000436c:	01313c23          	sd	s3,24(sp)
    80004370:	04010413          	addi	s0,sp,64
    80004374:	00050493          	mv	s1,a0
    80004378:	00058913          	mv	s2,a1
    8000437c:	00060993          	mv	s3,a2
    LOCK();
    80004380:	00100613          	li	a2,1
    80004384:	00000593          	li	a1,0
    80004388:	00007517          	auipc	a0,0x7
    8000438c:	69850513          	addi	a0,a0,1688 # 8000ba20 <lockPrint>
    80004390:	ffffd097          	auipc	ra,0xffffd
    80004394:	d70080e7          	jalr	-656(ra) # 80001100 <copy_and_swap>
    80004398:	00050863          	beqz	a0,800043a8 <_Z8printIntiii+0x50>
    8000439c:	ffffd097          	auipc	ra,0xffffd
    800043a0:	ff4080e7          	jalr	-12(ra) # 80001390 <_Z15thread_dispatchv>
    800043a4:	fddff06f          	j	80004380 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800043a8:	00098463          	beqz	s3,800043b0 <_Z8printIntiii+0x58>
    800043ac:	0804c463          	bltz	s1,80004434 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800043b0:	0004851b          	sext.w	a0,s1
    neg = 0;
    800043b4:	00000593          	li	a1,0
    }

    i = 0;
    800043b8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800043bc:	0009079b          	sext.w	a5,s2
    800043c0:	0325773b          	remuw	a4,a0,s2
    800043c4:	00048613          	mv	a2,s1
    800043c8:	0014849b          	addiw	s1,s1,1
    800043cc:	02071693          	slli	a3,a4,0x20
    800043d0:	0206d693          	srli	a3,a3,0x20
    800043d4:	00007717          	auipc	a4,0x7
    800043d8:	46470713          	addi	a4,a4,1124 # 8000b838 <digits>
    800043dc:	00d70733          	add	a4,a4,a3
    800043e0:	00074683          	lbu	a3,0(a4)
    800043e4:	fd040713          	addi	a4,s0,-48
    800043e8:	00c70733          	add	a4,a4,a2
    800043ec:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800043f0:	0005071b          	sext.w	a4,a0
    800043f4:	0325553b          	divuw	a0,a0,s2
    800043f8:	fcf772e3          	bgeu	a4,a5,800043bc <_Z8printIntiii+0x64>
    if(neg)
    800043fc:	00058c63          	beqz	a1,80004414 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80004400:	fd040793          	addi	a5,s0,-48
    80004404:	009784b3          	add	s1,a5,s1
    80004408:	02d00793          	li	a5,45
    8000440c:	fef48823          	sb	a5,-16(s1)
    80004410:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80004414:	fff4849b          	addiw	s1,s1,-1
    80004418:	0204c463          	bltz	s1,80004440 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    8000441c:	fd040793          	addi	a5,s0,-48
    80004420:	009787b3          	add	a5,a5,s1
    80004424:	ff07c503          	lbu	a0,-16(a5)
    80004428:	ffffd097          	auipc	ra,0xffffd
    8000442c:	fe4080e7          	jalr	-28(ra) # 8000140c <_Z4putcc>
    80004430:	fe5ff06f          	j	80004414 <_Z8printIntiii+0xbc>
        x = -xx;
    80004434:	4090053b          	negw	a0,s1
        neg = 1;
    80004438:	00100593          	li	a1,1
        x = -xx;
    8000443c:	f7dff06f          	j	800043b8 <_Z8printIntiii+0x60>

    UNLOCK();
    80004440:	00000613          	li	a2,0
    80004444:	00100593          	li	a1,1
    80004448:	00007517          	auipc	a0,0x7
    8000444c:	5d850513          	addi	a0,a0,1496 # 8000ba20 <lockPrint>
    80004450:	ffffd097          	auipc	ra,0xffffd
    80004454:	cb0080e7          	jalr	-848(ra) # 80001100 <copy_and_swap>
    80004458:	fe0514e3          	bnez	a0,80004440 <_Z8printIntiii+0xe8>
    8000445c:	03813083          	ld	ra,56(sp)
    80004460:	03013403          	ld	s0,48(sp)
    80004464:	02813483          	ld	s1,40(sp)
    80004468:	02013903          	ld	s2,32(sp)
    8000446c:	01813983          	ld	s3,24(sp)
    80004470:	04010113          	addi	sp,sp,64
    80004474:	00008067          	ret

0000000080004478 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004478:	fd010113          	addi	sp,sp,-48
    8000447c:	02113423          	sd	ra,40(sp)
    80004480:	02813023          	sd	s0,32(sp)
    80004484:	00913c23          	sd	s1,24(sp)
    80004488:	01213823          	sd	s2,16(sp)
    8000448c:	01313423          	sd	s3,8(sp)
    80004490:	03010413          	addi	s0,sp,48
    80004494:	00050493          	mv	s1,a0
    80004498:	00058913          	mv	s2,a1
    8000449c:	0015879b          	addiw	a5,a1,1
    800044a0:	0007851b          	sext.w	a0,a5
    800044a4:	00f4a023          	sw	a5,0(s1)
    800044a8:	0004a823          	sw	zero,16(s1)
    800044ac:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800044b0:	00251513          	slli	a0,a0,0x2
    800044b4:	ffffd097          	auipc	ra,0xffffd
    800044b8:	d88080e7          	jalr	-632(ra) # 8000123c <_Z9mem_allocm>
    800044bc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800044c0:	01000513          	li	a0,16
    800044c4:	00001097          	auipc	ra,0x1
    800044c8:	084080e7          	jalr	132(ra) # 80005548 <_Znwm>
    800044cc:	00050993          	mv	s3,a0
    800044d0:	00000593          	li	a1,0
    800044d4:	00001097          	auipc	ra,0x1
    800044d8:	2d0080e7          	jalr	720(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    800044dc:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800044e0:	01000513          	li	a0,16
    800044e4:	00001097          	auipc	ra,0x1
    800044e8:	064080e7          	jalr	100(ra) # 80005548 <_Znwm>
    800044ec:	00050993          	mv	s3,a0
    800044f0:	00090593          	mv	a1,s2
    800044f4:	00001097          	auipc	ra,0x1
    800044f8:	2b0080e7          	jalr	688(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    800044fc:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80004500:	01000513          	li	a0,16
    80004504:	00001097          	auipc	ra,0x1
    80004508:	044080e7          	jalr	68(ra) # 80005548 <_Znwm>
    8000450c:	00050913          	mv	s2,a0
    80004510:	00100593          	li	a1,1
    80004514:	00001097          	auipc	ra,0x1
    80004518:	290080e7          	jalr	656(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    8000451c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80004520:	01000513          	li	a0,16
    80004524:	00001097          	auipc	ra,0x1
    80004528:	024080e7          	jalr	36(ra) # 80005548 <_Znwm>
    8000452c:	00050913          	mv	s2,a0
    80004530:	00100593          	li	a1,1
    80004534:	00001097          	auipc	ra,0x1
    80004538:	270080e7          	jalr	624(ra) # 800057a4 <_ZN9SemaphoreC1Ej>
    8000453c:	0324b823          	sd	s2,48(s1)
}
    80004540:	02813083          	ld	ra,40(sp)
    80004544:	02013403          	ld	s0,32(sp)
    80004548:	01813483          	ld	s1,24(sp)
    8000454c:	01013903          	ld	s2,16(sp)
    80004550:	00813983          	ld	s3,8(sp)
    80004554:	03010113          	addi	sp,sp,48
    80004558:	00008067          	ret
    8000455c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80004560:	00098513          	mv	a0,s3
    80004564:	00001097          	auipc	ra,0x1
    80004568:	034080e7          	jalr	52(ra) # 80005598 <_ZdlPv>
    8000456c:	00048513          	mv	a0,s1
    80004570:	00008097          	auipc	ra,0x8
    80004574:	5e8080e7          	jalr	1512(ra) # 8000cb58 <_Unwind_Resume>
    80004578:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    8000457c:	00098513          	mv	a0,s3
    80004580:	00001097          	auipc	ra,0x1
    80004584:	018080e7          	jalr	24(ra) # 80005598 <_ZdlPv>
    80004588:	00048513          	mv	a0,s1
    8000458c:	00008097          	auipc	ra,0x8
    80004590:	5cc080e7          	jalr	1484(ra) # 8000cb58 <_Unwind_Resume>
    80004594:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80004598:	00090513          	mv	a0,s2
    8000459c:	00001097          	auipc	ra,0x1
    800045a0:	ffc080e7          	jalr	-4(ra) # 80005598 <_ZdlPv>
    800045a4:	00048513          	mv	a0,s1
    800045a8:	00008097          	auipc	ra,0x8
    800045ac:	5b0080e7          	jalr	1456(ra) # 8000cb58 <_Unwind_Resume>
    800045b0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800045b4:	00090513          	mv	a0,s2
    800045b8:	00001097          	auipc	ra,0x1
    800045bc:	fe0080e7          	jalr	-32(ra) # 80005598 <_ZdlPv>
    800045c0:	00048513          	mv	a0,s1
    800045c4:	00008097          	auipc	ra,0x8
    800045c8:	594080e7          	jalr	1428(ra) # 8000cb58 <_Unwind_Resume>

00000000800045cc <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800045cc:	fe010113          	addi	sp,sp,-32
    800045d0:	00113c23          	sd	ra,24(sp)
    800045d4:	00813823          	sd	s0,16(sp)
    800045d8:	00913423          	sd	s1,8(sp)
    800045dc:	01213023          	sd	s2,0(sp)
    800045e0:	02010413          	addi	s0,sp,32
    800045e4:	00050493          	mv	s1,a0
    800045e8:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800045ec:	01853503          	ld	a0,24(a0)
    800045f0:	00001097          	auipc	ra,0x1
    800045f4:	1ec080e7          	jalr	492(ra) # 800057dc <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800045f8:	0304b503          	ld	a0,48(s1)
    800045fc:	00001097          	auipc	ra,0x1
    80004600:	1e0080e7          	jalr	480(ra) # 800057dc <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80004604:	0084b783          	ld	a5,8(s1)
    80004608:	0144a703          	lw	a4,20(s1)
    8000460c:	00271713          	slli	a4,a4,0x2
    80004610:	00e787b3          	add	a5,a5,a4
    80004614:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80004618:	0144a783          	lw	a5,20(s1)
    8000461c:	0017879b          	addiw	a5,a5,1
    80004620:	0004a703          	lw	a4,0(s1)
    80004624:	02e7e7bb          	remw	a5,a5,a4
    80004628:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    8000462c:	0304b503          	ld	a0,48(s1)
    80004630:	00001097          	auipc	ra,0x1
    80004634:	1d8080e7          	jalr	472(ra) # 80005808 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80004638:	0204b503          	ld	a0,32(s1)
    8000463c:	00001097          	auipc	ra,0x1
    80004640:	1cc080e7          	jalr	460(ra) # 80005808 <_ZN9Semaphore6signalEv>

}
    80004644:	01813083          	ld	ra,24(sp)
    80004648:	01013403          	ld	s0,16(sp)
    8000464c:	00813483          	ld	s1,8(sp)
    80004650:	00013903          	ld	s2,0(sp)
    80004654:	02010113          	addi	sp,sp,32
    80004658:	00008067          	ret

000000008000465c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    8000465c:	fe010113          	addi	sp,sp,-32
    80004660:	00113c23          	sd	ra,24(sp)
    80004664:	00813823          	sd	s0,16(sp)
    80004668:	00913423          	sd	s1,8(sp)
    8000466c:	01213023          	sd	s2,0(sp)
    80004670:	02010413          	addi	s0,sp,32
    80004674:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80004678:	02053503          	ld	a0,32(a0)
    8000467c:	00001097          	auipc	ra,0x1
    80004680:	160080e7          	jalr	352(ra) # 800057dc <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80004684:	0284b503          	ld	a0,40(s1)
    80004688:	00001097          	auipc	ra,0x1
    8000468c:	154080e7          	jalr	340(ra) # 800057dc <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80004690:	0084b703          	ld	a4,8(s1)
    80004694:	0104a783          	lw	a5,16(s1)
    80004698:	00279693          	slli	a3,a5,0x2
    8000469c:	00d70733          	add	a4,a4,a3
    800046a0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800046a4:	0017879b          	addiw	a5,a5,1
    800046a8:	0004a703          	lw	a4,0(s1)
    800046ac:	02e7e7bb          	remw	a5,a5,a4
    800046b0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800046b4:	0284b503          	ld	a0,40(s1)
    800046b8:	00001097          	auipc	ra,0x1
    800046bc:	150080e7          	jalr	336(ra) # 80005808 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800046c0:	0184b503          	ld	a0,24(s1)
    800046c4:	00001097          	auipc	ra,0x1
    800046c8:	144080e7          	jalr	324(ra) # 80005808 <_ZN9Semaphore6signalEv>

    return ret;
}
    800046cc:	00090513          	mv	a0,s2
    800046d0:	01813083          	ld	ra,24(sp)
    800046d4:	01013403          	ld	s0,16(sp)
    800046d8:	00813483          	ld	s1,8(sp)
    800046dc:	00013903          	ld	s2,0(sp)
    800046e0:	02010113          	addi	sp,sp,32
    800046e4:	00008067          	ret

00000000800046e8 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800046e8:	fe010113          	addi	sp,sp,-32
    800046ec:	00113c23          	sd	ra,24(sp)
    800046f0:	00813823          	sd	s0,16(sp)
    800046f4:	00913423          	sd	s1,8(sp)
    800046f8:	01213023          	sd	s2,0(sp)
    800046fc:	02010413          	addi	s0,sp,32
    80004700:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80004704:	02853503          	ld	a0,40(a0)
    80004708:	00001097          	auipc	ra,0x1
    8000470c:	0d4080e7          	jalr	212(ra) # 800057dc <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80004710:	0304b503          	ld	a0,48(s1)
    80004714:	00001097          	auipc	ra,0x1
    80004718:	0c8080e7          	jalr	200(ra) # 800057dc <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000471c:	0144a783          	lw	a5,20(s1)
    80004720:	0104a903          	lw	s2,16(s1)
    80004724:	0327ce63          	blt	a5,s2,80004760 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80004728:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000472c:	0304b503          	ld	a0,48(s1)
    80004730:	00001097          	auipc	ra,0x1
    80004734:	0d8080e7          	jalr	216(ra) # 80005808 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80004738:	0284b503          	ld	a0,40(s1)
    8000473c:	00001097          	auipc	ra,0x1
    80004740:	0cc080e7          	jalr	204(ra) # 80005808 <_ZN9Semaphore6signalEv>

    return ret;
}
    80004744:	00090513          	mv	a0,s2
    80004748:	01813083          	ld	ra,24(sp)
    8000474c:	01013403          	ld	s0,16(sp)
    80004750:	00813483          	ld	s1,8(sp)
    80004754:	00013903          	ld	s2,0(sp)
    80004758:	02010113          	addi	sp,sp,32
    8000475c:	00008067          	ret
        ret = cap - head + tail;
    80004760:	0004a703          	lw	a4,0(s1)
    80004764:	4127093b          	subw	s2,a4,s2
    80004768:	00f9093b          	addw	s2,s2,a5
    8000476c:	fc1ff06f          	j	8000472c <_ZN9BufferCPP6getCntEv+0x44>

0000000080004770 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80004770:	fe010113          	addi	sp,sp,-32
    80004774:	00113c23          	sd	ra,24(sp)
    80004778:	00813823          	sd	s0,16(sp)
    8000477c:	00913423          	sd	s1,8(sp)
    80004780:	02010413          	addi	s0,sp,32
    80004784:	00050493          	mv	s1,a0
    Console::putc('\n');
    80004788:	00a00513          	li	a0,10
    8000478c:	00001097          	auipc	ra,0x1
    80004790:	194080e7          	jalr	404(ra) # 80005920 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80004794:	00005517          	auipc	a0,0x5
    80004798:	ce450513          	addi	a0,a0,-796 # 80009478 <CONSOLE_STATUS+0x468>
    8000479c:	00000097          	auipc	ra,0x0
    800047a0:	a0c080e7          	jalr	-1524(ra) # 800041a8 <_Z11printStringPKc>
    while (getCnt()) {
    800047a4:	00048513          	mv	a0,s1
    800047a8:	00000097          	auipc	ra,0x0
    800047ac:	f40080e7          	jalr	-192(ra) # 800046e8 <_ZN9BufferCPP6getCntEv>
    800047b0:	02050c63          	beqz	a0,800047e8 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800047b4:	0084b783          	ld	a5,8(s1)
    800047b8:	0104a703          	lw	a4,16(s1)
    800047bc:	00271713          	slli	a4,a4,0x2
    800047c0:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800047c4:	0007c503          	lbu	a0,0(a5)
    800047c8:	00001097          	auipc	ra,0x1
    800047cc:	158080e7          	jalr	344(ra) # 80005920 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800047d0:	0104a783          	lw	a5,16(s1)
    800047d4:	0017879b          	addiw	a5,a5,1
    800047d8:	0004a703          	lw	a4,0(s1)
    800047dc:	02e7e7bb          	remw	a5,a5,a4
    800047e0:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800047e4:	fc1ff06f          	j	800047a4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800047e8:	02100513          	li	a0,33
    800047ec:	00001097          	auipc	ra,0x1
    800047f0:	134080e7          	jalr	308(ra) # 80005920 <_ZN7Console4putcEc>
    Console::putc('\n');
    800047f4:	00a00513          	li	a0,10
    800047f8:	00001097          	auipc	ra,0x1
    800047fc:	128080e7          	jalr	296(ra) # 80005920 <_ZN7Console4putcEc>
    mem_free(buffer);
    80004800:	0084b503          	ld	a0,8(s1)
    80004804:	ffffd097          	auipc	ra,0xffffd
    80004808:	a84080e7          	jalr	-1404(ra) # 80001288 <_Z8mem_freePv>
    delete itemAvailable;
    8000480c:	0204b503          	ld	a0,32(s1)
    80004810:	00050863          	beqz	a0,80004820 <_ZN9BufferCPPD1Ev+0xb0>
    80004814:	00053783          	ld	a5,0(a0)
    80004818:	0087b783          	ld	a5,8(a5)
    8000481c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80004820:	0184b503          	ld	a0,24(s1)
    80004824:	00050863          	beqz	a0,80004834 <_ZN9BufferCPPD1Ev+0xc4>
    80004828:	00053783          	ld	a5,0(a0)
    8000482c:	0087b783          	ld	a5,8(a5)
    80004830:	000780e7          	jalr	a5
    delete mutexTail;
    80004834:	0304b503          	ld	a0,48(s1)
    80004838:	00050863          	beqz	a0,80004848 <_ZN9BufferCPPD1Ev+0xd8>
    8000483c:	00053783          	ld	a5,0(a0)
    80004840:	0087b783          	ld	a5,8(a5)
    80004844:	000780e7          	jalr	a5
    delete mutexHead;
    80004848:	0284b503          	ld	a0,40(s1)
    8000484c:	00050863          	beqz	a0,8000485c <_ZN9BufferCPPD1Ev+0xec>
    80004850:	00053783          	ld	a5,0(a0)
    80004854:	0087b783          	ld	a5,8(a5)
    80004858:	000780e7          	jalr	a5
}
    8000485c:	01813083          	ld	ra,24(sp)
    80004860:	01013403          	ld	s0,16(sp)
    80004864:	00813483          	ld	s1,8(sp)
    80004868:	02010113          	addi	sp,sp,32
    8000486c:	00008067          	ret

0000000080004870 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80004870:	fe010113          	addi	sp,sp,-32
    80004874:	00113c23          	sd	ra,24(sp)
    80004878:	00813823          	sd	s0,16(sp)
    8000487c:	00913423          	sd	s1,8(sp)
    80004880:	01213023          	sd	s2,0(sp)
    80004884:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80004888:	00053903          	ld	s2,0(a0)
    int i = 6;
    8000488c:	00600493          	li	s1,6
    while (--i > 0) {
    80004890:	fff4849b          	addiw	s1,s1,-1
    80004894:	04905463          	blez	s1,800048dc <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80004898:	00005517          	auipc	a0,0x5
    8000489c:	bf850513          	addi	a0,a0,-1032 # 80009490 <CONSOLE_STATUS+0x480>
    800048a0:	00000097          	auipc	ra,0x0
    800048a4:	908080e7          	jalr	-1784(ra) # 800041a8 <_Z11printStringPKc>
        printInt(sleep_time);
    800048a8:	00000613          	li	a2,0
    800048ac:	00a00593          	li	a1,10
    800048b0:	0009051b          	sext.w	a0,s2
    800048b4:	00000097          	auipc	ra,0x0
    800048b8:	aa4080e7          	jalr	-1372(ra) # 80004358 <_Z8printIntiii>
        printString(" !\n");
    800048bc:	00005517          	auipc	a0,0x5
    800048c0:	bdc50513          	addi	a0,a0,-1060 # 80009498 <CONSOLE_STATUS+0x488>
    800048c4:	00000097          	auipc	ra,0x0
    800048c8:	8e4080e7          	jalr	-1820(ra) # 800041a8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    800048cc:	00090513          	mv	a0,s2
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	cd8080e7          	jalr	-808(ra) # 800015a8 <_Z10time_sleepm>
    while (--i > 0) {
    800048d8:	fb9ff06f          	j	80004890 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    800048dc:	00a00793          	li	a5,10
    800048e0:	02f95933          	divu	s2,s2,a5
    800048e4:	fff90913          	addi	s2,s2,-1
    800048e8:	00007797          	auipc	a5,0x7
    800048ec:	14078793          	addi	a5,a5,320 # 8000ba28 <_ZL8finished>
    800048f0:	01278933          	add	s2,a5,s2
    800048f4:	00100793          	li	a5,1
    800048f8:	00f90023          	sb	a5,0(s2)
}
    800048fc:	01813083          	ld	ra,24(sp)
    80004900:	01013403          	ld	s0,16(sp)
    80004904:	00813483          	ld	s1,8(sp)
    80004908:	00013903          	ld	s2,0(sp)
    8000490c:	02010113          	addi	sp,sp,32
    80004910:	00008067          	ret

0000000080004914 <_Z12testSleepingv>:

void testSleeping() {
    80004914:	fc010113          	addi	sp,sp,-64
    80004918:	02113c23          	sd	ra,56(sp)
    8000491c:	02813823          	sd	s0,48(sp)
    80004920:	02913423          	sd	s1,40(sp)
    80004924:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80004928:	00a00793          	li	a5,10
    8000492c:	fcf43823          	sd	a5,-48(s0)
    80004930:	01400793          	li	a5,20
    80004934:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80004938:	00000493          	li	s1,0
    8000493c:	02c0006f          	j	80004968 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80004940:	00349793          	slli	a5,s1,0x3
    80004944:	fd040613          	addi	a2,s0,-48
    80004948:	00f60633          	add	a2,a2,a5
    8000494c:	00000597          	auipc	a1,0x0
    80004950:	f2458593          	addi	a1,a1,-220 # 80004870 <_ZL9sleepyRunPv>
    80004954:	fc040513          	addi	a0,s0,-64
    80004958:	00f50533          	add	a0,a0,a5
    8000495c:	ffffd097          	auipc	ra,0xffffd
    80004960:	96c080e7          	jalr	-1684(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80004964:	0014849b          	addiw	s1,s1,1
    80004968:	00100793          	li	a5,1
    8000496c:	fc97dae3          	bge	a5,s1,80004940 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80004970:	00007797          	auipc	a5,0x7
    80004974:	0b87c783          	lbu	a5,184(a5) # 8000ba28 <_ZL8finished>
    80004978:	fe078ce3          	beqz	a5,80004970 <_Z12testSleepingv+0x5c>
    8000497c:	00007797          	auipc	a5,0x7
    80004980:	0ad7c783          	lbu	a5,173(a5) # 8000ba29 <_ZL8finished+0x1>
    80004984:	fe0786e3          	beqz	a5,80004970 <_Z12testSleepingv+0x5c>
}
    80004988:	03813083          	ld	ra,56(sp)
    8000498c:	03013403          	ld	s0,48(sp)
    80004990:	02813483          	ld	s1,40(sp)
    80004994:	04010113          	addi	sp,sp,64
    80004998:	00008067          	ret

000000008000499c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000499c:	fe010113          	addi	sp,sp,-32
    800049a0:	00113c23          	sd	ra,24(sp)
    800049a4:	00813823          	sd	s0,16(sp)
    800049a8:	00913423          	sd	s1,8(sp)
    800049ac:	01213023          	sd	s2,0(sp)
    800049b0:	02010413          	addi	s0,sp,32
    800049b4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800049b8:	00100793          	li	a5,1
    800049bc:	02a7f863          	bgeu	a5,a0,800049ec <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800049c0:	00a00793          	li	a5,10
    800049c4:	02f577b3          	remu	a5,a0,a5
    800049c8:	02078e63          	beqz	a5,80004a04 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800049cc:	fff48513          	addi	a0,s1,-1
    800049d0:	00000097          	auipc	ra,0x0
    800049d4:	fcc080e7          	jalr	-52(ra) # 8000499c <_ZL9fibonaccim>
    800049d8:	00050913          	mv	s2,a0
    800049dc:	ffe48513          	addi	a0,s1,-2
    800049e0:	00000097          	auipc	ra,0x0
    800049e4:	fbc080e7          	jalr	-68(ra) # 8000499c <_ZL9fibonaccim>
    800049e8:	00a90533          	add	a0,s2,a0
}
    800049ec:	01813083          	ld	ra,24(sp)
    800049f0:	01013403          	ld	s0,16(sp)
    800049f4:	00813483          	ld	s1,8(sp)
    800049f8:	00013903          	ld	s2,0(sp)
    800049fc:	02010113          	addi	sp,sp,32
    80004a00:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004a04:	ffffd097          	auipc	ra,0xffffd
    80004a08:	98c080e7          	jalr	-1652(ra) # 80001390 <_Z15thread_dispatchv>
    80004a0c:	fc1ff06f          	j	800049cc <_ZL9fibonaccim+0x30>

0000000080004a10 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004a10:	fe010113          	addi	sp,sp,-32
    80004a14:	00113c23          	sd	ra,24(sp)
    80004a18:	00813823          	sd	s0,16(sp)
    80004a1c:	00913423          	sd	s1,8(sp)
    80004a20:	01213023          	sd	s2,0(sp)
    80004a24:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004a28:	00a00493          	li	s1,10
    80004a2c:	0400006f          	j	80004a6c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004a30:	00005517          	auipc	a0,0x5
    80004a34:	9b050513          	addi	a0,a0,-1616 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80004a38:	fffff097          	auipc	ra,0xfffff
    80004a3c:	770080e7          	jalr	1904(ra) # 800041a8 <_Z11printStringPKc>
    80004a40:	00000613          	li	a2,0
    80004a44:	00a00593          	li	a1,10
    80004a48:	00048513          	mv	a0,s1
    80004a4c:	00000097          	auipc	ra,0x0
    80004a50:	90c080e7          	jalr	-1780(ra) # 80004358 <_Z8printIntiii>
    80004a54:	00004517          	auipc	a0,0x4
    80004a58:	70c50513          	addi	a0,a0,1804 # 80009160 <CONSOLE_STATUS+0x150>
    80004a5c:	fffff097          	auipc	ra,0xfffff
    80004a60:	74c080e7          	jalr	1868(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004a64:	0014849b          	addiw	s1,s1,1
    80004a68:	0ff4f493          	andi	s1,s1,255
    80004a6c:	00c00793          	li	a5,12
    80004a70:	fc97f0e3          	bgeu	a5,s1,80004a30 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004a74:	00005517          	auipc	a0,0x5
    80004a78:	97450513          	addi	a0,a0,-1676 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80004a7c:	fffff097          	auipc	ra,0xfffff
    80004a80:	72c080e7          	jalr	1836(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004a84:	00500313          	li	t1,5
    thread_dispatch();
    80004a88:	ffffd097          	auipc	ra,0xffffd
    80004a8c:	908080e7          	jalr	-1784(ra) # 80001390 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004a90:	01000513          	li	a0,16
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	f08080e7          	jalr	-248(ra) # 8000499c <_ZL9fibonaccim>
    80004a9c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004aa0:	00005517          	auipc	a0,0x5
    80004aa4:	95850513          	addi	a0,a0,-1704 # 800093f8 <CONSOLE_STATUS+0x3e8>
    80004aa8:	fffff097          	auipc	ra,0xfffff
    80004aac:	700080e7          	jalr	1792(ra) # 800041a8 <_Z11printStringPKc>
    80004ab0:	00000613          	li	a2,0
    80004ab4:	00a00593          	li	a1,10
    80004ab8:	0009051b          	sext.w	a0,s2
    80004abc:	00000097          	auipc	ra,0x0
    80004ac0:	89c080e7          	jalr	-1892(ra) # 80004358 <_Z8printIntiii>
    80004ac4:	00004517          	auipc	a0,0x4
    80004ac8:	69c50513          	addi	a0,a0,1692 # 80009160 <CONSOLE_STATUS+0x150>
    80004acc:	fffff097          	auipc	ra,0xfffff
    80004ad0:	6dc080e7          	jalr	1756(ra) # 800041a8 <_Z11printStringPKc>
    80004ad4:	0400006f          	j	80004b14 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004ad8:	00005517          	auipc	a0,0x5
    80004adc:	90850513          	addi	a0,a0,-1784 # 800093e0 <CONSOLE_STATUS+0x3d0>
    80004ae0:	fffff097          	auipc	ra,0xfffff
    80004ae4:	6c8080e7          	jalr	1736(ra) # 800041a8 <_Z11printStringPKc>
    80004ae8:	00000613          	li	a2,0
    80004aec:	00a00593          	li	a1,10
    80004af0:	00048513          	mv	a0,s1
    80004af4:	00000097          	auipc	ra,0x0
    80004af8:	864080e7          	jalr	-1948(ra) # 80004358 <_Z8printIntiii>
    80004afc:	00004517          	auipc	a0,0x4
    80004b00:	66450513          	addi	a0,a0,1636 # 80009160 <CONSOLE_STATUS+0x150>
    80004b04:	fffff097          	auipc	ra,0xfffff
    80004b08:	6a4080e7          	jalr	1700(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004b0c:	0014849b          	addiw	s1,s1,1
    80004b10:	0ff4f493          	andi	s1,s1,255
    80004b14:	00f00793          	li	a5,15
    80004b18:	fc97f0e3          	bgeu	a5,s1,80004ad8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004b1c:	00005517          	auipc	a0,0x5
    80004b20:	8ec50513          	addi	a0,a0,-1812 # 80009408 <CONSOLE_STATUS+0x3f8>
    80004b24:	fffff097          	auipc	ra,0xfffff
    80004b28:	684080e7          	jalr	1668(ra) # 800041a8 <_Z11printStringPKc>
    finishedD = true;
    80004b2c:	00100793          	li	a5,1
    80004b30:	00007717          	auipc	a4,0x7
    80004b34:	eef70d23          	sb	a5,-262(a4) # 8000ba2a <_ZL9finishedD>
    thread_dispatch();
    80004b38:	ffffd097          	auipc	ra,0xffffd
    80004b3c:	858080e7          	jalr	-1960(ra) # 80001390 <_Z15thread_dispatchv>
}
    80004b40:	01813083          	ld	ra,24(sp)
    80004b44:	01013403          	ld	s0,16(sp)
    80004b48:	00813483          	ld	s1,8(sp)
    80004b4c:	00013903          	ld	s2,0(sp)
    80004b50:	02010113          	addi	sp,sp,32
    80004b54:	00008067          	ret

0000000080004b58 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004b58:	fe010113          	addi	sp,sp,-32
    80004b5c:	00113c23          	sd	ra,24(sp)
    80004b60:	00813823          	sd	s0,16(sp)
    80004b64:	00913423          	sd	s1,8(sp)
    80004b68:	01213023          	sd	s2,0(sp)
    80004b6c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004b70:	00000493          	li	s1,0
    80004b74:	0400006f          	j	80004bb4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004b78:	00005517          	auipc	a0,0x5
    80004b7c:	83850513          	addi	a0,a0,-1992 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004b80:	fffff097          	auipc	ra,0xfffff
    80004b84:	628080e7          	jalr	1576(ra) # 800041a8 <_Z11printStringPKc>
    80004b88:	00000613          	li	a2,0
    80004b8c:	00a00593          	li	a1,10
    80004b90:	00048513          	mv	a0,s1
    80004b94:	fffff097          	auipc	ra,0xfffff
    80004b98:	7c4080e7          	jalr	1988(ra) # 80004358 <_Z8printIntiii>
    80004b9c:	00004517          	auipc	a0,0x4
    80004ba0:	5c450513          	addi	a0,a0,1476 # 80009160 <CONSOLE_STATUS+0x150>
    80004ba4:	fffff097          	auipc	ra,0xfffff
    80004ba8:	604080e7          	jalr	1540(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004bac:	0014849b          	addiw	s1,s1,1
    80004bb0:	0ff4f493          	andi	s1,s1,255
    80004bb4:	00200793          	li	a5,2
    80004bb8:	fc97f0e3          	bgeu	a5,s1,80004b78 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004bbc:	00004517          	auipc	a0,0x4
    80004bc0:	7fc50513          	addi	a0,a0,2044 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80004bc4:	fffff097          	auipc	ra,0xfffff
    80004bc8:	5e4080e7          	jalr	1508(ra) # 800041a8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004bcc:	00700313          	li	t1,7
    thread_dispatch();
    80004bd0:	ffffc097          	auipc	ra,0xffffc
    80004bd4:	7c0080e7          	jalr	1984(ra) # 80001390 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004bd8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004bdc:	00004517          	auipc	a0,0x4
    80004be0:	7ec50513          	addi	a0,a0,2028 # 800093c8 <CONSOLE_STATUS+0x3b8>
    80004be4:	fffff097          	auipc	ra,0xfffff
    80004be8:	5c4080e7          	jalr	1476(ra) # 800041a8 <_Z11printStringPKc>
    80004bec:	00000613          	li	a2,0
    80004bf0:	00a00593          	li	a1,10
    80004bf4:	0009051b          	sext.w	a0,s2
    80004bf8:	fffff097          	auipc	ra,0xfffff
    80004bfc:	760080e7          	jalr	1888(ra) # 80004358 <_Z8printIntiii>
    80004c00:	00004517          	auipc	a0,0x4
    80004c04:	56050513          	addi	a0,a0,1376 # 80009160 <CONSOLE_STATUS+0x150>
    80004c08:	fffff097          	auipc	ra,0xfffff
    80004c0c:	5a0080e7          	jalr	1440(ra) # 800041a8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004c10:	00c00513          	li	a0,12
    80004c14:	00000097          	auipc	ra,0x0
    80004c18:	d88080e7          	jalr	-632(ra) # 8000499c <_ZL9fibonaccim>
    80004c1c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004c20:	00004517          	auipc	a0,0x4
    80004c24:	7b050513          	addi	a0,a0,1968 # 800093d0 <CONSOLE_STATUS+0x3c0>
    80004c28:	fffff097          	auipc	ra,0xfffff
    80004c2c:	580080e7          	jalr	1408(ra) # 800041a8 <_Z11printStringPKc>
    80004c30:	00000613          	li	a2,0
    80004c34:	00a00593          	li	a1,10
    80004c38:	0009051b          	sext.w	a0,s2
    80004c3c:	fffff097          	auipc	ra,0xfffff
    80004c40:	71c080e7          	jalr	1820(ra) # 80004358 <_Z8printIntiii>
    80004c44:	00004517          	auipc	a0,0x4
    80004c48:	51c50513          	addi	a0,a0,1308 # 80009160 <CONSOLE_STATUS+0x150>
    80004c4c:	fffff097          	auipc	ra,0xfffff
    80004c50:	55c080e7          	jalr	1372(ra) # 800041a8 <_Z11printStringPKc>
    80004c54:	0400006f          	j	80004c94 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004c58:	00004517          	auipc	a0,0x4
    80004c5c:	75850513          	addi	a0,a0,1880 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004c60:	fffff097          	auipc	ra,0xfffff
    80004c64:	548080e7          	jalr	1352(ra) # 800041a8 <_Z11printStringPKc>
    80004c68:	00000613          	li	a2,0
    80004c6c:	00a00593          	li	a1,10
    80004c70:	00048513          	mv	a0,s1
    80004c74:	fffff097          	auipc	ra,0xfffff
    80004c78:	6e4080e7          	jalr	1764(ra) # 80004358 <_Z8printIntiii>
    80004c7c:	00004517          	auipc	a0,0x4
    80004c80:	4e450513          	addi	a0,a0,1252 # 80009160 <CONSOLE_STATUS+0x150>
    80004c84:	fffff097          	auipc	ra,0xfffff
    80004c88:	524080e7          	jalr	1316(ra) # 800041a8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004c8c:	0014849b          	addiw	s1,s1,1
    80004c90:	0ff4f493          	andi	s1,s1,255
    80004c94:	00500793          	li	a5,5
    80004c98:	fc97f0e3          	bgeu	a5,s1,80004c58 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004c9c:	00004517          	auipc	a0,0x4
    80004ca0:	6ec50513          	addi	a0,a0,1772 # 80009388 <CONSOLE_STATUS+0x378>
    80004ca4:	fffff097          	auipc	ra,0xfffff
    80004ca8:	504080e7          	jalr	1284(ra) # 800041a8 <_Z11printStringPKc>
    finishedC = true;
    80004cac:	00100793          	li	a5,1
    80004cb0:	00007717          	auipc	a4,0x7
    80004cb4:	d6f70da3          	sb	a5,-645(a4) # 8000ba2b <_ZL9finishedC>
    thread_dispatch();
    80004cb8:	ffffc097          	auipc	ra,0xffffc
    80004cbc:	6d8080e7          	jalr	1752(ra) # 80001390 <_Z15thread_dispatchv>
}
    80004cc0:	01813083          	ld	ra,24(sp)
    80004cc4:	01013403          	ld	s0,16(sp)
    80004cc8:	00813483          	ld	s1,8(sp)
    80004ccc:	00013903          	ld	s2,0(sp)
    80004cd0:	02010113          	addi	sp,sp,32
    80004cd4:	00008067          	ret

0000000080004cd8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004cd8:	fe010113          	addi	sp,sp,-32
    80004cdc:	00113c23          	sd	ra,24(sp)
    80004ce0:	00813823          	sd	s0,16(sp)
    80004ce4:	00913423          	sd	s1,8(sp)
    80004ce8:	01213023          	sd	s2,0(sp)
    80004cec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004cf0:	00000913          	li	s2,0
    80004cf4:	0400006f          	j	80004d34 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80004cf8:	ffffc097          	auipc	ra,0xffffc
    80004cfc:	698080e7          	jalr	1688(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004d00:	00148493          	addi	s1,s1,1
    80004d04:	000027b7          	lui	a5,0x2
    80004d08:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004d0c:	0097ee63          	bltu	a5,s1,80004d28 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004d10:	00000713          	li	a4,0
    80004d14:	000077b7          	lui	a5,0x7
    80004d18:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004d1c:	fce7eee3          	bltu	a5,a4,80004cf8 <_ZL11workerBodyBPv+0x20>
    80004d20:	00170713          	addi	a4,a4,1
    80004d24:	ff1ff06f          	j	80004d14 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80004d28:	00a00793          	li	a5,10
    80004d2c:	04f90663          	beq	s2,a5,80004d78 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80004d30:	00190913          	addi	s2,s2,1
    80004d34:	00f00793          	li	a5,15
    80004d38:	0527e463          	bltu	a5,s2,80004d80 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80004d3c:	00004517          	auipc	a0,0x4
    80004d40:	65c50513          	addi	a0,a0,1628 # 80009398 <CONSOLE_STATUS+0x388>
    80004d44:	fffff097          	auipc	ra,0xfffff
    80004d48:	464080e7          	jalr	1124(ra) # 800041a8 <_Z11printStringPKc>
    80004d4c:	00000613          	li	a2,0
    80004d50:	00a00593          	li	a1,10
    80004d54:	0009051b          	sext.w	a0,s2
    80004d58:	fffff097          	auipc	ra,0xfffff
    80004d5c:	600080e7          	jalr	1536(ra) # 80004358 <_Z8printIntiii>
    80004d60:	00004517          	auipc	a0,0x4
    80004d64:	40050513          	addi	a0,a0,1024 # 80009160 <CONSOLE_STATUS+0x150>
    80004d68:	fffff097          	auipc	ra,0xfffff
    80004d6c:	440080e7          	jalr	1088(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004d70:	00000493          	li	s1,0
    80004d74:	f91ff06f          	j	80004d04 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80004d78:	14102ff3          	csrr	t6,sepc
    80004d7c:	fb5ff06f          	j	80004d30 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80004d80:	00004517          	auipc	a0,0x4
    80004d84:	62050513          	addi	a0,a0,1568 # 800093a0 <CONSOLE_STATUS+0x390>
    80004d88:	fffff097          	auipc	ra,0xfffff
    80004d8c:	420080e7          	jalr	1056(ra) # 800041a8 <_Z11printStringPKc>
    finishedB = true;
    80004d90:	00100793          	li	a5,1
    80004d94:	00007717          	auipc	a4,0x7
    80004d98:	c8f70c23          	sb	a5,-872(a4) # 8000ba2c <_ZL9finishedB>
    thread_dispatch();
    80004d9c:	ffffc097          	auipc	ra,0xffffc
    80004da0:	5f4080e7          	jalr	1524(ra) # 80001390 <_Z15thread_dispatchv>
}
    80004da4:	01813083          	ld	ra,24(sp)
    80004da8:	01013403          	ld	s0,16(sp)
    80004dac:	00813483          	ld	s1,8(sp)
    80004db0:	00013903          	ld	s2,0(sp)
    80004db4:	02010113          	addi	sp,sp,32
    80004db8:	00008067          	ret

0000000080004dbc <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004dbc:	fe010113          	addi	sp,sp,-32
    80004dc0:	00113c23          	sd	ra,24(sp)
    80004dc4:	00813823          	sd	s0,16(sp)
    80004dc8:	00913423          	sd	s1,8(sp)
    80004dcc:	01213023          	sd	s2,0(sp)
    80004dd0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004dd4:	00000913          	li	s2,0
    80004dd8:	0380006f          	j	80004e10 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004ddc:	ffffc097          	auipc	ra,0xffffc
    80004de0:	5b4080e7          	jalr	1460(ra) # 80001390 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004de4:	00148493          	addi	s1,s1,1
    80004de8:	000027b7          	lui	a5,0x2
    80004dec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004df0:	0097ee63          	bltu	a5,s1,80004e0c <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004df4:	00000713          	li	a4,0
    80004df8:	000077b7          	lui	a5,0x7
    80004dfc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80004e00:	fce7eee3          	bltu	a5,a4,80004ddc <_ZL11workerBodyAPv+0x20>
    80004e04:	00170713          	addi	a4,a4,1
    80004e08:	ff1ff06f          	j	80004df8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004e0c:	00190913          	addi	s2,s2,1
    80004e10:	00900793          	li	a5,9
    80004e14:	0527e063          	bltu	a5,s2,80004e54 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004e18:	00004517          	auipc	a0,0x4
    80004e1c:	56850513          	addi	a0,a0,1384 # 80009380 <CONSOLE_STATUS+0x370>
    80004e20:	fffff097          	auipc	ra,0xfffff
    80004e24:	388080e7          	jalr	904(ra) # 800041a8 <_Z11printStringPKc>
    80004e28:	00000613          	li	a2,0
    80004e2c:	00a00593          	li	a1,10
    80004e30:	0009051b          	sext.w	a0,s2
    80004e34:	fffff097          	auipc	ra,0xfffff
    80004e38:	524080e7          	jalr	1316(ra) # 80004358 <_Z8printIntiii>
    80004e3c:	00004517          	auipc	a0,0x4
    80004e40:	32450513          	addi	a0,a0,804 # 80009160 <CONSOLE_STATUS+0x150>
    80004e44:	fffff097          	auipc	ra,0xfffff
    80004e48:	364080e7          	jalr	868(ra) # 800041a8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004e4c:	00000493          	li	s1,0
    80004e50:	f99ff06f          	j	80004de8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004e54:	00004517          	auipc	a0,0x4
    80004e58:	53450513          	addi	a0,a0,1332 # 80009388 <CONSOLE_STATUS+0x378>
    80004e5c:	fffff097          	auipc	ra,0xfffff
    80004e60:	34c080e7          	jalr	844(ra) # 800041a8 <_Z11printStringPKc>
    finishedA = true;
    80004e64:	00100793          	li	a5,1
    80004e68:	00007717          	auipc	a4,0x7
    80004e6c:	bcf702a3          	sb	a5,-1083(a4) # 8000ba2d <_ZL9finishedA>
}
    80004e70:	01813083          	ld	ra,24(sp)
    80004e74:	01013403          	ld	s0,16(sp)
    80004e78:	00813483          	ld	s1,8(sp)
    80004e7c:	00013903          	ld	s2,0(sp)
    80004e80:	02010113          	addi	sp,sp,32
    80004e84:	00008067          	ret

0000000080004e88 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80004e88:	fd010113          	addi	sp,sp,-48
    80004e8c:	02113423          	sd	ra,40(sp)
    80004e90:	02813023          	sd	s0,32(sp)
    80004e94:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004e98:	00000613          	li	a2,0
    80004e9c:	00000597          	auipc	a1,0x0
    80004ea0:	f2058593          	addi	a1,a1,-224 # 80004dbc <_ZL11workerBodyAPv>
    80004ea4:	fd040513          	addi	a0,s0,-48
    80004ea8:	ffffc097          	auipc	ra,0xffffc
    80004eac:	420080e7          	jalr	1056(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004eb0:	00004517          	auipc	a0,0x4
    80004eb4:	56850513          	addi	a0,a0,1384 # 80009418 <CONSOLE_STATUS+0x408>
    80004eb8:	fffff097          	auipc	ra,0xfffff
    80004ebc:	2f0080e7          	jalr	752(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004ec0:	00000613          	li	a2,0
    80004ec4:	00000597          	auipc	a1,0x0
    80004ec8:	e1458593          	addi	a1,a1,-492 # 80004cd8 <_ZL11workerBodyBPv>
    80004ecc:	fd840513          	addi	a0,s0,-40
    80004ed0:	ffffc097          	auipc	ra,0xffffc
    80004ed4:	3f8080e7          	jalr	1016(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004ed8:	00004517          	auipc	a0,0x4
    80004edc:	55850513          	addi	a0,a0,1368 # 80009430 <CONSOLE_STATUS+0x420>
    80004ee0:	fffff097          	auipc	ra,0xfffff
    80004ee4:	2c8080e7          	jalr	712(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004ee8:	00000613          	li	a2,0
    80004eec:	00000597          	auipc	a1,0x0
    80004ef0:	c6c58593          	addi	a1,a1,-916 # 80004b58 <_ZL11workerBodyCPv>
    80004ef4:	fe040513          	addi	a0,s0,-32
    80004ef8:	ffffc097          	auipc	ra,0xffffc
    80004efc:	3d0080e7          	jalr	976(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004f00:	00004517          	auipc	a0,0x4
    80004f04:	54850513          	addi	a0,a0,1352 # 80009448 <CONSOLE_STATUS+0x438>
    80004f08:	fffff097          	auipc	ra,0xfffff
    80004f0c:	2a0080e7          	jalr	672(ra) # 800041a8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004f10:	00000613          	li	a2,0
    80004f14:	00000597          	auipc	a1,0x0
    80004f18:	afc58593          	addi	a1,a1,-1284 # 80004a10 <_ZL11workerBodyDPv>
    80004f1c:	fe840513          	addi	a0,s0,-24
    80004f20:	ffffc097          	auipc	ra,0xffffc
    80004f24:	3a8080e7          	jalr	936(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004f28:	00004517          	auipc	a0,0x4
    80004f2c:	53850513          	addi	a0,a0,1336 # 80009460 <CONSOLE_STATUS+0x450>
    80004f30:	fffff097          	auipc	ra,0xfffff
    80004f34:	278080e7          	jalr	632(ra) # 800041a8 <_Z11printStringPKc>
    80004f38:	00c0006f          	j	80004f44 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004f3c:	ffffc097          	auipc	ra,0xffffc
    80004f40:	454080e7          	jalr	1108(ra) # 80001390 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004f44:	00007797          	auipc	a5,0x7
    80004f48:	ae97c783          	lbu	a5,-1303(a5) # 8000ba2d <_ZL9finishedA>
    80004f4c:	fe0788e3          	beqz	a5,80004f3c <_Z16System_Mode_testv+0xb4>
    80004f50:	00007797          	auipc	a5,0x7
    80004f54:	adc7c783          	lbu	a5,-1316(a5) # 8000ba2c <_ZL9finishedB>
    80004f58:	fe0782e3          	beqz	a5,80004f3c <_Z16System_Mode_testv+0xb4>
    80004f5c:	00007797          	auipc	a5,0x7
    80004f60:	acf7c783          	lbu	a5,-1329(a5) # 8000ba2b <_ZL9finishedC>
    80004f64:	fc078ce3          	beqz	a5,80004f3c <_Z16System_Mode_testv+0xb4>
    80004f68:	00007797          	auipc	a5,0x7
    80004f6c:	ac27c783          	lbu	a5,-1342(a5) # 8000ba2a <_ZL9finishedD>
    80004f70:	fc0786e3          	beqz	a5,80004f3c <_Z16System_Mode_testv+0xb4>
    }

}
    80004f74:	02813083          	ld	ra,40(sp)
    80004f78:	02013403          	ld	s0,32(sp)
    80004f7c:	03010113          	addi	sp,sp,48
    80004f80:	00008067          	ret

0000000080004f84 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80004f84:	fe010113          	addi	sp,sp,-32
    80004f88:	00113c23          	sd	ra,24(sp)
    80004f8c:	00813823          	sd	s0,16(sp)
    80004f90:	00913423          	sd	s1,8(sp)
    80004f94:	01213023          	sd	s2,0(sp)
    80004f98:	02010413          	addi	s0,sp,32
    80004f9c:	00050493          	mv	s1,a0
    80004fa0:	00058913          	mv	s2,a1
    80004fa4:	0015879b          	addiw	a5,a1,1
    80004fa8:	0007851b          	sext.w	a0,a5
    80004fac:	00f4a023          	sw	a5,0(s1)
    80004fb0:	0004a823          	sw	zero,16(s1)
    80004fb4:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80004fb8:	00251513          	slli	a0,a0,0x2
    80004fbc:	ffffc097          	auipc	ra,0xffffc
    80004fc0:	280080e7          	jalr	640(ra) # 8000123c <_Z9mem_allocm>
    80004fc4:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80004fc8:	00000593          	li	a1,0
    80004fcc:	02048513          	addi	a0,s1,32
    80004fd0:	ffffc097          	auipc	ra,0xffffc
    80004fd4:	478080e7          	jalr	1144(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
    sem_open(&spaceAvailable, _cap);
    80004fd8:	00090593          	mv	a1,s2
    80004fdc:	01848513          	addi	a0,s1,24
    80004fe0:	ffffc097          	auipc	ra,0xffffc
    80004fe4:	468080e7          	jalr	1128(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
    sem_open(&mutexHead, 1);
    80004fe8:	00100593          	li	a1,1
    80004fec:	02848513          	addi	a0,s1,40
    80004ff0:	ffffc097          	auipc	ra,0xffffc
    80004ff4:	458080e7          	jalr	1112(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
    sem_open(&mutexTail, 1);
    80004ff8:	00100593          	li	a1,1
    80004ffc:	03048513          	addi	a0,s1,48
    80005000:	ffffc097          	auipc	ra,0xffffc
    80005004:	448080e7          	jalr	1096(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
}
    80005008:	01813083          	ld	ra,24(sp)
    8000500c:	01013403          	ld	s0,16(sp)
    80005010:	00813483          	ld	s1,8(sp)
    80005014:	00013903          	ld	s2,0(sp)
    80005018:	02010113          	addi	sp,sp,32
    8000501c:	00008067          	ret

0000000080005020 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005020:	fe010113          	addi	sp,sp,-32
    80005024:	00113c23          	sd	ra,24(sp)
    80005028:	00813823          	sd	s0,16(sp)
    8000502c:	00913423          	sd	s1,8(sp)
    80005030:	01213023          	sd	s2,0(sp)
    80005034:	02010413          	addi	s0,sp,32
    80005038:	00050493          	mv	s1,a0
    8000503c:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005040:	01853503          	ld	a0,24(a0)
    80005044:	ffffc097          	auipc	ra,0xffffc
    80005048:	488080e7          	jalr	1160(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>

    sem_wait(mutexTail);
    8000504c:	0304b503          	ld	a0,48(s1)
    80005050:	ffffc097          	auipc	ra,0xffffc
    80005054:	47c080e7          	jalr	1148(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>
    buffer[tail] = val;
    80005058:	0084b783          	ld	a5,8(s1)
    8000505c:	0144a703          	lw	a4,20(s1)
    80005060:	00271713          	slli	a4,a4,0x2
    80005064:	00e787b3          	add	a5,a5,a4
    80005068:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000506c:	0144a783          	lw	a5,20(s1)
    80005070:	0017879b          	addiw	a5,a5,1
    80005074:	0004a703          	lw	a4,0(s1)
    80005078:	02e7e7bb          	remw	a5,a5,a4
    8000507c:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005080:	0304b503          	ld	a0,48(s1)
    80005084:	ffffc097          	auipc	ra,0xffffc
    80005088:	488080e7          	jalr	1160(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>

    sem_signal(itemAvailable);
    8000508c:	0204b503          	ld	a0,32(s1)
    80005090:	ffffc097          	auipc	ra,0xffffc
    80005094:	47c080e7          	jalr	1148(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>

}
    80005098:	01813083          	ld	ra,24(sp)
    8000509c:	01013403          	ld	s0,16(sp)
    800050a0:	00813483          	ld	s1,8(sp)
    800050a4:	00013903          	ld	s2,0(sp)
    800050a8:	02010113          	addi	sp,sp,32
    800050ac:	00008067          	ret

00000000800050b0 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800050b0:	fe010113          	addi	sp,sp,-32
    800050b4:	00113c23          	sd	ra,24(sp)
    800050b8:	00813823          	sd	s0,16(sp)
    800050bc:	00913423          	sd	s1,8(sp)
    800050c0:	01213023          	sd	s2,0(sp)
    800050c4:	02010413          	addi	s0,sp,32
    800050c8:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800050cc:	02053503          	ld	a0,32(a0)
    800050d0:	ffffc097          	auipc	ra,0xffffc
    800050d4:	3fc080e7          	jalr	1020(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>

    sem_wait(mutexHead);
    800050d8:	0284b503          	ld	a0,40(s1)
    800050dc:	ffffc097          	auipc	ra,0xffffc
    800050e0:	3f0080e7          	jalr	1008(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>

    int ret = buffer[head];
    800050e4:	0084b703          	ld	a4,8(s1)
    800050e8:	0104a783          	lw	a5,16(s1)
    800050ec:	00279693          	slli	a3,a5,0x2
    800050f0:	00d70733          	add	a4,a4,a3
    800050f4:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800050f8:	0017879b          	addiw	a5,a5,1
    800050fc:	0004a703          	lw	a4,0(s1)
    80005100:	02e7e7bb          	remw	a5,a5,a4
    80005104:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80005108:	0284b503          	ld	a0,40(s1)
    8000510c:	ffffc097          	auipc	ra,0xffffc
    80005110:	400080e7          	jalr	1024(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>

    sem_signal(spaceAvailable);
    80005114:	0184b503          	ld	a0,24(s1)
    80005118:	ffffc097          	auipc	ra,0xffffc
    8000511c:	3f4080e7          	jalr	1012(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>

    return ret;
}
    80005120:	00090513          	mv	a0,s2
    80005124:	01813083          	ld	ra,24(sp)
    80005128:	01013403          	ld	s0,16(sp)
    8000512c:	00813483          	ld	s1,8(sp)
    80005130:	00013903          	ld	s2,0(sp)
    80005134:	02010113          	addi	sp,sp,32
    80005138:	00008067          	ret

000000008000513c <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    8000513c:	fe010113          	addi	sp,sp,-32
    80005140:	00113c23          	sd	ra,24(sp)
    80005144:	00813823          	sd	s0,16(sp)
    80005148:	00913423          	sd	s1,8(sp)
    8000514c:	01213023          	sd	s2,0(sp)
    80005150:	02010413          	addi	s0,sp,32
    80005154:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80005158:	02853503          	ld	a0,40(a0)
    8000515c:	ffffc097          	auipc	ra,0xffffc
    80005160:	370080e7          	jalr	880(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>
    sem_wait(mutexTail);
    80005164:	0304b503          	ld	a0,48(s1)
    80005168:	ffffc097          	auipc	ra,0xffffc
    8000516c:	364080e7          	jalr	868(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>

    if (tail >= head) {
    80005170:	0144a783          	lw	a5,20(s1)
    80005174:	0104a903          	lw	s2,16(s1)
    80005178:	0327ce63          	blt	a5,s2,800051b4 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    8000517c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80005180:	0304b503          	ld	a0,48(s1)
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	388080e7          	jalr	904(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
    sem_signal(mutexHead);
    8000518c:	0284b503          	ld	a0,40(s1)
    80005190:	ffffc097          	auipc	ra,0xffffc
    80005194:	37c080e7          	jalr	892(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>

    return ret;
}
    80005198:	00090513          	mv	a0,s2
    8000519c:	01813083          	ld	ra,24(sp)
    800051a0:	01013403          	ld	s0,16(sp)
    800051a4:	00813483          	ld	s1,8(sp)
    800051a8:	00013903          	ld	s2,0(sp)
    800051ac:	02010113          	addi	sp,sp,32
    800051b0:	00008067          	ret
        ret = cap - head + tail;
    800051b4:	0004a703          	lw	a4,0(s1)
    800051b8:	4127093b          	subw	s2,a4,s2
    800051bc:	00f9093b          	addw	s2,s2,a5
    800051c0:	fc1ff06f          	j	80005180 <_ZN6Buffer6getCntEv+0x44>

00000000800051c4 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    800051c4:	fe010113          	addi	sp,sp,-32
    800051c8:	00113c23          	sd	ra,24(sp)
    800051cc:	00813823          	sd	s0,16(sp)
    800051d0:	00913423          	sd	s1,8(sp)
    800051d4:	02010413          	addi	s0,sp,32
    800051d8:	00050493          	mv	s1,a0
    putc('\n');
    800051dc:	00a00513          	li	a0,10
    800051e0:	ffffc097          	auipc	ra,0xffffc
    800051e4:	22c080e7          	jalr	556(ra) # 8000140c <_Z4putcc>
    printString("Buffer deleted!\n");
    800051e8:	00004517          	auipc	a0,0x4
    800051ec:	29050513          	addi	a0,a0,656 # 80009478 <CONSOLE_STATUS+0x468>
    800051f0:	fffff097          	auipc	ra,0xfffff
    800051f4:	fb8080e7          	jalr	-72(ra) # 800041a8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800051f8:	00048513          	mv	a0,s1
    800051fc:	00000097          	auipc	ra,0x0
    80005200:	f40080e7          	jalr	-192(ra) # 8000513c <_ZN6Buffer6getCntEv>
    80005204:	02a05c63          	blez	a0,8000523c <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80005208:	0084b783          	ld	a5,8(s1)
    8000520c:	0104a703          	lw	a4,16(s1)
    80005210:	00271713          	slli	a4,a4,0x2
    80005214:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80005218:	0007c503          	lbu	a0,0(a5)
    8000521c:	ffffc097          	auipc	ra,0xffffc
    80005220:	1f0080e7          	jalr	496(ra) # 8000140c <_Z4putcc>
        head = (head + 1) % cap;
    80005224:	0104a783          	lw	a5,16(s1)
    80005228:	0017879b          	addiw	a5,a5,1
    8000522c:	0004a703          	lw	a4,0(s1)
    80005230:	02e7e7bb          	remw	a5,a5,a4
    80005234:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80005238:	fc1ff06f          	j	800051f8 <_ZN6BufferD1Ev+0x34>
    putc('!');
    8000523c:	02100513          	li	a0,33
    80005240:	ffffc097          	auipc	ra,0xffffc
    80005244:	1cc080e7          	jalr	460(ra) # 8000140c <_Z4putcc>
    putc('\n');
    80005248:	00a00513          	li	a0,10
    8000524c:	ffffc097          	auipc	ra,0xffffc
    80005250:	1c0080e7          	jalr	448(ra) # 8000140c <_Z4putcc>
    mem_free(buffer);
    80005254:	0084b503          	ld	a0,8(s1)
    80005258:	ffffc097          	auipc	ra,0xffffc
    8000525c:	030080e7          	jalr	48(ra) # 80001288 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80005260:	0204b503          	ld	a0,32(s1)
    80005264:	ffffc097          	auipc	ra,0xffffc
    80005268:	228080e7          	jalr	552(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
    sem_close(spaceAvailable);
    8000526c:	0184b503          	ld	a0,24(s1)
    80005270:	ffffc097          	auipc	ra,0xffffc
    80005274:	21c080e7          	jalr	540(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
    sem_close(mutexTail);
    80005278:	0304b503          	ld	a0,48(s1)
    8000527c:	ffffc097          	auipc	ra,0xffffc
    80005280:	210080e7          	jalr	528(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
    sem_close(mutexHead);
    80005284:	0284b503          	ld	a0,40(s1)
    80005288:	ffffc097          	auipc	ra,0xffffc
    8000528c:	204080e7          	jalr	516(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
}
    80005290:	01813083          	ld	ra,24(sp)
    80005294:	01013403          	ld	s0,16(sp)
    80005298:	00813483          	ld	s1,8(sp)
    8000529c:	02010113          	addi	sp,sp,32
    800052a0:	00008067          	ret

00000000800052a4 <_ZN9Scheduler3putEP3TCB>:

TCB* Scheduler::head = nullptr;
TCB* Scheduler::tail = nullptr;
TCB* Scheduler::idle_tcb = nullptr;

void Scheduler::put(TCB* tcb) {
    800052a4:	ff010113          	addi	sp,sp,-16
    800052a8:	00813423          	sd	s0,8(sp)
    800052ac:	01010413          	addi	s0,sp,16
    if (head == nullptr) {
    800052b0:	00006797          	auipc	a5,0x6
    800052b4:	7807b783          	ld	a5,1920(a5) # 8000ba30 <_ZN9Scheduler4headE>
    800052b8:	02078663          	beqz	a5,800052e4 <_ZN9Scheduler3putEP3TCB+0x40>
        head = tail = tcb;
    } else {
        tail->next = tcb;
    800052bc:	00006797          	auipc	a5,0x6
    800052c0:	77478793          	addi	a5,a5,1908 # 8000ba30 <_ZN9Scheduler4headE>
    800052c4:	0087b703          	ld	a4,8(a5)
    800052c8:	00a73023          	sd	a0,0(a4)
        tcb->prev = tail;
    800052cc:	0087b703          	ld	a4,8(a5)
    800052d0:	00e53423          	sd	a4,8(a0)
        tail = tcb;
    800052d4:	00a7b423          	sd	a0,8(a5)
    }
}
    800052d8:	00813403          	ld	s0,8(sp)
    800052dc:	01010113          	addi	sp,sp,16
    800052e0:	00008067          	ret
        head = tail = tcb;
    800052e4:	00006797          	auipc	a5,0x6
    800052e8:	74c78793          	addi	a5,a5,1868 # 8000ba30 <_ZN9Scheduler4headE>
    800052ec:	00a7b423          	sd	a0,8(a5)
    800052f0:	00a7b023          	sd	a0,0(a5)
    800052f4:	fe5ff06f          	j	800052d8 <_ZN9Scheduler3putEP3TCB+0x34>

00000000800052f8 <_ZN9Scheduler3getEv>:

TCB* Scheduler::get() {
    800052f8:	ff010113          	addi	sp,sp,-16
    800052fc:	00813423          	sd	s0,8(sp)
    80005300:	01010413          	addi	s0,sp,16
    if (head == nullptr && idle_tcb != nullptr) {
    80005304:	00006517          	auipc	a0,0x6
    80005308:	72c53503          	ld	a0,1836(a0) # 8000ba30 <_ZN9Scheduler4headE>
    8000530c:	02050663          	beqz	a0,80005338 <_ZN9Scheduler3getEv+0x40>
        return idle_tcb;  // Return the idle thread if no other threads are ready
    }

    TCB* tcb = head;
    head = head->next;
    80005310:	00053783          	ld	a5,0(a0)
    80005314:	00006717          	auipc	a4,0x6
    80005318:	70f73e23          	sd	a5,1820(a4) # 8000ba30 <_ZN9Scheduler4headE>
    if (head != nullptr) {
    8000531c:	02078863          	beqz	a5,8000534c <_ZN9Scheduler3getEv+0x54>
        head->prev = nullptr;
    80005320:	0007b423          	sd	zero,8(a5)
    } else {
        tail = nullptr;
    }

    tcb->next = tcb->prev = nullptr;
    80005324:	00053423          	sd	zero,8(a0)
    80005328:	00053023          	sd	zero,0(a0)
    return tcb;
}
    8000532c:	00813403          	ld	s0,8(sp)
    80005330:	01010113          	addi	sp,sp,16
    80005334:	00008067          	ret
    if (head == nullptr && idle_tcb != nullptr) {
    80005338:	00006797          	auipc	a5,0x6
    8000533c:	7087b783          	ld	a5,1800(a5) # 8000ba40 <_ZN9Scheduler8idle_tcbE>
    80005340:	fc0788e3          	beqz	a5,80005310 <_ZN9Scheduler3getEv+0x18>
        return idle_tcb;  // Return the idle thread if no other threads are ready
    80005344:	00078513          	mv	a0,a5
    80005348:	fe5ff06f          	j	8000532c <_ZN9Scheduler3getEv+0x34>
        tail = nullptr;
    8000534c:	00006797          	auipc	a5,0x6
    80005350:	6e07b623          	sd	zero,1772(a5) # 8000ba38 <_ZN9Scheduler4tailE>
    80005354:	fd1ff06f          	j	80005324 <_ZN9Scheduler3getEv+0x2c>

0000000080005358 <_ZN9Scheduler20idle_thread_functionEPv>:


void Scheduler::idle_thread_function(void*) {
    80005358:	ff010113          	addi	sp,sp,-16
    8000535c:	00113423          	sd	ra,8(sp)
    80005360:	00813023          	sd	s0,0(sp)
    80005364:	01010413          	addi	s0,sp,16
    while (true){
        thread_dispatch();
    80005368:	ffffc097          	auipc	ra,0xffffc
    8000536c:	028080e7          	jalr	40(ra) # 80001390 <_Z15thread_dispatchv>
    while (true){
    80005370:	ff9ff06f          	j	80005368 <_ZN9Scheduler20idle_thread_functionEPv+0x10>

0000000080005374 <_ZN9Scheduler4peekEv>:
    }
}

TCB *Scheduler::peek() {
    80005374:	ff010113          	addi	sp,sp,-16
    80005378:	00813423          	sd	s0,8(sp)
    8000537c:	01010413          	addi	s0,sp,16
    return head;
}
    80005380:	00006517          	auipc	a0,0x6
    80005384:	6b053503          	ld	a0,1712(a0) # 8000ba30 <_ZN9Scheduler4headE>
    80005388:	00813403          	ld	s0,8(sp)
    8000538c:	01010113          	addi	sp,sp,16
    80005390:	00008067          	ret

0000000080005394 <_Z11userWrapperPv>:
#include "../h/MemoryAllocatorTest.hpp"
#include "test/printing.hpp"
#include "../h/IOBuffer.hpp"
#include "../h/IOSys.hpp"
void userMain();
void userWrapper(void* a){
    80005394:	ff010113          	addi	sp,sp,-16
    80005398:	00113423          	sd	ra,8(sp)
    8000539c:	00813023          	sd	s0,0(sp)
    800053a0:	01010413          	addi	s0,sp,16

    userMain();
    800053a4:	ffffd097          	auipc	ra,0xffffd
    800053a8:	838080e7          	jalr	-1992(ra) # 80001bdc <_Z8userMainv>
}
    800053ac:	00813083          	ld	ra,8(sp)
    800053b0:	00013403          	ld	s0,0(sp)
    800053b4:	01010113          	addi	sp,sp,16
    800053b8:	00008067          	ret

00000000800053bc <main>:

int main(){
    800053bc:	fd010113          	addi	sp,sp,-48
    800053c0:	02113423          	sd	ra,40(sp)
    800053c4:	02813023          	sd	s0,32(sp)
    800053c8:	03010413          	addi	s0,sp,48


    riscv::w_stvec((uint64)&supervisorTrap);
    800053cc:	00006797          	auipc	a5,0x6
    800053d0:	59c7b783          	ld	a5,1436(a5) # 8000b968 <_GLOBAL_OFFSET_TABLE_+0x30>
    __asm__ volatile ("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
    return stvec;
}

inline void riscv::w_stvec(uint64 stvec) {
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800053d4:	10579073          	csrw	stvec,a5


    MemoryAllocator::mem_construct();
    800053d8:	00001097          	auipc	ra,0x1
    800053dc:	b54080e7          	jalr	-1196(ra) # 80005f2c <_ZN15MemoryAllocator13mem_constructEv>
    IOSys::io_construct();
    800053e0:	00001097          	auipc	ra,0x1
    800053e4:	a18080e7          	jalr	-1512(ra) # 80005df8 <_ZN5IOSys12io_constructEv>

    thread_t mainHandle, userHandle, idleHandle;
    thread_create(&idleHandle, &Scheduler::idle_thread_function, 0);
    800053e8:	00000613          	li	a2,0
    800053ec:	00006597          	auipc	a1,0x6
    800053f0:	59c5b583          	ld	a1,1436(a1) # 8000b988 <_GLOBAL_OFFSET_TABLE_+0x50>
    800053f4:	fd840513          	addi	a0,s0,-40
    800053f8:	ffffc097          	auipc	ra,0xffffc
    800053fc:	ed0080e7          	jalr	-304(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    Scheduler::idle_tcb = idleHandle;
    80005400:	00006797          	auipc	a5,0x6
    80005404:	5807b783          	ld	a5,1408(a5) # 8000b980 <_GLOBAL_OFFSET_TABLE_+0x48>
    80005408:	fd843703          	ld	a4,-40(s0)
    8000540c:	00e7b023          	sd	a4,0(a5)
    thread_create(&mainHandle, nullptr, 0);
    80005410:	00000613          	li	a2,0
    80005414:	00000593          	li	a1,0
    80005418:	fe840513          	addi	a0,s0,-24
    8000541c:	ffffc097          	auipc	ra,0xffffc
    80005420:	eac080e7          	jalr	-340(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&userHandle, &userWrapper, 0);
    80005424:	00000613          	li	a2,0
    80005428:	00000597          	auipc	a1,0x0
    8000542c:	f6c58593          	addi	a1,a1,-148 # 80005394 <_Z11userWrapperPv>
    80005430:	fe040513          	addi	a0,s0,-32
    80005434:	ffffc097          	auipc	ra,0xffffc
    80005438:	e94080e7          	jalr	-364(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
inline void riscv::w_sip(uint64 sip) {
    __asm__ volatile ("csrw sip, %[sip]" : : [sip] "r"(sip));
}

inline void riscv::ms_sstatus(uint64 mask) {
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    8000543c:	00200793          	li	a5,2
    80005440:	1007a073          	csrs	sstatus,a5
    riscv::ms_sstatus(riscv::SSTATUS_SIE);

    while(!(userHandle->isFinished())) {
    80005444:	fe043783          	ld	a5,-32(s0)
    bool isFinished() const { return is_finished; }
    80005448:	0387c783          	lbu	a5,56(a5)
    8000544c:	00079863          	bnez	a5,8000545c <main+0xa0>
        thread_dispatch();
    80005450:	ffffc097          	auipc	ra,0xffffc
    80005454:	f40080e7          	jalr	-192(ra) # 80001390 <_Z15thread_dispatchv>
    80005458:	fedff06f          	j	80005444 <main+0x88>
}

inline void riscv::mc_sstatus(uint64 mask) {
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000545c:	00200793          	li	a5,2
    80005460:	1007b073          	csrc	sstatus,a5



    riscv::mc_sstatus(riscv::SSTATUS_SIE);

    IOSys::io_destroy();
    80005464:	00001097          	auipc	ra,0x1
    80005468:	a04080e7          	jalr	-1532(ra) # 80005e68 <_ZN5IOSys10io_destroyEv>

    return 0;
    8000546c:	00000513          	li	a0,0
    80005470:	02813083          	ld	ra,40(sp)
    80005474:	02013403          	ld	s0,32(sp)
    80005478:	03010113          	addi	sp,sp,48
    8000547c:	00008067          	ret

0000000080005480 <_ZN6Thread13threadWrapperEPv>:

int Thread::sleep(time_t time_ms) {
    return time_sleep(time_ms);
}

void Thread::threadWrapper(void *arg) {
    80005480:	ff010113          	addi	sp,sp,-16
    80005484:	00113423          	sd	ra,8(sp)
    80005488:	00813023          	sd	s0,0(sp)
    8000548c:	01010413          	addi	s0,sp,16
    Thread *thread = reinterpret_cast<Thread*>(arg);
    if(thread->body){
    80005490:	01053783          	ld	a5,16(a0)
    80005494:	00078e63          	beqz	a5,800054b0 <_ZN6Thread13threadWrapperEPv+0x30>
        thread->body(thread->arg);
    80005498:	01853503          	ld	a0,24(a0)
    8000549c:	000780e7          	jalr	a5
    }
    else{
        thread->run();
    }
}
    800054a0:	00813083          	ld	ra,8(sp)
    800054a4:	00013403          	ld	s0,0(sp)
    800054a8:	01010113          	addi	sp,sp,16
    800054ac:	00008067          	ret
        thread->run();
    800054b0:	00053783          	ld	a5,0(a0)
    800054b4:	0107b783          	ld	a5,16(a5)
    800054b8:	000780e7          	jalr	a5
}
    800054bc:	fe5ff06f          	j	800054a0 <_ZN6Thread13threadWrapperEPv+0x20>

00000000800054c0 <_ZN14PeriodicThread3runEv>:
    this->period = 0;
}

PeriodicThread::PeriodicThread(time_t period) : period(period){}

void PeriodicThread::run() {
    800054c0:	fe010113          	addi	sp,sp,-32
    800054c4:	00113c23          	sd	ra,24(sp)
    800054c8:	00813823          	sd	s0,16(sp)
    800054cc:	00913423          	sd	s1,8(sp)
    800054d0:	02010413          	addi	s0,sp,32
    800054d4:	00050493          	mv	s1,a0
    while(period > 0){
    800054d8:	0204b503          	ld	a0,32(s1)
    800054dc:	02050063          	beqz	a0,800054fc <_ZN14PeriodicThread3runEv+0x3c>
        time_sleep(period);
    800054e0:	ffffc097          	auipc	ra,0xffffc
    800054e4:	0c8080e7          	jalr	200(ra) # 800015a8 <_Z10time_sleepm>
        periodicActivation();
    800054e8:	0004b783          	ld	a5,0(s1)
    800054ec:	0187b783          	ld	a5,24(a5)
    800054f0:	00048513          	mv	a0,s1
    800054f4:	000780e7          	jalr	a5
    while(period > 0){
    800054f8:	fe1ff06f          	j	800054d8 <_ZN14PeriodicThread3runEv+0x18>
    }
}
    800054fc:	01813083          	ld	ra,24(sp)
    80005500:	01013403          	ld	s0,16(sp)
    80005504:	00813483          	ld	s1,8(sp)
    80005508:	02010113          	addi	sp,sp,32
    8000550c:	00008067          	ret

0000000080005510 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore() {
    80005510:	ff010113          	addi	sp,sp,-16
    80005514:	00113423          	sd	ra,8(sp)
    80005518:	00813023          	sd	s0,0(sp)
    8000551c:	01010413          	addi	s0,sp,16
    80005520:	00006797          	auipc	a5,0x6
    80005524:	36878793          	addi	a5,a5,872 # 8000b888 <_ZTV9Semaphore+0x10>
    80005528:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    8000552c:	00853503          	ld	a0,8(a0)
    80005530:	ffffc097          	auipc	ra,0xffffc
    80005534:	f5c080e7          	jalr	-164(ra) # 8000148c <_Z9sem_closeP12SysSemaphore>
}
    80005538:	00813083          	ld	ra,8(sp)
    8000553c:	00013403          	ld	s0,0(sp)
    80005540:	01010113          	addi	sp,sp,16
    80005544:	00008067          	ret

0000000080005548 <_Znwm>:
void *operator new(size_t size) {
    80005548:	ff010113          	addi	sp,sp,-16
    8000554c:	00113423          	sd	ra,8(sp)
    80005550:	00813023          	sd	s0,0(sp)
    80005554:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80005558:	ffffc097          	auipc	ra,0xffffc
    8000555c:	ce4080e7          	jalr	-796(ra) # 8000123c <_Z9mem_allocm>
}
    80005560:	00813083          	ld	ra,8(sp)
    80005564:	00013403          	ld	s0,0(sp)
    80005568:	01010113          	addi	sp,sp,16
    8000556c:	00008067          	ret

0000000080005570 <_Znam>:
void *operator new[](size_t size) {
    80005570:	ff010113          	addi	sp,sp,-16
    80005574:	00113423          	sd	ra,8(sp)
    80005578:	00813023          	sd	s0,0(sp)
    8000557c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80005580:	ffffc097          	auipc	ra,0xffffc
    80005584:	cbc080e7          	jalr	-836(ra) # 8000123c <_Z9mem_allocm>
}
    80005588:	00813083          	ld	ra,8(sp)
    8000558c:	00013403          	ld	s0,0(sp)
    80005590:	01010113          	addi	sp,sp,16
    80005594:	00008067          	ret

0000000080005598 <_ZdlPv>:
void operator delete(void *mem) {
    80005598:	ff010113          	addi	sp,sp,-16
    8000559c:	00113423          	sd	ra,8(sp)
    800055a0:	00813023          	sd	s0,0(sp)
    800055a4:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800055a8:	ffffc097          	auipc	ra,0xffffc
    800055ac:	ce0080e7          	jalr	-800(ra) # 80001288 <_Z8mem_freePv>
}
    800055b0:	00813083          	ld	ra,8(sp)
    800055b4:	00013403          	ld	s0,0(sp)
    800055b8:	01010113          	addi	sp,sp,16
    800055bc:	00008067          	ret

00000000800055c0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800055c0:	fe010113          	addi	sp,sp,-32
    800055c4:	00113c23          	sd	ra,24(sp)
    800055c8:	00813823          	sd	s0,16(sp)
    800055cc:	00913423          	sd	s1,8(sp)
    800055d0:	02010413          	addi	s0,sp,32
    800055d4:	00006797          	auipc	a5,0x6
    800055d8:	28c78793          	addi	a5,a5,652 # 8000b860 <_ZTV6Thread+0x10>
    800055dc:	00f53023          	sd	a5,0(a0)
    if(myHandle->isFinished()){
    800055e0:	00853483          	ld	s1,8(a0)
    800055e4:	0384c783          	lbu	a5,56(s1)
    800055e8:	02078063          	beqz	a5,80005608 <_ZN6ThreadD1Ev+0x48>
        delete myHandle;
    800055ec:	00048e63          	beqz	s1,80005608 <_ZN6ThreadD1Ev+0x48>
    800055f0:	00048513          	mv	a0,s1
    800055f4:	00000097          	auipc	ra,0x0
    800055f8:	694080e7          	jalr	1684(ra) # 80005c88 <_ZN3TCBD1Ev>
    800055fc:	00048513          	mv	a0,s1
    80005600:	00000097          	auipc	ra,0x0
    80005604:	f98080e7          	jalr	-104(ra) # 80005598 <_ZdlPv>
}
    80005608:	01813083          	ld	ra,24(sp)
    8000560c:	01013403          	ld	s0,16(sp)
    80005610:	00813483          	ld	s1,8(sp)
    80005614:	02010113          	addi	sp,sp,32
    80005618:	00008067          	ret

000000008000561c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000561c:	fe010113          	addi	sp,sp,-32
    80005620:	00113c23          	sd	ra,24(sp)
    80005624:	00813823          	sd	s0,16(sp)
    80005628:	00913423          	sd	s1,8(sp)
    8000562c:	02010413          	addi	s0,sp,32
    80005630:	00050493          	mv	s1,a0
}
    80005634:	00000097          	auipc	ra,0x0
    80005638:	f8c080e7          	jalr	-116(ra) # 800055c0 <_ZN6ThreadD1Ev>
    8000563c:	00048513          	mv	a0,s1
    80005640:	00000097          	auipc	ra,0x0
    80005644:	f58080e7          	jalr	-168(ra) # 80005598 <_ZdlPv>
    80005648:	01813083          	ld	ra,24(sp)
    8000564c:	01013403          	ld	s0,16(sp)
    80005650:	00813483          	ld	s1,8(sp)
    80005654:	02010113          	addi	sp,sp,32
    80005658:	00008067          	ret

000000008000565c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    8000565c:	fe010113          	addi	sp,sp,-32
    80005660:	00113c23          	sd	ra,24(sp)
    80005664:	00813823          	sd	s0,16(sp)
    80005668:	00913423          	sd	s1,8(sp)
    8000566c:	02010413          	addi	s0,sp,32
    80005670:	00050493          	mv	s1,a0
}
    80005674:	00000097          	auipc	ra,0x0
    80005678:	e9c080e7          	jalr	-356(ra) # 80005510 <_ZN9SemaphoreD1Ev>
    8000567c:	00048513          	mv	a0,s1
    80005680:	00000097          	auipc	ra,0x0
    80005684:	f18080e7          	jalr	-232(ra) # 80005598 <_ZdlPv>
    80005688:	01813083          	ld	ra,24(sp)
    8000568c:	01013403          	ld	s0,16(sp)
    80005690:	00813483          	ld	s1,8(sp)
    80005694:	02010113          	addi	sp,sp,32
    80005698:	00008067          	ret

000000008000569c <_ZdaPv>:
void operator delete[](void *mem) {
    8000569c:	ff010113          	addi	sp,sp,-16
    800056a0:	00113423          	sd	ra,8(sp)
    800056a4:	00813023          	sd	s0,0(sp)
    800056a8:	01010413          	addi	s0,sp,16
    mem_free(mem);
    800056ac:	ffffc097          	auipc	ra,0xffffc
    800056b0:	bdc080e7          	jalr	-1060(ra) # 80001288 <_Z8mem_freePv>
}
    800056b4:	00813083          	ld	ra,8(sp)
    800056b8:	00013403          	ld	s0,0(sp)
    800056bc:	01010113          	addi	sp,sp,16
    800056c0:	00008067          	ret

00000000800056c4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) : body(body), arg(arg) {}
    800056c4:	ff010113          	addi	sp,sp,-16
    800056c8:	00813423          	sd	s0,8(sp)
    800056cc:	01010413          	addi	s0,sp,16
    800056d0:	00006797          	auipc	a5,0x6
    800056d4:	19078793          	addi	a5,a5,400 # 8000b860 <_ZTV6Thread+0x10>
    800056d8:	00f53023          	sd	a5,0(a0)
    800056dc:	00b53823          	sd	a1,16(a0)
    800056e0:	00c53c23          	sd	a2,24(a0)
    800056e4:	00813403          	ld	s0,8(sp)
    800056e8:	01010113          	addi	sp,sp,16
    800056ec:	00008067          	ret

00000000800056f0 <_ZN6Thread5startEv>:
int Thread::start() {
    800056f0:	ff010113          	addi	sp,sp,-16
    800056f4:	00113423          	sd	ra,8(sp)
    800056f8:	00813023          	sd	s0,0(sp)
    800056fc:	01010413          	addi	s0,sp,16
    return thread_create(&myHandle, &threadWrapper, this);
    80005700:	00050613          	mv	a2,a0
    80005704:	00000597          	auipc	a1,0x0
    80005708:	d7c58593          	addi	a1,a1,-644 # 80005480 <_ZN6Thread13threadWrapperEPv>
    8000570c:	00850513          	addi	a0,a0,8
    80005710:	ffffc097          	auipc	ra,0xffffc
    80005714:	bb8080e7          	jalr	-1096(ra) # 800012c8 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80005718:	00813083          	ld	ra,8(sp)
    8000571c:	00013403          	ld	s0,0(sp)
    80005720:	01010113          	addi	sp,sp,16
    80005724:	00008067          	ret

0000000080005728 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80005728:	ff010113          	addi	sp,sp,-16
    8000572c:	00113423          	sd	ra,8(sp)
    80005730:	00813023          	sd	s0,0(sp)
    80005734:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80005738:	ffffc097          	auipc	ra,0xffffc
    8000573c:	c58080e7          	jalr	-936(ra) # 80001390 <_Z15thread_dispatchv>
}
    80005740:	00813083          	ld	ra,8(sp)
    80005744:	00013403          	ld	s0,0(sp)
    80005748:	01010113          	addi	sp,sp,16
    8000574c:	00008067          	ret

0000000080005750 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time_ms) {
    80005750:	ff010113          	addi	sp,sp,-16
    80005754:	00113423          	sd	ra,8(sp)
    80005758:	00813023          	sd	s0,0(sp)
    8000575c:	01010413          	addi	s0,sp,16
    return time_sleep(time_ms);
    80005760:	ffffc097          	auipc	ra,0xffffc
    80005764:	e48080e7          	jalr	-440(ra) # 800015a8 <_Z10time_sleepm>
}
    80005768:	00813083          	ld	ra,8(sp)
    8000576c:	00013403          	ld	s0,0(sp)
    80005770:	01010113          	addi	sp,sp,16
    80005774:	00008067          	ret

0000000080005778 <_ZN6ThreadC1Ev>:
Thread::Thread() : body(nullptr), arg(nullptr) {}
    80005778:	ff010113          	addi	sp,sp,-16
    8000577c:	00813423          	sd	s0,8(sp)
    80005780:	01010413          	addi	s0,sp,16
    80005784:	00006797          	auipc	a5,0x6
    80005788:	0dc78793          	addi	a5,a5,220 # 8000b860 <_ZTV6Thread+0x10>
    8000578c:	00f53023          	sd	a5,0(a0)
    80005790:	00053823          	sd	zero,16(a0)
    80005794:	00053c23          	sd	zero,24(a0)
    80005798:	00813403          	ld	s0,8(sp)
    8000579c:	01010113          	addi	sp,sp,16
    800057a0:	00008067          	ret

00000000800057a4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800057a4:	ff010113          	addi	sp,sp,-16
    800057a8:	00113423          	sd	ra,8(sp)
    800057ac:	00813023          	sd	s0,0(sp)
    800057b0:	01010413          	addi	s0,sp,16
    800057b4:	00006797          	auipc	a5,0x6
    800057b8:	0d478793          	addi	a5,a5,212 # 8000b888 <_ZTV9Semaphore+0x10>
    800057bc:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    800057c0:	00850513          	addi	a0,a0,8
    800057c4:	ffffc097          	auipc	ra,0xffffc
    800057c8:	c84080e7          	jalr	-892(ra) # 80001448 <_Z8sem_openPP12SysSemaphorej>
}
    800057cc:	00813083          	ld	ra,8(sp)
    800057d0:	00013403          	ld	s0,0(sp)
    800057d4:	01010113          	addi	sp,sp,16
    800057d8:	00008067          	ret

00000000800057dc <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800057dc:	ff010113          	addi	sp,sp,-16
    800057e0:	00113423          	sd	ra,8(sp)
    800057e4:	00813023          	sd	s0,0(sp)
    800057e8:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800057ec:	00853503          	ld	a0,8(a0)
    800057f0:	ffffc097          	auipc	ra,0xffffc
    800057f4:	cdc080e7          	jalr	-804(ra) # 800014cc <_Z8sem_waitP12SysSemaphore>
}
    800057f8:	00813083          	ld	ra,8(sp)
    800057fc:	00013403          	ld	s0,0(sp)
    80005800:	01010113          	addi	sp,sp,16
    80005804:	00008067          	ret

0000000080005808 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80005808:	ff010113          	addi	sp,sp,-16
    8000580c:	00113423          	sd	ra,8(sp)
    80005810:	00813023          	sd	s0,0(sp)
    80005814:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80005818:	00853503          	ld	a0,8(a0)
    8000581c:	ffffc097          	auipc	ra,0xffffc
    80005820:	cf0080e7          	jalr	-784(ra) # 8000150c <_Z10sem_signalP12SysSemaphore>
}
    80005824:	00813083          	ld	ra,8(sp)
    80005828:	00013403          	ld	s0,0(sp)
    8000582c:	01010113          	addi	sp,sp,16
    80005830:	00008067          	ret

0000000080005834 <_ZN9Semaphore9timedWaitEm>:
int Semaphore::timedWait(time_t time) {
    80005834:	ff010113          	addi	sp,sp,-16
    80005838:	00113423          	sd	ra,8(sp)
    8000583c:	00813023          	sd	s0,0(sp)
    80005840:	01010413          	addi	s0,sp,16
    return sem_timedwait(myHandle, time);
    80005844:	00853503          	ld	a0,8(a0)
    80005848:	ffffc097          	auipc	ra,0xffffc
    8000584c:	d04080e7          	jalr	-764(ra) # 8000154c <_Z13sem_timedwaitP12SysSemaphorem>
}
    80005850:	00813083          	ld	ra,8(sp)
    80005854:	00013403          	ld	s0,0(sp)
    80005858:	01010113          	addi	sp,sp,16
    8000585c:	00008067          	ret

0000000080005860 <_ZN9Semaphore7tryWaitEv>:
int Semaphore::tryWait() {
    80005860:	ff010113          	addi	sp,sp,-16
    80005864:	00113423          	sd	ra,8(sp)
    80005868:	00813023          	sd	s0,0(sp)
    8000586c:	01010413          	addi	s0,sp,16
    return sem_trywait(myHandle);
    80005870:	00853503          	ld	a0,8(a0)
    80005874:	ffffc097          	auipc	ra,0xffffc
    80005878:	cf4080e7          	jalr	-780(ra) # 80001568 <_Z11sem_trywaitP12SysSemaphore>
}
    8000587c:	00813083          	ld	ra,8(sp)
    80005880:	00013403          	ld	s0,0(sp)
    80005884:	01010113          	addi	sp,sp,16
    80005888:	00008067          	ret

000000008000588c <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    8000588c:	ff010113          	addi	sp,sp,-16
    80005890:	00813423          	sd	s0,8(sp)
    80005894:	01010413          	addi	s0,sp,16
    this->period = 0;
    80005898:	02053023          	sd	zero,32(a0)
}
    8000589c:	00813403          	ld	s0,8(sp)
    800058a0:	01010113          	addi	sp,sp,16
    800058a4:	00008067          	ret

00000000800058a8 <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : period(period){}
    800058a8:	fe010113          	addi	sp,sp,-32
    800058ac:	00113c23          	sd	ra,24(sp)
    800058b0:	00813823          	sd	s0,16(sp)
    800058b4:	00913423          	sd	s1,8(sp)
    800058b8:	01213023          	sd	s2,0(sp)
    800058bc:	02010413          	addi	s0,sp,32
    800058c0:	00050493          	mv	s1,a0
    800058c4:	00058913          	mv	s2,a1
    800058c8:	00000097          	auipc	ra,0x0
    800058cc:	eb0080e7          	jalr	-336(ra) # 80005778 <_ZN6ThreadC1Ev>
    800058d0:	00006797          	auipc	a5,0x6
    800058d4:	fd878793          	addi	a5,a5,-40 # 8000b8a8 <_ZTV14PeriodicThread+0x10>
    800058d8:	00f4b023          	sd	a5,0(s1)
    800058dc:	0324b023          	sd	s2,32(s1)
    800058e0:	01813083          	ld	ra,24(sp)
    800058e4:	01013403          	ld	s0,16(sp)
    800058e8:	00813483          	ld	s1,8(sp)
    800058ec:	00013903          	ld	s2,0(sp)
    800058f0:	02010113          	addi	sp,sp,32
    800058f4:	00008067          	ret

00000000800058f8 <_ZN7Console4getcEv>:

char Console::getc() {
    800058f8:	ff010113          	addi	sp,sp,-16
    800058fc:	00113423          	sd	ra,8(sp)
    80005900:	00813023          	sd	s0,0(sp)
    80005904:	01010413          	addi	s0,sp,16
    return ::getc();
    80005908:	ffffc097          	auipc	ra,0xffffc
    8000590c:	ac4080e7          	jalr	-1340(ra) # 800013cc <_Z4getcv>
}
    80005910:	00813083          	ld	ra,8(sp)
    80005914:	00013403          	ld	s0,0(sp)
    80005918:	01010113          	addi	sp,sp,16
    8000591c:	00008067          	ret

0000000080005920 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80005920:	ff010113          	addi	sp,sp,-16
    80005924:	00113423          	sd	ra,8(sp)
    80005928:	00813023          	sd	s0,0(sp)
    8000592c:	01010413          	addi	s0,sp,16
    ::putc(c);
    80005930:	ffffc097          	auipc	ra,0xffffc
    80005934:	adc080e7          	jalr	-1316(ra) # 8000140c <_Z4putcc>
}
    80005938:	00813083          	ld	ra,8(sp)
    8000593c:	00013403          	ld	s0,0(sp)
    80005940:	01010113          	addi	sp,sp,16
    80005944:	00008067          	ret

0000000080005948 <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);

protected:
    Thread ();
    virtual void run () {}
    80005948:	ff010113          	addi	sp,sp,-16
    8000594c:	00813423          	sd	s0,8(sp)
    80005950:	01010413          	addi	s0,sp,16
    80005954:	00813403          	ld	s0,8(sp)
    80005958:	01010113          	addi	sp,sp,16
    8000595c:	00008067          	ret

0000000080005960 <_ZN14PeriodicThread18periodicActivationEv>:
class PeriodicThread : public Thread {
public:
    void terminate ();
protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation () {}
    80005960:	ff010113          	addi	sp,sp,-16
    80005964:	00813423          	sd	s0,8(sp)
    80005968:	01010413          	addi	s0,sp,16
    8000596c:	00813403          	ld	s0,8(sp)
    80005970:	01010113          	addi	sp,sp,16
    80005974:	00008067          	ret

0000000080005978 <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    80005978:	ff010113          	addi	sp,sp,-16
    8000597c:	00113423          	sd	ra,8(sp)
    80005980:	00813023          	sd	s0,0(sp)
    80005984:	01010413          	addi	s0,sp,16
    80005988:	00006797          	auipc	a5,0x6
    8000598c:	f2078793          	addi	a5,a5,-224 # 8000b8a8 <_ZTV14PeriodicThread+0x10>
    80005990:	00f53023          	sd	a5,0(a0)
    80005994:	00000097          	auipc	ra,0x0
    80005998:	c2c080e7          	jalr	-980(ra) # 800055c0 <_ZN6ThreadD1Ev>
    8000599c:	00813083          	ld	ra,8(sp)
    800059a0:	00013403          	ld	s0,0(sp)
    800059a4:	01010113          	addi	sp,sp,16
    800059a8:	00008067          	ret

00000000800059ac <_ZN14PeriodicThreadD0Ev>:
    800059ac:	fe010113          	addi	sp,sp,-32
    800059b0:	00113c23          	sd	ra,24(sp)
    800059b4:	00813823          	sd	s0,16(sp)
    800059b8:	00913423          	sd	s1,8(sp)
    800059bc:	02010413          	addi	s0,sp,32
    800059c0:	00050493          	mv	s1,a0
    800059c4:	00006797          	auipc	a5,0x6
    800059c8:	ee478793          	addi	a5,a5,-284 # 8000b8a8 <_ZTV14PeriodicThread+0x10>
    800059cc:	00f53023          	sd	a5,0(a0)
    800059d0:	00000097          	auipc	ra,0x0
    800059d4:	bf0080e7          	jalr	-1040(ra) # 800055c0 <_ZN6ThreadD1Ev>
    800059d8:	00048513          	mv	a0,s1
    800059dc:	00000097          	auipc	ra,0x0
    800059e0:	bbc080e7          	jalr	-1092(ra) # 80005598 <_ZdlPv>
    800059e4:	01813083          	ld	ra,24(sp)
    800059e8:	01013403          	ld	s0,16(sp)
    800059ec:	00813483          	ld	s1,8(sp)
    800059f0:	02010113          	addi	sp,sp,32
    800059f4:	00008067          	ret

00000000800059f8 <_ZN5riscv10popSppSpieEv>:
//

#include "../h/riscv.hpp"
#include "../lib/console.h"

void riscv::popSppSpie(){
    800059f8:	ff010113          	addi	sp,sp,-16
    800059fc:	00813423          	sd	s0,8(sp)
    80005a00:	01010413          	addi	s0,sp,16
    80005a04:	10000793          	li	a5,256
    80005a08:	1007b073          	csrc	sstatus,a5
    riscv::mc_sstatus(riscv::SSTATUS_SPP);
    __asm__ volatile("csrw sepc, ra");
    80005a0c:	14109073          	csrw	sepc,ra
    __asm__ volatile("sret");
    80005a10:	10200073          	sret
}
    80005a14:	00813403          	ld	s0,8(sp)
    80005a18:	01010113          	addi	sp,sp,16
    80005a1c:	00008067          	ret

0000000080005a20 <_ZN3TCBC1EPFvPvES0_S0_>:
TCB *TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;
Queue TCB::sleepingQueue;
uint64 TCB::clock = 0;

TCB::TCB(TCB::Body body, void* arg, void* stack)
    80005a20:	ff010113          	addi	sp,sp,-16
    80005a24:	00813423          	sd	s0,8(sp)
    80005a28:	01010413          	addi	s0,sp,16
          stack(stack),
          context({(uint64) &threadWrapper, ((uint64)((char*)stack + DEFAULT_STACK_SIZE)) & (~0xFL)}),
          is_finished(false),
          is_suspended(false),
          is_asleep(false),
          timeSlice(DEFAULT_TIME_SLICE)
    80005a2c:	00053023          	sd	zero,0(a0)
    80005a30:	00053423          	sd	zero,8(a0)
    80005a34:	00b53823          	sd	a1,16(a0)
    80005a38:	00c53c23          	sd	a2,24(a0)
    80005a3c:	02d53023          	sd	a3,32(a0)
    80005a40:	00000797          	auipc	a5,0x0
    80005a44:	16478793          	addi	a5,a5,356 # 80005ba4 <_ZN3TCB13threadWrapperEv>
    80005a48:	02f53423          	sd	a5,40(a0)
          context({(uint64) &threadWrapper, ((uint64)((char*)stack + DEFAULT_STACK_SIZE)) & (~0xFL)}),
    80005a4c:	000017b7          	lui	a5,0x1
    80005a50:	00f686b3          	add	a3,a3,a5
    80005a54:	ff06f693          	andi	a3,a3,-16
          timeSlice(DEFAULT_TIME_SLICE)
    80005a58:	02d53823          	sd	a3,48(a0)
    80005a5c:	02050c23          	sb	zero,56(a0)
    80005a60:	02050ca3          	sb	zero,57(a0)
    80005a64:	02050d23          	sb	zero,58(a0)
    80005a68:	00200793          	li	a5,2
    80005a6c:	04f53023          	sd	a5,64(a0)
{

}
    80005a70:	00813403          	ld	s0,8(sp)
    80005a74:	01010113          	addi	sp,sp,16
    80005a78:	00008067          	ret

0000000080005a7c <_ZN3TCB17sys_thread_createEPPS_PFvPvES2_S2_>:

int TCB::sys_thread_create(thread_t *handle, Body body, void* arg, void* stack) {
    80005a7c:	fc010113          	addi	sp,sp,-64
    80005a80:	02113c23          	sd	ra,56(sp)
    80005a84:	02813823          	sd	s0,48(sp)
    80005a88:	02913423          	sd	s1,40(sp)
    80005a8c:	03213023          	sd	s2,32(sp)
    80005a90:	01313c23          	sd	s3,24(sp)
    80005a94:	01413823          	sd	s4,16(sp)
    80005a98:	01513423          	sd	s5,8(sp)
    80005a9c:	04010413          	addi	s0,sp,64
    80005aa0:	00050493          	mv	s1,a0
    80005aa4:	00058913          	mv	s2,a1
    80005aa8:	00060a13          	mv	s4,a2
    80005aac:	00068a93          	mv	s5,a3
    *handle = new TCB(body, arg, stack);
    80005ab0:	05000513          	li	a0,80
    80005ab4:	00000097          	auipc	ra,0x0
    80005ab8:	a94080e7          	jalr	-1388(ra) # 80005548 <_Znwm>
    80005abc:	00050993          	mv	s3,a0
    80005ac0:	000a8693          	mv	a3,s5
    80005ac4:	000a0613          	mv	a2,s4
    80005ac8:	00090593          	mv	a1,s2
    80005acc:	00000097          	auipc	ra,0x0
    80005ad0:	f54080e7          	jalr	-172(ra) # 80005a20 <_ZN3TCBC1EPFvPvES0_S0_>
    80005ad4:	0134b023          	sd	s3,0(s1)
    if(body) Scheduler::put(*handle);
    80005ad8:	04090063          	beqz	s2,80005b18 <_ZN3TCB17sys_thread_createEPPS_PFvPvES2_S2_+0x9c>
    80005adc:	00098513          	mv	a0,s3
    80005ae0:	fffff097          	auipc	ra,0xfffff
    80005ae4:	7c4080e7          	jalr	1988(ra) # 800052a4 <_ZN9Scheduler3putEP3TCB>
    else TCB::running = *handle;
    if(*handle == nullptr) {
    80005ae8:	0004b783          	ld	a5,0(s1)
    80005aec:	02078c63          	beqz	a5,80005b24 <_ZN3TCB17sys_thread_createEPPS_PFvPvES2_S2_+0xa8>
        return -2; // Failed to create object
    }

    return 0;
    80005af0:	00000513          	li	a0,0
}
    80005af4:	03813083          	ld	ra,56(sp)
    80005af8:	03013403          	ld	s0,48(sp)
    80005afc:	02813483          	ld	s1,40(sp)
    80005b00:	02013903          	ld	s2,32(sp)
    80005b04:	01813983          	ld	s3,24(sp)
    80005b08:	01013a03          	ld	s4,16(sp)
    80005b0c:	00813a83          	ld	s5,8(sp)
    80005b10:	04010113          	addi	sp,sp,64
    80005b14:	00008067          	ret
    else TCB::running = *handle;
    80005b18:	00006797          	auipc	a5,0x6
    80005b1c:	f337b823          	sd	s3,-208(a5) # 8000ba48 <_ZN3TCB7runningE>
    80005b20:	fc9ff06f          	j	80005ae8 <_ZN3TCB17sys_thread_createEPPS_PFvPvES2_S2_+0x6c>
        return -2; // Failed to create object
    80005b24:	ffe00513          	li	a0,-2
    80005b28:	fcdff06f          	j	80005af4 <_ZN3TCB17sys_thread_createEPPS_PFvPvES2_S2_+0x78>

0000000080005b2c <_ZN3TCB5yieldEv>:

void TCB::sys_thread_dispach() {
    TCB::yield();
}

void TCB::yield() {
    80005b2c:	ff010113          	addi	sp,sp,-16
    80005b30:	00813423          	sd	s0,8(sp)
    80005b34:	01010413          	addi	s0,sp,16
    uint64 call_code = ABI::SystemCallCode::YIELD;
    __asm__ volatile (
            "mv a0, %[code]"
            :
            : [code] "r" (call_code)
    );
    80005b38:	00f00793          	li	a5,15
    80005b3c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80005b40:	00000073          	ecall
}
    80005b44:	00813403          	ld	s0,8(sp)
    80005b48:	01010113          	addi	sp,sp,16
    80005b4c:	00008067          	ret

0000000080005b50 <_ZN3TCB15sys_thread_exitEv>:
int TCB::sys_thread_exit() {
    80005b50:	ff010113          	addi	sp,sp,-16
    80005b54:	00113423          	sd	ra,8(sp)
    80005b58:	00813023          	sd	s0,0(sp)
    80005b5c:	01010413          	addi	s0,sp,16
    running->setFinished(true);
    80005b60:	00006797          	auipc	a5,0x6
    80005b64:	ee87b783          	ld	a5,-280(a5) # 8000ba48 <_ZN3TCB7runningE>
    void setFinished(bool finished) { TCB::is_finished = finished; }
    80005b68:	00100713          	li	a4,1
    80005b6c:	02e78c23          	sb	a4,56(a5)
    if(mem_free(TCB::running->stack) < 0) return -1; //Couldn't deallocate stack properly
    80005b70:	0207b503          	ld	a0,32(a5)
    80005b74:	ffffb097          	auipc	ra,0xffffb
    80005b78:	714080e7          	jalr	1812(ra) # 80001288 <_Z8mem_freePv>
    80005b7c:	02054063          	bltz	a0,80005b9c <_ZN3TCB15sys_thread_exitEv+0x4c>
    TCB::yield();
    80005b80:	00000097          	auipc	ra,0x0
    80005b84:	fac080e7          	jalr	-84(ra) # 80005b2c <_ZN3TCB5yieldEv>
    return 0;
    80005b88:	00000513          	li	a0,0
}
    80005b8c:	00813083          	ld	ra,8(sp)
    80005b90:	00013403          	ld	s0,0(sp)
    80005b94:	01010113          	addi	sp,sp,16
    80005b98:	00008067          	ret
    if(mem_free(TCB::running->stack) < 0) return -1; //Couldn't deallocate stack properly
    80005b9c:	fff00513          	li	a0,-1
    80005ba0:	fedff06f          	j	80005b8c <_ZN3TCB15sys_thread_exitEv+0x3c>

0000000080005ba4 <_ZN3TCB13threadWrapperEv>:

    TCB::contextSwitch(&old->context, &running->context);
}


void TCB::threadWrapper() {
    80005ba4:	ff010113          	addi	sp,sp,-16
    80005ba8:	00113423          	sd	ra,8(sp)
    80005bac:	00813023          	sd	s0,0(sp)
    80005bb0:	01010413          	addi	s0,sp,16

    riscv::popSppSpie();
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	e44080e7          	jalr	-444(ra) # 800059f8 <_ZN5riscv10popSppSpieEv>

    running->body(TCB::running->arg);
    80005bbc:	00006797          	auipc	a5,0x6
    80005bc0:	e8c7b783          	ld	a5,-372(a5) # 8000ba48 <_ZN3TCB7runningE>
    80005bc4:	0107b703          	ld	a4,16(a5)
    80005bc8:	0187b503          	ld	a0,24(a5)
    80005bcc:	000700e7          	jalr	a4
    sys_thread_exit();
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	f80080e7          	jalr	-128(ra) # 80005b50 <_ZN3TCB15sys_thread_exitEv>
}
    80005bd8:	00813083          	ld	ra,8(sp)
    80005bdc:	00013403          	ld	s0,0(sp)
    80005be0:	01010113          	addi	sp,sp,16
    80005be4:	00008067          	ret

0000000080005be8 <_ZN3TCB18sys_thread_dispachEv>:
void TCB::sys_thread_dispach() {
    80005be8:	ff010113          	addi	sp,sp,-16
    80005bec:	00113423          	sd	ra,8(sp)
    80005bf0:	00813023          	sd	s0,0(sp)
    80005bf4:	01010413          	addi	s0,sp,16
    TCB::yield();
    80005bf8:	00000097          	auipc	ra,0x0
    80005bfc:	f34080e7          	jalr	-204(ra) # 80005b2c <_ZN3TCB5yieldEv>
}
    80005c00:	00813083          	ld	ra,8(sp)
    80005c04:	00013403          	ld	s0,0(sp)
    80005c08:	01010113          	addi	sp,sp,16
    80005c0c:	00008067          	ret

0000000080005c10 <_ZN3TCB8dispatchEv>:
void TCB::dispatch() {
    80005c10:	fe010113          	addi	sp,sp,-32
    80005c14:	00113c23          	sd	ra,24(sp)
    80005c18:	00813823          	sd	s0,16(sp)
    80005c1c:	00913423          	sd	s1,8(sp)
    80005c20:	02010413          	addi	s0,sp,32
    TCB *old = running;
    80005c24:	00006497          	auipc	s1,0x6
    80005c28:	e244b483          	ld	s1,-476(s1) # 8000ba48 <_ZN3TCB7runningE>
    if(!old->is_finished && !old->is_suspended && !old->is_asleep){
    80005c2c:	0384c783          	lbu	a5,56(s1)
    80005c30:	00079a63          	bnez	a5,80005c44 <_ZN3TCB8dispatchEv+0x34>
    80005c34:	0394c783          	lbu	a5,57(s1)
    80005c38:	00079663          	bnez	a5,80005c44 <_ZN3TCB8dispatchEv+0x34>
    80005c3c:	03a4c783          	lbu	a5,58(s1)
    80005c40:	02078c63          	beqz	a5,80005c78 <_ZN3TCB8dispatchEv+0x68>
    running = Scheduler::get();
    80005c44:	fffff097          	auipc	ra,0xfffff
    80005c48:	6b4080e7          	jalr	1716(ra) # 800052f8 <_ZN9Scheduler3getEv>
    80005c4c:	00006797          	auipc	a5,0x6
    80005c50:	dea7be23          	sd	a0,-516(a5) # 8000ba48 <_ZN3TCB7runningE>
    TCB::contextSwitch(&old->context, &running->context);
    80005c54:	02850593          	addi	a1,a0,40
    80005c58:	02848513          	addi	a0,s1,40
    80005c5c:	ffffb097          	auipc	ra,0xffffb
    80005c60:	5cc080e7          	jalr	1484(ra) # 80001228 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80005c64:	01813083          	ld	ra,24(sp)
    80005c68:	01013403          	ld	s0,16(sp)
    80005c6c:	00813483          	ld	s1,8(sp)
    80005c70:	02010113          	addi	sp,sp,32
    80005c74:	00008067          	ret
        Scheduler::put(old);
    80005c78:	00048513          	mv	a0,s1
    80005c7c:	fffff097          	auipc	ra,0xfffff
    80005c80:	628080e7          	jalr	1576(ra) # 800052a4 <_ZN9Scheduler3putEP3TCB>
    80005c84:	fc1ff06f          	j	80005c44 <_ZN3TCB8dispatchEv+0x34>

0000000080005c88 <_ZN3TCBD1Ev>:

TCB::~TCB() {
    80005c88:	ff010113          	addi	sp,sp,-16
    80005c8c:	00113423          	sd	ra,8(sp)
    80005c90:	00813023          	sd	s0,0(sp)
    80005c94:	01010413          	addi	s0,sp,16
    mem_free(stack);
    80005c98:	02053503          	ld	a0,32(a0)
    80005c9c:	ffffb097          	auipc	ra,0xffffb
    80005ca0:	5ec080e7          	jalr	1516(ra) # 80001288 <_Z8mem_freePv>
}
    80005ca4:	00813083          	ld	ra,8(sp)
    80005ca8:	00013403          	ld	s0,0(sp)
    80005cac:	01010113          	addi	sp,sp,16
    80005cb0:	00008067          	ret

0000000080005cb4 <_ZN3TCB14sys_time_sleepEm>:

int TCB::sys_time_sleep(time_t sleep_time) {
    80005cb4:	ff010113          	addi	sp,sp,-16
    80005cb8:	00113423          	sd	ra,8(sp)
    80005cbc:	00813023          	sd	s0,0(sp)
    80005cc0:	01010413          	addi	s0,sp,16
    TCB::running->setSleep(true);
    80005cc4:	00006717          	auipc	a4,0x6
    80005cc8:	d8470713          	addi	a4,a4,-636 # 8000ba48 <_ZN3TCB7runningE>
    80005ccc:	00073783          	ld	a5,0(a4)
    void setSleep(bool asleep) { TCB::is_asleep = asleep; }
    80005cd0:	00100693          	li	a3,1
    80005cd4:	02d78d23          	sb	a3,58(a5)
    TCB::running->sleepTime = sleep_time;
    80005cd8:	04a7b423          	sd	a0,72(a5)
        if (head == nullptr) {
    80005cdc:	00873703          	ld	a4,8(a4)
    80005ce0:	02070e63          	beqz	a4,80005d1c <_ZN3TCB14sys_time_sleepEm+0x68>
            tail->next = tcb;
    80005ce4:	00006717          	auipc	a4,0x6
    80005ce8:	d6470713          	addi	a4,a4,-668 # 8000ba48 <_ZN3TCB7runningE>
    80005cec:	01073683          	ld	a3,16(a4)
    80005cf0:	00f6b023          	sd	a5,0(a3)
            tcb->prev = tail;
    80005cf4:	01073683          	ld	a3,16(a4)
    80005cf8:	00d7b423          	sd	a3,8(a5)
            tail = tcb;
    80005cfc:	00f73823          	sd	a5,16(a4)
    sleepingQueue.put(TCB::running);
    TCB::sys_thread_dispach();
    80005d00:	00000097          	auipc	ra,0x0
    80005d04:	ee8080e7          	jalr	-280(ra) # 80005be8 <_ZN3TCB18sys_thread_dispachEv>
    return 0;
}
    80005d08:	00000513          	li	a0,0
    80005d0c:	00813083          	ld	ra,8(sp)
    80005d10:	00013403          	ld	s0,0(sp)
    80005d14:	01010113          	addi	sp,sp,16
    80005d18:	00008067          	ret
            head = tail = tcb;
    80005d1c:	00006717          	auipc	a4,0x6
    80005d20:	d2c70713          	addi	a4,a4,-724 # 8000ba48 <_ZN3TCB7runningE>
    80005d24:	00f73823          	sd	a5,16(a4)
    80005d28:	00f73423          	sd	a5,8(a4)
    80005d2c:	fd5ff06f          	j	80005d00 <_ZN3TCB14sys_time_sleepEm+0x4c>

0000000080005d30 <_ZN3TCB14sleepCountdownEv>:
        return tcb;
    }

    TCB* peek(){
        return head;
    80005d30:	00006517          	auipc	a0,0x6
    80005d34:	d2053503          	ld	a0,-736(a0) # 8000ba50 <_ZN3TCB13sleepingQueueE>

void TCB::sleepCountdown() {
    TCB *next = sleepingQueue.peek();
    while(next){
    80005d38:	04050863          	beqz	a0,80005d88 <_ZN3TCB14sleepCountdownEv+0x58>
        next->sleepTime--;
    80005d3c:	04853783          	ld	a5,72(a0)
    80005d40:	fff78793          	addi	a5,a5,-1
    80005d44:	04f53423          	sd	a5,72(a0)
        if(next->sleepTime <= 0){
    80005d48:	04078263          	beqz	a5,80005d8c <_ZN3TCB14sleepCountdownEv+0x5c>
            next = to_wake->next; // Move to the next TCB in the list

            to_wake->next = to_wake->prev = nullptr; // Clean up links in the woken TCB
            Scheduler::put(to_wake); // Add the TCB to the ready queue
        } else{
            next = next->next;
    80005d4c:	00053503          	ld	a0,0(a0)
    80005d50:	fe9ff06f          	j	80005d38 <_ZN3TCB14sleepCountdownEv+0x8>
                sleepingQueue.head = to_wake->next; // if to_wake was the head
    80005d54:	00053783          	ld	a5,0(a0)
    80005d58:	00006717          	auipc	a4,0x6
    80005d5c:	cef73c23          	sd	a5,-776(a4) # 8000ba50 <_ZN3TCB13sleepingQueueE>
    80005d60:	0540006f          	j	80005db4 <_ZN3TCB14sleepCountdownEv+0x84>
                sleepingQueue.tail = to_wake->prev; // if to_wake was the tail
    80005d64:	00853783          	ld	a5,8(a0)
    80005d68:	00006717          	auipc	a4,0x6
    80005d6c:	cef73823          	sd	a5,-784(a4) # 8000ba58 <_ZN3TCB13sleepingQueueE+0x8>
    80005d70:	0540006f          	j	80005dc4 <_ZN3TCB14sleepCountdownEv+0x94>
        }
    }
}
    80005d74:	01813083          	ld	ra,24(sp)
    80005d78:	01013403          	ld	s0,16(sp)
    80005d7c:	00813483          	ld	s1,8(sp)
    80005d80:	02010113          	addi	sp,sp,32
    80005d84:	00008067          	ret
    80005d88:	00008067          	ret
void TCB::sleepCountdown() {
    80005d8c:	fe010113          	addi	sp,sp,-32
    80005d90:	00113c23          	sd	ra,24(sp)
    80005d94:	00813823          	sd	s0,16(sp)
    80005d98:	00913423          	sd	s1,8(sp)
    80005d9c:	02010413          	addi	s0,sp,32
    80005da0:	02050d23          	sb	zero,58(a0)
            if (to_wake->prev) {
    80005da4:	00853783          	ld	a5,8(a0)
    80005da8:	fa0786e3          	beqz	a5,80005d54 <_ZN3TCB14sleepCountdownEv+0x24>
                to_wake->prev->next = to_wake->next;
    80005dac:	00053703          	ld	a4,0(a0)
    80005db0:	00e7b023          	sd	a4,0(a5)
            if (to_wake->next) {
    80005db4:	00053783          	ld	a5,0(a0)
    80005db8:	fa0786e3          	beqz	a5,80005d64 <_ZN3TCB14sleepCountdownEv+0x34>
                to_wake->next->prev = to_wake->prev;
    80005dbc:	00853703          	ld	a4,8(a0)
    80005dc0:	00e7b423          	sd	a4,8(a5)
            next = to_wake->next; // Move to the next TCB in the list
    80005dc4:	00053483          	ld	s1,0(a0)
            to_wake->next = to_wake->prev = nullptr; // Clean up links in the woken TCB
    80005dc8:	00053423          	sd	zero,8(a0)
    80005dcc:	00053023          	sd	zero,0(a0)
            Scheduler::put(to_wake); // Add the TCB to the ready queue
    80005dd0:	fffff097          	auipc	ra,0xfffff
    80005dd4:	4d4080e7          	jalr	1236(ra) # 800052a4 <_ZN9Scheduler3putEP3TCB>
            next = to_wake->next; // Move to the next TCB in the list
    80005dd8:	00048513          	mv	a0,s1
    while(next){
    80005ddc:	f8050ce3          	beqz	a0,80005d74 <_ZN3TCB14sleepCountdownEv+0x44>
        next->sleepTime--;
    80005de0:	04853783          	ld	a5,72(a0)
    80005de4:	fff78793          	addi	a5,a5,-1
    80005de8:	04f53423          	sd	a5,72(a0)
        if(next->sleepTime <= 0){
    80005dec:	fa078ae3          	beqz	a5,80005da0 <_ZN3TCB14sleepCountdownEv+0x70>
            next = next->next;
    80005df0:	00053503          	ld	a0,0(a0)
    80005df4:	fe9ff06f          	j	80005ddc <_ZN3TCB14sleepCountdownEv+0xac>

0000000080005df8 <_ZN5IOSys12io_constructEv>:


IOBuffer* IOSys::iBuffer = nullptr;
IOBuffer* IOSys::oBuffer = nullptr;

void IOSys::io_construct() {
    80005df8:	fe010113          	addi	sp,sp,-32
    80005dfc:	00113c23          	sd	ra,24(sp)
    80005e00:	00813823          	sd	s0,16(sp)
    80005e04:	00913423          	sd	s1,8(sp)
    80005e08:	02010413          	addi	s0,sp,32
    iBuffer = reinterpret_cast<IOBuffer*>(mem_alloc(sizeof(IOBuffer)));
    80005e0c:	03000513          	li	a0,48
    80005e10:	ffffb097          	auipc	ra,0xffffb
    80005e14:	42c080e7          	jalr	1068(ra) # 8000123c <_Z9mem_allocm>
    80005e18:	00006497          	auipc	s1,0x6
    80005e1c:	c5848493          	addi	s1,s1,-936 # 8000ba70 <_ZN5IOSys7iBufferE>
    80005e20:	00a4b023          	sd	a0,0(s1)
    oBuffer = reinterpret_cast<IOBuffer*>(mem_alloc(sizeof(IOBuffer)));
    80005e24:	03000513          	li	a0,48
    80005e28:	ffffb097          	auipc	ra,0xffffb
    80005e2c:	414080e7          	jalr	1044(ra) # 8000123c <_Z9mem_allocm>
    80005e30:	00a4b423          	sd	a0,8(s1)
    iBuffer->init(DEFAULT_BUFFER_CAPACITY);
    80005e34:	00600593          	li	a1,6
    80005e38:	0004b503          	ld	a0,0(s1)
    80005e3c:	ffffb097          	auipc	ra,0xffffb
    80005e40:	7ac080e7          	jalr	1964(ra) # 800015e8 <_ZN8IOBuffer4initEh>
    oBuffer->init(DEFAULT_BUFFER_CAPACITY);
    80005e44:	00600593          	li	a1,6
    80005e48:	0084b503          	ld	a0,8(s1)
    80005e4c:	ffffb097          	auipc	ra,0xffffb
    80005e50:	79c080e7          	jalr	1948(ra) # 800015e8 <_ZN8IOBuffer4initEh>
}
    80005e54:	01813083          	ld	ra,24(sp)
    80005e58:	01013403          	ld	s0,16(sp)
    80005e5c:	00813483          	ld	s1,8(sp)
    80005e60:	02010113          	addi	sp,sp,32
    80005e64:	00008067          	ret

0000000080005e68 <_ZN5IOSys10io_destroyEv>:

void IOSys::io_destroy() {
    80005e68:	fe010113          	addi	sp,sp,-32
    80005e6c:	00113c23          	sd	ra,24(sp)
    80005e70:	00813823          	sd	s0,16(sp)
    80005e74:	00913423          	sd	s1,8(sp)
    80005e78:	02010413          	addi	s0,sp,32
    iBuffer->destroy();
    80005e7c:	00006497          	auipc	s1,0x6
    80005e80:	bf448493          	addi	s1,s1,-1036 # 8000ba70 <_ZN5IOSys7iBufferE>
    80005e84:	0004b503          	ld	a0,0(s1)
    80005e88:	ffffb097          	auipc	ra,0xffffb
    80005e8c:	7c0080e7          	jalr	1984(ra) # 80001648 <_ZN8IOBuffer7destroyEv>
    oBuffer->destroy();
    80005e90:	0084b503          	ld	a0,8(s1)
    80005e94:	ffffb097          	auipc	ra,0xffffb
    80005e98:	7b4080e7          	jalr	1972(ra) # 80001648 <_ZN8IOBuffer7destroyEv>
    mem_free(iBuffer);
    80005e9c:	0004b503          	ld	a0,0(s1)
    80005ea0:	ffffb097          	auipc	ra,0xffffb
    80005ea4:	3e8080e7          	jalr	1000(ra) # 80001288 <_Z8mem_freePv>
    mem_free(oBuffer);
    80005ea8:	0084b503          	ld	a0,8(s1)
    80005eac:	ffffb097          	auipc	ra,0xffffb
    80005eb0:	3dc080e7          	jalr	988(ra) # 80001288 <_Z8mem_freePv>
}
    80005eb4:	01813083          	ld	ra,24(sp)
    80005eb8:	01013403          	ld	s0,16(sp)
    80005ebc:	00813483          	ld	s1,8(sp)
    80005ec0:	02010113          	addi	sp,sp,32
    80005ec4:	00008067          	ret

0000000080005ec8 <_ZN5IOSys8sys_putcEc>:

void IOSys::sys_putc(char c) {
    80005ec8:	ff010113          	addi	sp,sp,-16
    80005ecc:	00113423          	sd	ra,8(sp)
    80005ed0:	00813023          	sd	s0,0(sp)
    80005ed4:	01010413          	addi	s0,sp,16
    80005ed8:	00050593          	mv	a1,a0
    oBuffer->enqueue(c);
    80005edc:	00006517          	auipc	a0,0x6
    80005ee0:	b9c53503          	ld	a0,-1124(a0) # 8000ba78 <_ZN5IOSys7oBufferE>
    80005ee4:	ffffc097          	auipc	ra,0xffffc
    80005ee8:	900080e7          	jalr	-1792(ra) # 800017e4 <_ZN8IOBuffer7enqueueEc>
}
    80005eec:	00813083          	ld	ra,8(sp)
    80005ef0:	00013403          	ld	s0,0(sp)
    80005ef4:	01010113          	addi	sp,sp,16
    80005ef8:	00008067          	ret

0000000080005efc <_ZN5IOSys8sys_getcEv>:

char IOSys::sys_getc() {
    80005efc:	ff010113          	addi	sp,sp,-16
    80005f00:	00113423          	sd	ra,8(sp)
    80005f04:	00813023          	sd	s0,0(sp)
    80005f08:	01010413          	addi	s0,sp,16
    return iBuffer->dequeue();
    80005f0c:	00006517          	auipc	a0,0x6
    80005f10:	b6453503          	ld	a0,-1180(a0) # 8000ba70 <_ZN5IOSys7iBufferE>
    80005f14:	ffffc097          	auipc	ra,0xffffc
    80005f18:	824080e7          	jalr	-2012(ra) # 80001738 <_ZN8IOBuffer7dequeueEv>
}
    80005f1c:	00813083          	ld	ra,8(sp)
    80005f20:	00013403          	ld	s0,0(sp)
    80005f24:	01010113          	addi	sp,sp,16
    80005f28:	00008067          	ret

0000000080005f2c <_ZN15MemoryAllocator13mem_constructEv>:
#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/proto_print.hpp"
MemoryAllocator::BlockHeader* MemoryAllocator::freeMemHead = nullptr;

void MemoryAllocator::mem_construct() {
    80005f2c:	ff010113          	addi	sp,sp,-16
    80005f30:	00813423          	sd	s0,8(sp)
    80005f34:	01010413          	addi	s0,sp,16
    //At beginning the free memory list is just one block that points to the start of address space
    MemoryAllocator::freeMemHead = (MemoryAllocator::BlockHeader*)(HEAP_START_ADDR);
    80005f38:	00006697          	auipc	a3,0x6
    80005f3c:	a186b683          	ld	a3,-1512(a3) # 8000b950 <_GLOBAL_OFFSET_TABLE_+0x18>
    80005f40:	0006b783          	ld	a5,0(a3)
    80005f44:	00006717          	auipc	a4,0x6
    80005f48:	b3c70713          	addi	a4,a4,-1220 # 8000ba80 <_ZN15MemoryAllocator11freeMemHeadE>
    80005f4c:	00f73023          	sd	a5,0(a4)
    MemoryAllocator::freeMemHead->next = nullptr;
    80005f50:	0007b023          	sd	zero,0(a5)
    MemoryAllocator::freeMemHead->size = reinterpret_cast<uint64>(HEAP_END_ADDR) - reinterpret_cast<uint64>(HEAP_START_ADDR) - MemoryAllocator::HEADER_SIZE;
    80005f54:	00006797          	auipc	a5,0x6
    80005f58:	a447b783          	ld	a5,-1468(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x60>
    80005f5c:	0007b783          	ld	a5,0(a5)
    80005f60:	0006b683          	ld	a3,0(a3)
    80005f64:	40d787b3          	sub	a5,a5,a3
    80005f68:	00073703          	ld	a4,0(a4)
    80005f6c:	fe878793          	addi	a5,a5,-24
    80005f70:	00f73423          	sd	a5,8(a4)
}
    80005f74:	00813403          	ld	s0,8(sp)
    80005f78:	01010113          	addi	sp,sp,16
    80005f7c:	00008067          	ret

0000000080005f80 <_ZN15MemoryAllocator13sys_mem_allocEm>:

void *MemoryAllocator::sys_mem_alloc(size_t size) {
    80005f80:	ff010113          	addi	sp,sp,-16
    80005f84:	00813423          	sd	s0,8(sp)
    80005f88:	01010413          	addi	s0,sp,16
    80005f8c:	00050713          	mv	a4,a0
    MemoryAllocator::BlockHeader *optimalBlock = MemoryAllocator::freeMemHead, *prev = nullptr;
    80005f90:	00006517          	auipc	a0,0x6
    80005f94:	af053503          	ld	a0,-1296(a0) # 8000ba80 <_ZN15MemoryAllocator11freeMemHeadE>
    80005f98:	00000693          	li	a3,0

    //Find the optimal block(first fit algorithm)
    for(; optimalBlock != nullptr; prev = optimalBlock, optimalBlock = optimalBlock->next){
    80005f9c:	00050c63          	beqz	a0,80005fb4 <_ZN15MemoryAllocator13sys_mem_allocEm+0x34>
        if(optimalBlock->size > size) break;
    80005fa0:	00853783          	ld	a5,8(a0)
    80005fa4:	00f76863          	bltu	a4,a5,80005fb4 <_ZN15MemoryAllocator13sys_mem_allocEm+0x34>
    for(; optimalBlock != nullptr; prev = optimalBlock, optimalBlock = optimalBlock->next){
    80005fa8:	00050693          	mv	a3,a0
    80005fac:	00053503          	ld	a0,0(a0)
    80005fb0:	fedff06f          	j	80005f9c <_ZN15MemoryAllocator13sys_mem_allocEm+0x1c>
    }

    //Not enough space left to allocate
    if(!optimalBlock) return nullptr;
    80005fb4:	04050463          	beqz	a0,80005ffc <_ZN15MemoryAllocator13sys_mem_allocEm+0x7c>

    //Create the new next block for prev
    MemoryAllocator::BlockHeader *new_next;
    if(optimalBlock->size == size + MemoryAllocator::HEADER_SIZE){
    80005fb8:	00853783          	ld	a5,8(a0)
    80005fbc:	01870613          	addi	a2,a4,24
    80005fc0:	04c78463          	beq	a5,a2,80006008 <_ZN15MemoryAllocator13sys_mem_allocEm+0x88>
        new_next = optimalBlock->next;
    }
    else{
        uint64 new_size = optimalBlock->size - size - MemoryAllocator::HEADER_SIZE;
    80005fc4:	40e787b3          	sub	a5,a5,a4
    80005fc8:	fe878793          	addi	a5,a5,-24
        optimalBlock->size = size;
    80005fcc:	00e53423          	sd	a4,8(a0)

        new_next = reinterpret_cast<MemoryAllocator::BlockHeader*>(reinterpret_cast<uint64>(optimalBlock) + (uint64)size + MemoryAllocator::HEADER_SIZE);
    80005fd0:	00e50733          	add	a4,a0,a4
    80005fd4:	01870613          	addi	a2,a4,24
        new_next->next = optimalBlock->next;
    80005fd8:	00053583          	ld	a1,0(a0)
    80005fdc:	00b73c23          	sd	a1,24(a4)
        new_next->size = new_size;
    80005fe0:	00f63423          	sd	a5,8(a2)
        new_next->alloc_verify = false;
    80005fe4:	00060823          	sb	zero,16(a2)
    }


    if(prev) prev->next = new_next;
    80005fe8:	02068463          	beqz	a3,80006010 <_ZN15MemoryAllocator13sys_mem_allocEm+0x90>
    80005fec:	00c6b023          	sd	a2,0(a3)
    else MemoryAllocator::freeMemHead = new_next;
    optimalBlock->alloc_verify = true; // field for verifying proper allocation
    80005ff0:	00100793          	li	a5,1
    80005ff4:	00f50823          	sb	a5,16(a0)
    return (void*)(optimalBlock + 1); // optimalBlock + 1 moves the pointer with ptr arithmetic to after header
    80005ff8:	01850513          	addi	a0,a0,24

}
    80005ffc:	00813403          	ld	s0,8(sp)
    80006000:	01010113          	addi	sp,sp,16
    80006004:	00008067          	ret
        new_next = optimalBlock->next;
    80006008:	00053603          	ld	a2,0(a0)
    8000600c:	fddff06f          	j	80005fe8 <_ZN15MemoryAllocator13sys_mem_allocEm+0x68>
    else MemoryAllocator::freeMemHead = new_next;
    80006010:	00006797          	auipc	a5,0x6
    80006014:	a6c7b823          	sd	a2,-1424(a5) # 8000ba80 <_ZN15MemoryAllocator11freeMemHeadE>
    80006018:	fd9ff06f          	j	80005ff0 <_ZN15MemoryAllocator13sys_mem_allocEm+0x70>

000000008000601c <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_>:
    MemoryAllocator::merge(prev, to_free);

    return 0;
}

void MemoryAllocator::merge(MemoryAllocator::BlockHeader *blk1, MemoryAllocator::BlockHeader *blk2) {
    8000601c:	ff010113          	addi	sp,sp,-16
    80006020:	00813423          	sd	s0,8(sp)
    80006024:	01010413          	addi	s0,sp,16
    if(!blk1 || !blk2) return;
    80006028:	00050c63          	beqz	a0,80006040 <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_+0x24>
    8000602c:	00058a63          	beqz	a1,80006040 <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_+0x24>

    if(reinterpret_cast<uint64>(blk1) + MemoryAllocator::HEADER_SIZE + blk1->size == reinterpret_cast<uint64>(blk2)){
    80006030:	00853703          	ld	a4,8(a0)
    80006034:	00e507b3          	add	a5,a0,a4
    80006038:	01878793          	addi	a5,a5,24
    8000603c:	00b78863          	beq	a5,a1,8000604c <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_+0x30>
        blk1->size = blk1->size + blk2->size + MemoryAllocator::HEADER_SIZE;
        blk1->next = blk2->next;
    }
}
    80006040:	00813403          	ld	s0,8(sp)
    80006044:	01010113          	addi	sp,sp,16
    80006048:	00008067          	ret
        blk1->size = blk1->size + blk2->size + MemoryAllocator::HEADER_SIZE;
    8000604c:	0085b783          	ld	a5,8(a1)
    80006050:	00f70733          	add	a4,a4,a5
    80006054:	01870713          	addi	a4,a4,24
    80006058:	00e53423          	sd	a4,8(a0)
        blk1->next = blk2->next;
    8000605c:	0005b783          	ld	a5,0(a1)
    80006060:	00f53023          	sd	a5,0(a0)
    80006064:	fddff06f          	j	80006040 <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_+0x24>

0000000080006068 <_ZN15MemoryAllocator12sys_mem_freeEPKv>:
    if(ptr == nullptr) return -3;
    80006068:	0c050263          	beqz	a0,8000612c <_ZN15MemoryAllocator12sys_mem_freeEPKv+0xc4>
int MemoryAllocator::sys_mem_free(const void *ptr) {
    8000606c:	fe010113          	addi	sp,sp,-32
    80006070:	00113c23          	sd	ra,24(sp)
    80006074:	00813823          	sd	s0,16(sp)
    80006078:	00913423          	sd	s1,8(sp)
    8000607c:	01213023          	sd	s2,0(sp)
    80006080:	02010413          	addi	s0,sp,32
    MemoryAllocator::BlockHeader *to_free = (MemoryAllocator::BlockHeader*)(ptr) - 1;
    80006084:	fe850493          	addi	s1,a0,-24
    if(to_free < HEAP_START_ADDR || to_free > HEAP_END_ADDR) return -1; // out of memory address space detected code
    80006088:	00006797          	auipc	a5,0x6
    8000608c:	8c87b783          	ld	a5,-1848(a5) # 8000b950 <_GLOBAL_OFFSET_TABLE_+0x18>
    80006090:	0007b783          	ld	a5,0(a5)
    80006094:	0af4e063          	bltu	s1,a5,80006134 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0xcc>
    80006098:	00006797          	auipc	a5,0x6
    8000609c:	9007b783          	ld	a5,-1792(a5) # 8000b998 <_GLOBAL_OFFSET_TABLE_+0x60>
    800060a0:	0007b783          	ld	a5,0(a5)
    800060a4:	0897ec63          	bltu	a5,s1,8000613c <_ZN15MemoryAllocator12sys_mem_freeEPKv+0xd4>
    if(!to_free->alloc_verify) return -2; // non-proper allocation detected code
    800060a8:	ff854783          	lbu	a5,-8(a0)
    800060ac:	08078c63          	beqz	a5,80006144 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0xdc>
    to_free->alloc_verify = false; // reset allocation because it will be freed;
    800060b0:	fe050c23          	sb	zero,-8(a0)
    MemoryAllocator::BlockHeader *prev = nullptr, *after = MemoryAllocator::freeMemHead;
    800060b4:	00006797          	auipc	a5,0x6
    800060b8:	9cc7b783          	ld	a5,-1588(a5) # 8000ba80 <_ZN15MemoryAllocator11freeMemHeadE>
    800060bc:	00078593          	mv	a1,a5
    800060c0:	00000913          	li	s2,0
    for(; after != nullptr; prev = after, after = after->next){
    800060c4:	00058a63          	beqz	a1,800060d8 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x70>
        if(after >= to_free) break;
    800060c8:	0095f863          	bgeu	a1,s1,800060d8 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x70>
    for(; after != nullptr; prev = after, after = after->next){
    800060cc:	00058913          	mv	s2,a1
    800060d0:	0005b583          	ld	a1,0(a1)
    800060d4:	ff1ff06f          	j	800060c4 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x5c>
    if(!prev){
    800060d8:	04090263          	beqz	s2,8000611c <_ZN15MemoryAllocator12sys_mem_freeEPKv+0xb4>
        prev->next = to_free;
    800060dc:	00993023          	sd	s1,0(s2)
        to_free->next = after;
    800060e0:	feb53423          	sd	a1,-24(a0)
    MemoryAllocator::merge(to_free, after);
    800060e4:	00048513          	mv	a0,s1
    800060e8:	00000097          	auipc	ra,0x0
    800060ec:	f34080e7          	jalr	-204(ra) # 8000601c <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_>
    MemoryAllocator::merge(prev, to_free);
    800060f0:	00048593          	mv	a1,s1
    800060f4:	00090513          	mv	a0,s2
    800060f8:	00000097          	auipc	ra,0x0
    800060fc:	f24080e7          	jalr	-220(ra) # 8000601c <_ZN15MemoryAllocator5mergeEPNS_11BlockHeaderES1_>
    return 0;
    80006100:	00000513          	li	a0,0
}
    80006104:	01813083          	ld	ra,24(sp)
    80006108:	01013403          	ld	s0,16(sp)
    8000610c:	00813483          	ld	s1,8(sp)
    80006110:	00013903          	ld	s2,0(sp)
    80006114:	02010113          	addi	sp,sp,32
    80006118:	00008067          	ret
        MemoryAllocator::freeMemHead = to_free;
    8000611c:	00006717          	auipc	a4,0x6
    80006120:	96973223          	sd	s1,-1692(a4) # 8000ba80 <_ZN15MemoryAllocator11freeMemHeadE>
        freeMemHead->next = temp;
    80006124:	fef53423          	sd	a5,-24(a0)
    80006128:	fbdff06f          	j	800060e4 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x7c>
    if(ptr == nullptr) return -3;
    8000612c:	ffd00513          	li	a0,-3
}
    80006130:	00008067          	ret
    if(to_free < HEAP_START_ADDR || to_free > HEAP_END_ADDR) return -1; // out of memory address space detected code
    80006134:	fff00513          	li	a0,-1
    80006138:	fcdff06f          	j	80006104 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x9c>
    8000613c:	fff00513          	li	a0,-1
    80006140:	fc5ff06f          	j	80006104 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x9c>
    if(!to_free->alloc_verify) return -2; // non-proper allocation detected code
    80006144:	ffe00513          	li	a0,-2
    80006148:	fbdff06f          	j	80006104 <_ZN15MemoryAllocator12sys_mem_freeEPKv+0x9c>

000000008000614c <_ZN3ABI15handleEcallTrapEmmmmm>:
    }

    riscv::w_sepc(sepc);
    riscv::w_sstatus(sstatus);
}
void ABI::handleEcallTrap(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    8000614c:	fd010113          	addi	sp,sp,-48
    80006150:	02113423          	sd	ra,40(sp)
    80006154:	02813023          	sd	s0,32(sp)
    80006158:	00913c23          	sd	s1,24(sp)
    8000615c:	01213823          	sd	s2,16(sp)
    80006160:	03010413          	addi	s0,sp,48
    80006164:	00050793          	mv	a5,a0
    80006168:	00058513          	mv	a0,a1
    8000616c:	00060593          	mv	a1,a2
    80006170:	00068613          	mv	a2,a3
    80006174:	00070693          	mv	a3,a4
    if(call_code == ABI::SystemCallCode::YIELD) {
    80006178:	00f00713          	li	a4,15
    8000617c:	04e78263          	beq	a5,a4,800061c0 <_ZN3ABI15handleEcallTrapEmmmmm+0x74>
        TCB::timeSliceCounter = 0;
        TCB::dispatch(); // sepc ce se sacuvati na steku
        riscv::w_sstatus(sstatus);
        riscv::w_sepc(sepc); // vratimo sepc  pa se vratimo u trap pa sret vrati na dobro mesto prethodne niti
    }
    else if(call_code == ABI::SystemCallCode::GET_C){
    80006180:	00c00713          	li	a4,12
    80006184:	06e78a63          	beq	a5,a4,800061f8 <_ZN3ABI15handleEcallTrapEmmmmm+0xac>
        __getc();
    }
    else if(call_code == ABI::SystemCallCode::PUT_C){
    80006188:	00d00713          	li	a4,13
    8000618c:	06e78c63          	beq	a5,a4,80006204 <_ZN3ABI15handleEcallTrapEmmmmm+0xb8>
        __putc(arg1);
    }
    else{
        system_call_table[call_code](arg1, arg2, arg3, arg4);
    80006190:	00379793          	slli	a5,a5,0x3
    80006194:	00005717          	auipc	a4,0x5
    80006198:	73470713          	addi	a4,a4,1844 # 8000b8c8 <_ZN3ABI17system_call_tableE>
    8000619c:	00f707b3          	add	a5,a4,a5
    800061a0:	0007b783          	ld	a5,0(a5)
    800061a4:	000780e7          	jalr	a5
    }
}
    800061a8:	02813083          	ld	ra,40(sp)
    800061ac:	02013403          	ld	s0,32(sp)
    800061b0:	01813483          	ld	s1,24(sp)
    800061b4:	01013903          	ld	s2,16(sp)
    800061b8:	03010113          	addi	sp,sp,48
    800061bc:	00008067          	ret
    __asm__ volatile ("csrw scause, %[scause]" : : [scause] "r"(scause));
}

inline uint64 riscv::r_sepc() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800061c0:	141027f3          	csrr	a5,sepc
    800061c4:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    800061c8:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 riscv::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800061cc:	100027f3          	csrr	a5,sstatus
    800061d0:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    800061d4:	fd043903          	ld	s2,-48(s0)
        TCB::timeSliceCounter = 0;
    800061d8:	00005797          	auipc	a5,0x5
    800061dc:	7807b783          	ld	a5,1920(a5) # 8000b958 <_GLOBAL_OFFSET_TABLE_+0x20>
    800061e0:	0007b023          	sd	zero,0(a5)
        TCB::dispatch(); // sepc ce se sacuvati na steku
    800061e4:	00000097          	auipc	ra,0x0
    800061e8:	a2c080e7          	jalr	-1492(ra) # 80005c10 <_ZN3TCB8dispatchEv>
}

inline void riscv::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800061ec:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800061f0:	14149073          	csrw	sepc,s1
}
    800061f4:	fb5ff06f          	j	800061a8 <_ZN3ABI15handleEcallTrapEmmmmm+0x5c>
        __getc();
    800061f8:	00002097          	auipc	ra,0x2
    800061fc:	3b0080e7          	jalr	944(ra) # 800085a8 <__getc>
    80006200:	fa9ff06f          	j	800061a8 <_ZN3ABI15handleEcallTrapEmmmmm+0x5c>
        __putc(arg1);
    80006204:	0ff57513          	andi	a0,a0,255
    80006208:	00002097          	auipc	ra,0x2
    8000620c:	364080e7          	jalr	868(ra) # 8000856c <__putc>
    80006210:	f99ff06f          	j	800061a8 <_ZN3ABI15handleEcallTrapEmmmmm+0x5c>

0000000080006214 <_ZN3ABI15handleTimerTrapEv>:

void ABI::handleTimerTrap() {
    80006214:	fd010113          	addi	sp,sp,-48
    80006218:	02113423          	sd	ra,40(sp)
    8000621c:	02813023          	sd	s0,32(sp)
    80006220:	00913c23          	sd	s1,24(sp)
    80006224:	01213823          	sd	s2,16(sp)
    80006228:	03010413          	addi	s0,sp,48
//    while ((*((char *) CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT) && !IOSys::oBuffer->is_empty()) {
//        char c = IOSys::oBuffer->dequeue();
//        *(volatile char *) CONSOLE_TX_DATA = c;
//    }

    TCB::timeSliceCounter++;
    8000622c:	00005497          	auipc	s1,0x5
    80006230:	72c4b483          	ld	s1,1836(s1) # 8000b958 <_GLOBAL_OFFSET_TABLE_+0x20>
    80006234:	0004b783          	ld	a5,0(s1)
    80006238:	00178793          	addi	a5,a5,1
    8000623c:	00f4b023          	sd	a5,0(s1)
    TCB::sleepCountdown();
    80006240:	00000097          	auipc	ra,0x0
    80006244:	af0080e7          	jalr	-1296(ra) # 80005d30 <_ZN3TCB14sleepCountdownEv>
    if(TCB::timeSliceCounter >= TCB::running->getTimeSlice()){
    80006248:	00005797          	auipc	a5,0x5
    8000624c:	7487b783          	ld	a5,1864(a5) # 8000b990 <_GLOBAL_OFFSET_TABLE_+0x58>
    80006250:	0007b783          	ld	a5,0(a5)
    bool isAsleep() const { return is_asleep; }
    uint64 getTimeSlice() { return timeSlice; }
    80006254:	0407b783          	ld	a5,64(a5)
    80006258:	0004b703          	ld	a4,0(s1)
    8000625c:	00f77e63          	bgeu	a4,a5,80006278 <_ZN3ABI15handleTimerTrapEv+0x64>
        TCB::timeSliceCounter = 0;
        TCB::dispatch(); // sepc ce se sacuvati na steku
        riscv::w_sstatus(sstatus);
        riscv::w_sepc(sepc); // vratimo sepc  pa se vratimo u trap pa sret vrati na dobro mesto prethodne niti
    }
}
    80006260:	02813083          	ld	ra,40(sp)
    80006264:	02013403          	ld	s0,32(sp)
    80006268:	01813483          	ld	s1,24(sp)
    8000626c:	01013903          	ld	s2,16(sp)
    80006270:	03010113          	addi	sp,sp,48
    80006274:	00008067          	ret
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80006278:	141027f3          	csrr	a5,sepc
    8000627c:	fcf43c23          	sd	a5,-40(s0)
    return sepc;
    80006280:	fd843483          	ld	s1,-40(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80006284:	100027f3          	csrr	a5,sstatus
    80006288:	fcf43823          	sd	a5,-48(s0)
    return sstatus;
    8000628c:	fd043903          	ld	s2,-48(s0)
        TCB::timeSliceCounter = 0;
    80006290:	00005797          	auipc	a5,0x5
    80006294:	6c87b783          	ld	a5,1736(a5) # 8000b958 <_GLOBAL_OFFSET_TABLE_+0x20>
    80006298:	0007b023          	sd	zero,0(a5)
        TCB::dispatch(); // sepc ce se sacuvati na steku
    8000629c:	00000097          	auipc	ra,0x0
    800062a0:	974080e7          	jalr	-1676(ra) # 80005c10 <_ZN3TCB8dispatchEv>
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800062a4:	10091073          	csrw	sstatus,s2
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800062a8:	14149073          	csrw	sepc,s1
}
    800062ac:	fb5ff06f          	j	80006260 <_ZN3ABI15handleTimerTrapEv+0x4c>

00000000800062b0 <_ZN3ABI20handleSupervisorTrapEmmmmm>:
void ABI::handleSupervisorTrap(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    800062b0:	fb010113          	addi	sp,sp,-80
    800062b4:	04113423          	sd	ra,72(sp)
    800062b8:	04813023          	sd	s0,64(sp)
    800062bc:	02913c23          	sd	s1,56(sp)
    800062c0:	03213823          	sd	s2,48(sp)
    800062c4:	05010413          	addi	s0,sp,80
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800062c8:	100027f3          	csrr	a5,sstatus
    800062cc:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    800062d0:	fc843903          	ld	s2,-56(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800062d4:	141027f3          	csrr	a5,sepc
    800062d8:	fcf43023          	sd	a5,-64(s0)
    return sepc;
    800062dc:	fc043483          	ld	s1,-64(s0)
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800062e0:	142027f3          	csrr	a5,scause
    800062e4:	faf43c23          	sd	a5,-72(s0)
    return scause;
    800062e8:	fb843803          	ld	a6,-72(s0)
    if (scause == ECALL_FROM_U_MODE || scause == ECALL_FROM_S_MODE) {
    800062ec:	ff880893          	addi	a7,a6,-8
    800062f0:	00100793          	li	a5,1
    800062f4:	0517f663          	bgeu	a5,a7,80006340 <_ZN3ABI20handleSupervisorTrapEmmmmm+0x90>
    } else if (scause == SOFTWARE_INTERRUPT) {
    800062f8:	fff00793          	li	a5,-1
    800062fc:	03f79793          	slli	a5,a5,0x3f
    80006300:	00178793          	addi	a5,a5,1
    80006304:	06f80663          	beq	a6,a5,80006370 <_ZN3ABI20handleSupervisorTrapEmmmmm+0xc0>
    } else if (scause == EXTERNAL_INTERRUPT) {
    80006308:	fff00793          	li	a5,-1
    8000630c:	03f79793          	slli	a5,a5,0x3f
    80006310:	00978793          	addi	a5,a5,9
    80006314:	06f80863          	beq	a6,a5,80006384 <_ZN3ABI20handleSupervisorTrapEmmmmm+0xd4>
    else if(scause == ILLEGAL_INSTRUCTION){
    80006318:	00200793          	li	a5,2
    8000631c:	06f80a63          	beq	a6,a5,80006390 <_ZN3ABI20handleSupervisorTrapEmmmmm+0xe0>
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80006320:	14149073          	csrw	sepc,s1
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80006324:	10091073          	csrw	sstatus,s2
}
    80006328:	04813083          	ld	ra,72(sp)
    8000632c:	04013403          	ld	s0,64(sp)
    80006330:	03813483          	ld	s1,56(sp)
    80006334:	03013903          	ld	s2,48(sp)
    80006338:	05010113          	addi	sp,sp,80
    8000633c:	00008067          	ret
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80006340:	100027f3          	csrr	a5,sstatus
    80006344:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80006348:	fd843903          	ld	s2,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000634c:	141027f3          	csrr	a5,sepc
    80006350:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80006354:	fd043483          	ld	s1,-48(s0)
        sepc = riscv::r_sepc() + 4;
    80006358:	00448493          	addi	s1,s1,4
        handleEcallTrap(call_code, arg1, arg2, arg3, arg4);
    8000635c:	00000097          	auipc	ra,0x0
    80006360:	df0080e7          	jalr	-528(ra) # 8000614c <_ZN3ABI15handleEcallTrapEmmmmm>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80006364:	00200793          	li	a5,2
    80006368:	1447b073          	csrc	sip,a5
}
    8000636c:	fb5ff06f          	j	80006320 <_ZN3ABI20handleSupervisorTrapEmmmmm+0x70>
        handleTimerTrap();
    80006370:	00000097          	auipc	ra,0x0
    80006374:	ea4080e7          	jalr	-348(ra) # 80006214 <_ZN3ABI15handleTimerTrapEv>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80006378:	00200793          	li	a5,2
    8000637c:	1447b073          	csrc	sip,a5
}
    80006380:	fa1ff06f          	j	80006320 <_ZN3ABI20handleSupervisorTrapEmmmmm+0x70>
        console_handler();
    80006384:	00002097          	auipc	ra,0x2
    80006388:	25c080e7          	jalr	604(ra) # 800085e0 <console_handler>
    8000638c:	f95ff06f          	j	80006320 <_ZN3ABI20handleSupervisorTrapEmmmmm+0x70>
        __putc('\n');
    80006390:	00a00513          	li	a0,10
    80006394:	00002097          	auipc	ra,0x2
    80006398:	1d8080e7          	jalr	472(ra) # 8000856c <__putc>
        __putc('i');
    8000639c:	06900513          	li	a0,105
    800063a0:	00002097          	auipc	ra,0x2
    800063a4:	1cc080e7          	jalr	460(ra) # 8000856c <__putc>
        __putc('l');
    800063a8:	06c00513          	li	a0,108
    800063ac:	00002097          	auipc	ra,0x2
    800063b0:	1c0080e7          	jalr	448(ra) # 8000856c <__putc>
        __putc('l');
    800063b4:	06c00513          	li	a0,108
    800063b8:	00002097          	auipc	ra,0x2
    800063bc:	1b4080e7          	jalr	436(ra) # 8000856c <__putc>
        __putc('\n');
    800063c0:	00a00513          	li	a0,10
    800063c4:	00002097          	auipc	ra,0x2
    800063c8:	1a8080e7          	jalr	424(ra) # 8000856c <__putc>
    800063cc:	f55ff06f          	j	80006320 <_ZN3ABI20handleSupervisorTrapEmmmmm+0x70>

00000000800063d0 <_ZN3ABI17handleConsoleTrapEv>:

void ABI::handleConsoleTrap() {
    800063d0:	fe010113          	addi	sp,sp,-32
    800063d4:	00113c23          	sd	ra,24(sp)
    800063d8:	00813823          	sd	s0,16(sp)
    800063dc:	02010413          	addi	s0,sp,32
    if (plic_claim() == CONSOLE_IRQ) {
    800063e0:	00001097          	auipc	ra,0x1
    800063e4:	924080e7          	jalr	-1756(ra) # 80006d04 <plic_claim>
    800063e8:	00a00793          	li	a5,10
    800063ec:	00f50a63          	beq	a0,a5,80006400 <_ZN3ABI17handleConsoleTrapEv+0x30>
            volatile char c = *(char *) CONSOLE_RX_DATA;
            IOSys::iBuffer->enqueue(c);
        }
        plic_complete(CONSOLE_IRQ);
    }
}
    800063f0:	01813083          	ld	ra,24(sp)
    800063f4:	01013403          	ld	s0,16(sp)
    800063f8:	02010113          	addi	sp,sp,32
    800063fc:	00008067          	ret
        if ((*((char *) CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT)) {
    80006400:	00005797          	auipc	a5,0x5
    80006404:	5487b783          	ld	a5,1352(a5) # 8000b948 <_GLOBAL_OFFSET_TABLE_+0x10>
    80006408:	0007b783          	ld	a5,0(a5)
    8000640c:	0007c783          	lbu	a5,0(a5)
    80006410:	0017f793          	andi	a5,a5,1
    80006414:	00079a63          	bnez	a5,80006428 <_ZN3ABI17handleConsoleTrapEv+0x58>
        plic_complete(CONSOLE_IRQ);
    80006418:	00a00513          	li	a0,10
    8000641c:	00001097          	auipc	ra,0x1
    80006420:	920080e7          	jalr	-1760(ra) # 80006d3c <plic_complete>
}
    80006424:	fcdff06f          	j	800063f0 <_ZN3ABI17handleConsoleTrapEv+0x20>
            volatile char c = *(char *) CONSOLE_RX_DATA;
    80006428:	00005797          	auipc	a5,0x5
    8000642c:	5187b783          	ld	a5,1304(a5) # 8000b940 <_GLOBAL_OFFSET_TABLE_+0x8>
    80006430:	0007b783          	ld	a5,0(a5)
    80006434:	0007c783          	lbu	a5,0(a5)
    80006438:	fef407a3          	sb	a5,-17(s0)
            IOSys::iBuffer->enqueue(c);
    8000643c:	fef44583          	lbu	a1,-17(s0)
    80006440:	0ff5f593          	andi	a1,a1,255
    80006444:	00005797          	auipc	a5,0x5
    80006448:	5347b783          	ld	a5,1332(a5) # 8000b978 <_GLOBAL_OFFSET_TABLE_+0x40>
    8000644c:	0007b503          	ld	a0,0(a5)
    80006450:	ffffb097          	auipc	ra,0xffffb
    80006454:	394080e7          	jalr	916(ra) # 800017e4 <_ZN8IOBuffer7enqueueEc>
    80006458:	fc1ff06f          	j	80006418 <_ZN3ABI17handleConsoleTrapEv+0x48>

000000008000645c <_ZN3ABI9sys_ecallEmmmmm>:

uint64 ABI::sys_ecall(uint64 call_code, uint64 arg1, uint64 arg2, uint64 arg3, uint64 arg4) {
    8000645c:	ff010113          	addi	sp,sp,-16
    80006460:	00813423          	sd	s0,8(sp)
    80006464:	01010413          	addi	s0,sp,16
    80006468:	00050793          	mv	a5,a0
    8000646c:	00058813          	mv	a6,a1
    80006470:	00060893          	mv	a7,a2
    80006474:	00068313          	mv	t1,a3
    80006478:	00070e13          	mv	t3,a4
    [arg1] "r" (arg1),
    [arg2] "r" (arg2),
    [arg3] "r" (arg3),
    [arg4] "r" (arg4)
    : "a0", "a1", "a2", "a3", "a4"
    );
    8000647c:	00078513          	mv	a0,a5
    80006480:	00080593          	mv	a1,a6
    80006484:	00088613          	mv	a2,a7
    80006488:	00030693          	mv	a3,t1
    8000648c:	000e0713          	mv	a4,t3
    80006490:	00000073          	ecall
    80006494:	00050793          	mv	a5,a0

    return to_ret;
}
    80006498:	00078513          	mv	a0,a5
    8000649c:	00813403          	ld	s0,8(sp)
    800064a0:	01010113          	addi	sp,sp,16
    800064a4:	00008067          	ret

00000000800064a8 <start>:
    800064a8:	ff010113          	addi	sp,sp,-16
    800064ac:	00813423          	sd	s0,8(sp)
    800064b0:	01010413          	addi	s0,sp,16
    800064b4:	300027f3          	csrr	a5,mstatus
    800064b8:	ffffe737          	lui	a4,0xffffe
    800064bc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1b0f>
    800064c0:	00e7f7b3          	and	a5,a5,a4
    800064c4:	00001737          	lui	a4,0x1
    800064c8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    800064cc:	00e7e7b3          	or	a5,a5,a4
    800064d0:	30079073          	csrw	mstatus,a5
    800064d4:	00000797          	auipc	a5,0x0
    800064d8:	16078793          	addi	a5,a5,352 # 80006634 <system_main>
    800064dc:	34179073          	csrw	mepc,a5
    800064e0:	00000793          	li	a5,0
    800064e4:	18079073          	csrw	satp,a5
    800064e8:	000107b7          	lui	a5,0x10
    800064ec:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800064f0:	30279073          	csrw	medeleg,a5
    800064f4:	30379073          	csrw	mideleg,a5
    800064f8:	104027f3          	csrr	a5,sie
    800064fc:	2227e793          	ori	a5,a5,546
    80006500:	10479073          	csrw	sie,a5
    80006504:	fff00793          	li	a5,-1
    80006508:	00a7d793          	srli	a5,a5,0xa
    8000650c:	3b079073          	csrw	pmpaddr0,a5
    80006510:	00f00793          	li	a5,15
    80006514:	3a079073          	csrw	pmpcfg0,a5
    80006518:	f14027f3          	csrr	a5,mhartid
    8000651c:	0200c737          	lui	a4,0x200c
    80006520:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006524:	0007869b          	sext.w	a3,a5
    80006528:	00269713          	slli	a4,a3,0x2
    8000652c:	000f4637          	lui	a2,0xf4
    80006530:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006534:	00d70733          	add	a4,a4,a3
    80006538:	0037979b          	slliw	a5,a5,0x3
    8000653c:	020046b7          	lui	a3,0x2004
    80006540:	00d787b3          	add	a5,a5,a3
    80006544:	00c585b3          	add	a1,a1,a2
    80006548:	00371693          	slli	a3,a4,0x3
    8000654c:	00005717          	auipc	a4,0x5
    80006550:	54470713          	addi	a4,a4,1348 # 8000ba90 <timer_scratch>
    80006554:	00b7b023          	sd	a1,0(a5)
    80006558:	00d70733          	add	a4,a4,a3
    8000655c:	00f73c23          	sd	a5,24(a4)
    80006560:	02c73023          	sd	a2,32(a4)
    80006564:	34071073          	csrw	mscratch,a4
    80006568:	00000797          	auipc	a5,0x0
    8000656c:	6e878793          	addi	a5,a5,1768 # 80006c50 <timervec>
    80006570:	30579073          	csrw	mtvec,a5
    80006574:	300027f3          	csrr	a5,mstatus
    80006578:	0087e793          	ori	a5,a5,8
    8000657c:	30079073          	csrw	mstatus,a5
    80006580:	304027f3          	csrr	a5,mie
    80006584:	0807e793          	ori	a5,a5,128
    80006588:	30479073          	csrw	mie,a5
    8000658c:	f14027f3          	csrr	a5,mhartid
    80006590:	0007879b          	sext.w	a5,a5
    80006594:	00078213          	mv	tp,a5
    80006598:	30200073          	mret
    8000659c:	00813403          	ld	s0,8(sp)
    800065a0:	01010113          	addi	sp,sp,16
    800065a4:	00008067          	ret

00000000800065a8 <timerinit>:
    800065a8:	ff010113          	addi	sp,sp,-16
    800065ac:	00813423          	sd	s0,8(sp)
    800065b0:	01010413          	addi	s0,sp,16
    800065b4:	f14027f3          	csrr	a5,mhartid
    800065b8:	0200c737          	lui	a4,0x200c
    800065bc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800065c0:	0007869b          	sext.w	a3,a5
    800065c4:	00269713          	slli	a4,a3,0x2
    800065c8:	000f4637          	lui	a2,0xf4
    800065cc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800065d0:	00d70733          	add	a4,a4,a3
    800065d4:	0037979b          	slliw	a5,a5,0x3
    800065d8:	020046b7          	lui	a3,0x2004
    800065dc:	00d787b3          	add	a5,a5,a3
    800065e0:	00c585b3          	add	a1,a1,a2
    800065e4:	00371693          	slli	a3,a4,0x3
    800065e8:	00005717          	auipc	a4,0x5
    800065ec:	4a870713          	addi	a4,a4,1192 # 8000ba90 <timer_scratch>
    800065f0:	00b7b023          	sd	a1,0(a5)
    800065f4:	00d70733          	add	a4,a4,a3
    800065f8:	00f73c23          	sd	a5,24(a4)
    800065fc:	02c73023          	sd	a2,32(a4)
    80006600:	34071073          	csrw	mscratch,a4
    80006604:	00000797          	auipc	a5,0x0
    80006608:	64c78793          	addi	a5,a5,1612 # 80006c50 <timervec>
    8000660c:	30579073          	csrw	mtvec,a5
    80006610:	300027f3          	csrr	a5,mstatus
    80006614:	0087e793          	ori	a5,a5,8
    80006618:	30079073          	csrw	mstatus,a5
    8000661c:	304027f3          	csrr	a5,mie
    80006620:	0807e793          	ori	a5,a5,128
    80006624:	30479073          	csrw	mie,a5
    80006628:	00813403          	ld	s0,8(sp)
    8000662c:	01010113          	addi	sp,sp,16
    80006630:	00008067          	ret

0000000080006634 <system_main>:
    80006634:	fe010113          	addi	sp,sp,-32
    80006638:	00813823          	sd	s0,16(sp)
    8000663c:	00913423          	sd	s1,8(sp)
    80006640:	00113c23          	sd	ra,24(sp)
    80006644:	02010413          	addi	s0,sp,32
    80006648:	00000097          	auipc	ra,0x0
    8000664c:	0c4080e7          	jalr	196(ra) # 8000670c <cpuid>
    80006650:	00005497          	auipc	s1,0x5
    80006654:	36048493          	addi	s1,s1,864 # 8000b9b0 <started>
    80006658:	02050263          	beqz	a0,8000667c <system_main+0x48>
    8000665c:	0004a783          	lw	a5,0(s1)
    80006660:	0007879b          	sext.w	a5,a5
    80006664:	fe078ce3          	beqz	a5,8000665c <system_main+0x28>
    80006668:	0ff0000f          	fence
    8000666c:	00003517          	auipc	a0,0x3
    80006670:	e6450513          	addi	a0,a0,-412 # 800094d0 <CONSOLE_STATUS+0x4c0>
    80006674:	00001097          	auipc	ra,0x1
    80006678:	a78080e7          	jalr	-1416(ra) # 800070ec <panic>
    8000667c:	00001097          	auipc	ra,0x1
    80006680:	9cc080e7          	jalr	-1588(ra) # 80007048 <consoleinit>
    80006684:	00001097          	auipc	ra,0x1
    80006688:	158080e7          	jalr	344(ra) # 800077dc <printfinit>
    8000668c:	00003517          	auipc	a0,0x3
    80006690:	ad450513          	addi	a0,a0,-1324 # 80009160 <CONSOLE_STATUS+0x150>
    80006694:	00001097          	auipc	ra,0x1
    80006698:	ab4080e7          	jalr	-1356(ra) # 80007148 <__printf>
    8000669c:	00003517          	auipc	a0,0x3
    800066a0:	e0450513          	addi	a0,a0,-508 # 800094a0 <CONSOLE_STATUS+0x490>
    800066a4:	00001097          	auipc	ra,0x1
    800066a8:	aa4080e7          	jalr	-1372(ra) # 80007148 <__printf>
    800066ac:	00003517          	auipc	a0,0x3
    800066b0:	ab450513          	addi	a0,a0,-1356 # 80009160 <CONSOLE_STATUS+0x150>
    800066b4:	00001097          	auipc	ra,0x1
    800066b8:	a94080e7          	jalr	-1388(ra) # 80007148 <__printf>
    800066bc:	00001097          	auipc	ra,0x1
    800066c0:	4ac080e7          	jalr	1196(ra) # 80007b68 <kinit>
    800066c4:	00000097          	auipc	ra,0x0
    800066c8:	148080e7          	jalr	328(ra) # 8000680c <trapinit>
    800066cc:	00000097          	auipc	ra,0x0
    800066d0:	16c080e7          	jalr	364(ra) # 80006838 <trapinithart>
    800066d4:	00000097          	auipc	ra,0x0
    800066d8:	5bc080e7          	jalr	1468(ra) # 80006c90 <plicinit>
    800066dc:	00000097          	auipc	ra,0x0
    800066e0:	5dc080e7          	jalr	1500(ra) # 80006cb8 <plicinithart>
    800066e4:	00000097          	auipc	ra,0x0
    800066e8:	078080e7          	jalr	120(ra) # 8000675c <userinit>
    800066ec:	0ff0000f          	fence
    800066f0:	00100793          	li	a5,1
    800066f4:	00003517          	auipc	a0,0x3
    800066f8:	dc450513          	addi	a0,a0,-572 # 800094b8 <CONSOLE_STATUS+0x4a8>
    800066fc:	00f4a023          	sw	a5,0(s1)
    80006700:	00001097          	auipc	ra,0x1
    80006704:	a48080e7          	jalr	-1464(ra) # 80007148 <__printf>
    80006708:	0000006f          	j	80006708 <system_main+0xd4>

000000008000670c <cpuid>:
    8000670c:	ff010113          	addi	sp,sp,-16
    80006710:	00813423          	sd	s0,8(sp)
    80006714:	01010413          	addi	s0,sp,16
    80006718:	00020513          	mv	a0,tp
    8000671c:	00813403          	ld	s0,8(sp)
    80006720:	0005051b          	sext.w	a0,a0
    80006724:	01010113          	addi	sp,sp,16
    80006728:	00008067          	ret

000000008000672c <mycpu>:
    8000672c:	ff010113          	addi	sp,sp,-16
    80006730:	00813423          	sd	s0,8(sp)
    80006734:	01010413          	addi	s0,sp,16
    80006738:	00020793          	mv	a5,tp
    8000673c:	00813403          	ld	s0,8(sp)
    80006740:	0007879b          	sext.w	a5,a5
    80006744:	00779793          	slli	a5,a5,0x7
    80006748:	00006517          	auipc	a0,0x6
    8000674c:	37850513          	addi	a0,a0,888 # 8000cac0 <cpus>
    80006750:	00f50533          	add	a0,a0,a5
    80006754:	01010113          	addi	sp,sp,16
    80006758:	00008067          	ret

000000008000675c <userinit>:
    8000675c:	ff010113          	addi	sp,sp,-16
    80006760:	00813423          	sd	s0,8(sp)
    80006764:	01010413          	addi	s0,sp,16
    80006768:	00813403          	ld	s0,8(sp)
    8000676c:	01010113          	addi	sp,sp,16
    80006770:	fffff317          	auipc	t1,0xfffff
    80006774:	c4c30067          	jr	-948(t1) # 800053bc <main>

0000000080006778 <either_copyout>:
    80006778:	ff010113          	addi	sp,sp,-16
    8000677c:	00813023          	sd	s0,0(sp)
    80006780:	00113423          	sd	ra,8(sp)
    80006784:	01010413          	addi	s0,sp,16
    80006788:	02051663          	bnez	a0,800067b4 <either_copyout+0x3c>
    8000678c:	00058513          	mv	a0,a1
    80006790:	00060593          	mv	a1,a2
    80006794:	0006861b          	sext.w	a2,a3
    80006798:	00002097          	auipc	ra,0x2
    8000679c:	c5c080e7          	jalr	-932(ra) # 800083f4 <__memmove>
    800067a0:	00813083          	ld	ra,8(sp)
    800067a4:	00013403          	ld	s0,0(sp)
    800067a8:	00000513          	li	a0,0
    800067ac:	01010113          	addi	sp,sp,16
    800067b0:	00008067          	ret
    800067b4:	00003517          	auipc	a0,0x3
    800067b8:	d4450513          	addi	a0,a0,-700 # 800094f8 <CONSOLE_STATUS+0x4e8>
    800067bc:	00001097          	auipc	ra,0x1
    800067c0:	930080e7          	jalr	-1744(ra) # 800070ec <panic>

00000000800067c4 <either_copyin>:
    800067c4:	ff010113          	addi	sp,sp,-16
    800067c8:	00813023          	sd	s0,0(sp)
    800067cc:	00113423          	sd	ra,8(sp)
    800067d0:	01010413          	addi	s0,sp,16
    800067d4:	02059463          	bnez	a1,800067fc <either_copyin+0x38>
    800067d8:	00060593          	mv	a1,a2
    800067dc:	0006861b          	sext.w	a2,a3
    800067e0:	00002097          	auipc	ra,0x2
    800067e4:	c14080e7          	jalr	-1004(ra) # 800083f4 <__memmove>
    800067e8:	00813083          	ld	ra,8(sp)
    800067ec:	00013403          	ld	s0,0(sp)
    800067f0:	00000513          	li	a0,0
    800067f4:	01010113          	addi	sp,sp,16
    800067f8:	00008067          	ret
    800067fc:	00003517          	auipc	a0,0x3
    80006800:	d2450513          	addi	a0,a0,-732 # 80009520 <CONSOLE_STATUS+0x510>
    80006804:	00001097          	auipc	ra,0x1
    80006808:	8e8080e7          	jalr	-1816(ra) # 800070ec <panic>

000000008000680c <trapinit>:
    8000680c:	ff010113          	addi	sp,sp,-16
    80006810:	00813423          	sd	s0,8(sp)
    80006814:	01010413          	addi	s0,sp,16
    80006818:	00813403          	ld	s0,8(sp)
    8000681c:	00003597          	auipc	a1,0x3
    80006820:	d2c58593          	addi	a1,a1,-724 # 80009548 <CONSOLE_STATUS+0x538>
    80006824:	00006517          	auipc	a0,0x6
    80006828:	31c50513          	addi	a0,a0,796 # 8000cb40 <tickslock>
    8000682c:	01010113          	addi	sp,sp,16
    80006830:	00001317          	auipc	t1,0x1
    80006834:	5c830067          	jr	1480(t1) # 80007df8 <initlock>

0000000080006838 <trapinithart>:
    80006838:	ff010113          	addi	sp,sp,-16
    8000683c:	00813423          	sd	s0,8(sp)
    80006840:	01010413          	addi	s0,sp,16
    80006844:	00000797          	auipc	a5,0x0
    80006848:	2fc78793          	addi	a5,a5,764 # 80006b40 <kernelvec>
    8000684c:	10579073          	csrw	stvec,a5
    80006850:	00813403          	ld	s0,8(sp)
    80006854:	01010113          	addi	sp,sp,16
    80006858:	00008067          	ret

000000008000685c <usertrap>:
    8000685c:	ff010113          	addi	sp,sp,-16
    80006860:	00813423          	sd	s0,8(sp)
    80006864:	01010413          	addi	s0,sp,16
    80006868:	00813403          	ld	s0,8(sp)
    8000686c:	01010113          	addi	sp,sp,16
    80006870:	00008067          	ret

0000000080006874 <usertrapret>:
    80006874:	ff010113          	addi	sp,sp,-16
    80006878:	00813423          	sd	s0,8(sp)
    8000687c:	01010413          	addi	s0,sp,16
    80006880:	00813403          	ld	s0,8(sp)
    80006884:	01010113          	addi	sp,sp,16
    80006888:	00008067          	ret

000000008000688c <kerneltrap>:
    8000688c:	fe010113          	addi	sp,sp,-32
    80006890:	00813823          	sd	s0,16(sp)
    80006894:	00113c23          	sd	ra,24(sp)
    80006898:	00913423          	sd	s1,8(sp)
    8000689c:	02010413          	addi	s0,sp,32
    800068a0:	142025f3          	csrr	a1,scause
    800068a4:	100027f3          	csrr	a5,sstatus
    800068a8:	0027f793          	andi	a5,a5,2
    800068ac:	10079c63          	bnez	a5,800069c4 <kerneltrap+0x138>
    800068b0:	142027f3          	csrr	a5,scause
    800068b4:	0207ce63          	bltz	a5,800068f0 <kerneltrap+0x64>
    800068b8:	00003517          	auipc	a0,0x3
    800068bc:	cd850513          	addi	a0,a0,-808 # 80009590 <CONSOLE_STATUS+0x580>
    800068c0:	00001097          	auipc	ra,0x1
    800068c4:	888080e7          	jalr	-1912(ra) # 80007148 <__printf>
    800068c8:	141025f3          	csrr	a1,sepc
    800068cc:	14302673          	csrr	a2,stval
    800068d0:	00003517          	auipc	a0,0x3
    800068d4:	cd050513          	addi	a0,a0,-816 # 800095a0 <CONSOLE_STATUS+0x590>
    800068d8:	00001097          	auipc	ra,0x1
    800068dc:	870080e7          	jalr	-1936(ra) # 80007148 <__printf>
    800068e0:	00003517          	auipc	a0,0x3
    800068e4:	cd850513          	addi	a0,a0,-808 # 800095b8 <CONSOLE_STATUS+0x5a8>
    800068e8:	00001097          	auipc	ra,0x1
    800068ec:	804080e7          	jalr	-2044(ra) # 800070ec <panic>
    800068f0:	0ff7f713          	andi	a4,a5,255
    800068f4:	00900693          	li	a3,9
    800068f8:	04d70063          	beq	a4,a3,80006938 <kerneltrap+0xac>
    800068fc:	fff00713          	li	a4,-1
    80006900:	03f71713          	slli	a4,a4,0x3f
    80006904:	00170713          	addi	a4,a4,1
    80006908:	fae798e3          	bne	a5,a4,800068b8 <kerneltrap+0x2c>
    8000690c:	00000097          	auipc	ra,0x0
    80006910:	e00080e7          	jalr	-512(ra) # 8000670c <cpuid>
    80006914:	06050663          	beqz	a0,80006980 <kerneltrap+0xf4>
    80006918:	144027f3          	csrr	a5,sip
    8000691c:	ffd7f793          	andi	a5,a5,-3
    80006920:	14479073          	csrw	sip,a5
    80006924:	01813083          	ld	ra,24(sp)
    80006928:	01013403          	ld	s0,16(sp)
    8000692c:	00813483          	ld	s1,8(sp)
    80006930:	02010113          	addi	sp,sp,32
    80006934:	00008067          	ret
    80006938:	00000097          	auipc	ra,0x0
    8000693c:	3cc080e7          	jalr	972(ra) # 80006d04 <plic_claim>
    80006940:	00a00793          	li	a5,10
    80006944:	00050493          	mv	s1,a0
    80006948:	06f50863          	beq	a0,a5,800069b8 <kerneltrap+0x12c>
    8000694c:	fc050ce3          	beqz	a0,80006924 <kerneltrap+0x98>
    80006950:	00050593          	mv	a1,a0
    80006954:	00003517          	auipc	a0,0x3
    80006958:	c1c50513          	addi	a0,a0,-996 # 80009570 <CONSOLE_STATUS+0x560>
    8000695c:	00000097          	auipc	ra,0x0
    80006960:	7ec080e7          	jalr	2028(ra) # 80007148 <__printf>
    80006964:	01013403          	ld	s0,16(sp)
    80006968:	01813083          	ld	ra,24(sp)
    8000696c:	00048513          	mv	a0,s1
    80006970:	00813483          	ld	s1,8(sp)
    80006974:	02010113          	addi	sp,sp,32
    80006978:	00000317          	auipc	t1,0x0
    8000697c:	3c430067          	jr	964(t1) # 80006d3c <plic_complete>
    80006980:	00006517          	auipc	a0,0x6
    80006984:	1c050513          	addi	a0,a0,448 # 8000cb40 <tickslock>
    80006988:	00001097          	auipc	ra,0x1
    8000698c:	494080e7          	jalr	1172(ra) # 80007e1c <acquire>
    80006990:	00005717          	auipc	a4,0x5
    80006994:	02470713          	addi	a4,a4,36 # 8000b9b4 <ticks>
    80006998:	00072783          	lw	a5,0(a4)
    8000699c:	00006517          	auipc	a0,0x6
    800069a0:	1a450513          	addi	a0,a0,420 # 8000cb40 <tickslock>
    800069a4:	0017879b          	addiw	a5,a5,1
    800069a8:	00f72023          	sw	a5,0(a4)
    800069ac:	00001097          	auipc	ra,0x1
    800069b0:	53c080e7          	jalr	1340(ra) # 80007ee8 <release>
    800069b4:	f65ff06f          	j	80006918 <kerneltrap+0x8c>
    800069b8:	00001097          	auipc	ra,0x1
    800069bc:	098080e7          	jalr	152(ra) # 80007a50 <uartintr>
    800069c0:	fa5ff06f          	j	80006964 <kerneltrap+0xd8>
    800069c4:	00003517          	auipc	a0,0x3
    800069c8:	b8c50513          	addi	a0,a0,-1140 # 80009550 <CONSOLE_STATUS+0x540>
    800069cc:	00000097          	auipc	ra,0x0
    800069d0:	720080e7          	jalr	1824(ra) # 800070ec <panic>

00000000800069d4 <clockintr>:
    800069d4:	fe010113          	addi	sp,sp,-32
    800069d8:	00813823          	sd	s0,16(sp)
    800069dc:	00913423          	sd	s1,8(sp)
    800069e0:	00113c23          	sd	ra,24(sp)
    800069e4:	02010413          	addi	s0,sp,32
    800069e8:	00006497          	auipc	s1,0x6
    800069ec:	15848493          	addi	s1,s1,344 # 8000cb40 <tickslock>
    800069f0:	00048513          	mv	a0,s1
    800069f4:	00001097          	auipc	ra,0x1
    800069f8:	428080e7          	jalr	1064(ra) # 80007e1c <acquire>
    800069fc:	00005717          	auipc	a4,0x5
    80006a00:	fb870713          	addi	a4,a4,-72 # 8000b9b4 <ticks>
    80006a04:	00072783          	lw	a5,0(a4)
    80006a08:	01013403          	ld	s0,16(sp)
    80006a0c:	01813083          	ld	ra,24(sp)
    80006a10:	00048513          	mv	a0,s1
    80006a14:	0017879b          	addiw	a5,a5,1
    80006a18:	00813483          	ld	s1,8(sp)
    80006a1c:	00f72023          	sw	a5,0(a4)
    80006a20:	02010113          	addi	sp,sp,32
    80006a24:	00001317          	auipc	t1,0x1
    80006a28:	4c430067          	jr	1220(t1) # 80007ee8 <release>

0000000080006a2c <devintr>:
    80006a2c:	142027f3          	csrr	a5,scause
    80006a30:	00000513          	li	a0,0
    80006a34:	0007c463          	bltz	a5,80006a3c <devintr+0x10>
    80006a38:	00008067          	ret
    80006a3c:	fe010113          	addi	sp,sp,-32
    80006a40:	00813823          	sd	s0,16(sp)
    80006a44:	00113c23          	sd	ra,24(sp)
    80006a48:	00913423          	sd	s1,8(sp)
    80006a4c:	02010413          	addi	s0,sp,32
    80006a50:	0ff7f713          	andi	a4,a5,255
    80006a54:	00900693          	li	a3,9
    80006a58:	04d70c63          	beq	a4,a3,80006ab0 <devintr+0x84>
    80006a5c:	fff00713          	li	a4,-1
    80006a60:	03f71713          	slli	a4,a4,0x3f
    80006a64:	00170713          	addi	a4,a4,1
    80006a68:	00e78c63          	beq	a5,a4,80006a80 <devintr+0x54>
    80006a6c:	01813083          	ld	ra,24(sp)
    80006a70:	01013403          	ld	s0,16(sp)
    80006a74:	00813483          	ld	s1,8(sp)
    80006a78:	02010113          	addi	sp,sp,32
    80006a7c:	00008067          	ret
    80006a80:	00000097          	auipc	ra,0x0
    80006a84:	c8c080e7          	jalr	-884(ra) # 8000670c <cpuid>
    80006a88:	06050663          	beqz	a0,80006af4 <devintr+0xc8>
    80006a8c:	144027f3          	csrr	a5,sip
    80006a90:	ffd7f793          	andi	a5,a5,-3
    80006a94:	14479073          	csrw	sip,a5
    80006a98:	01813083          	ld	ra,24(sp)
    80006a9c:	01013403          	ld	s0,16(sp)
    80006aa0:	00813483          	ld	s1,8(sp)
    80006aa4:	00200513          	li	a0,2
    80006aa8:	02010113          	addi	sp,sp,32
    80006aac:	00008067          	ret
    80006ab0:	00000097          	auipc	ra,0x0
    80006ab4:	254080e7          	jalr	596(ra) # 80006d04 <plic_claim>
    80006ab8:	00a00793          	li	a5,10
    80006abc:	00050493          	mv	s1,a0
    80006ac0:	06f50663          	beq	a0,a5,80006b2c <devintr+0x100>
    80006ac4:	00100513          	li	a0,1
    80006ac8:	fa0482e3          	beqz	s1,80006a6c <devintr+0x40>
    80006acc:	00048593          	mv	a1,s1
    80006ad0:	00003517          	auipc	a0,0x3
    80006ad4:	aa050513          	addi	a0,a0,-1376 # 80009570 <CONSOLE_STATUS+0x560>
    80006ad8:	00000097          	auipc	ra,0x0
    80006adc:	670080e7          	jalr	1648(ra) # 80007148 <__printf>
    80006ae0:	00048513          	mv	a0,s1
    80006ae4:	00000097          	auipc	ra,0x0
    80006ae8:	258080e7          	jalr	600(ra) # 80006d3c <plic_complete>
    80006aec:	00100513          	li	a0,1
    80006af0:	f7dff06f          	j	80006a6c <devintr+0x40>
    80006af4:	00006517          	auipc	a0,0x6
    80006af8:	04c50513          	addi	a0,a0,76 # 8000cb40 <tickslock>
    80006afc:	00001097          	auipc	ra,0x1
    80006b00:	320080e7          	jalr	800(ra) # 80007e1c <acquire>
    80006b04:	00005717          	auipc	a4,0x5
    80006b08:	eb070713          	addi	a4,a4,-336 # 8000b9b4 <ticks>
    80006b0c:	00072783          	lw	a5,0(a4)
    80006b10:	00006517          	auipc	a0,0x6
    80006b14:	03050513          	addi	a0,a0,48 # 8000cb40 <tickslock>
    80006b18:	0017879b          	addiw	a5,a5,1
    80006b1c:	00f72023          	sw	a5,0(a4)
    80006b20:	00001097          	auipc	ra,0x1
    80006b24:	3c8080e7          	jalr	968(ra) # 80007ee8 <release>
    80006b28:	f65ff06f          	j	80006a8c <devintr+0x60>
    80006b2c:	00001097          	auipc	ra,0x1
    80006b30:	f24080e7          	jalr	-220(ra) # 80007a50 <uartintr>
    80006b34:	fadff06f          	j	80006ae0 <devintr+0xb4>
	...

0000000080006b40 <kernelvec>:
    80006b40:	f0010113          	addi	sp,sp,-256
    80006b44:	00113023          	sd	ra,0(sp)
    80006b48:	00213423          	sd	sp,8(sp)
    80006b4c:	00313823          	sd	gp,16(sp)
    80006b50:	00413c23          	sd	tp,24(sp)
    80006b54:	02513023          	sd	t0,32(sp)
    80006b58:	02613423          	sd	t1,40(sp)
    80006b5c:	02713823          	sd	t2,48(sp)
    80006b60:	02813c23          	sd	s0,56(sp)
    80006b64:	04913023          	sd	s1,64(sp)
    80006b68:	04a13423          	sd	a0,72(sp)
    80006b6c:	04b13823          	sd	a1,80(sp)
    80006b70:	04c13c23          	sd	a2,88(sp)
    80006b74:	06d13023          	sd	a3,96(sp)
    80006b78:	06e13423          	sd	a4,104(sp)
    80006b7c:	06f13823          	sd	a5,112(sp)
    80006b80:	07013c23          	sd	a6,120(sp)
    80006b84:	09113023          	sd	a7,128(sp)
    80006b88:	09213423          	sd	s2,136(sp)
    80006b8c:	09313823          	sd	s3,144(sp)
    80006b90:	09413c23          	sd	s4,152(sp)
    80006b94:	0b513023          	sd	s5,160(sp)
    80006b98:	0b613423          	sd	s6,168(sp)
    80006b9c:	0b713823          	sd	s7,176(sp)
    80006ba0:	0b813c23          	sd	s8,184(sp)
    80006ba4:	0d913023          	sd	s9,192(sp)
    80006ba8:	0da13423          	sd	s10,200(sp)
    80006bac:	0db13823          	sd	s11,208(sp)
    80006bb0:	0dc13c23          	sd	t3,216(sp)
    80006bb4:	0fd13023          	sd	t4,224(sp)
    80006bb8:	0fe13423          	sd	t5,232(sp)
    80006bbc:	0ff13823          	sd	t6,240(sp)
    80006bc0:	ccdff0ef          	jal	ra,8000688c <kerneltrap>
    80006bc4:	00013083          	ld	ra,0(sp)
    80006bc8:	00813103          	ld	sp,8(sp)
    80006bcc:	01013183          	ld	gp,16(sp)
    80006bd0:	02013283          	ld	t0,32(sp)
    80006bd4:	02813303          	ld	t1,40(sp)
    80006bd8:	03013383          	ld	t2,48(sp)
    80006bdc:	03813403          	ld	s0,56(sp)
    80006be0:	04013483          	ld	s1,64(sp)
    80006be4:	04813503          	ld	a0,72(sp)
    80006be8:	05013583          	ld	a1,80(sp)
    80006bec:	05813603          	ld	a2,88(sp)
    80006bf0:	06013683          	ld	a3,96(sp)
    80006bf4:	06813703          	ld	a4,104(sp)
    80006bf8:	07013783          	ld	a5,112(sp)
    80006bfc:	07813803          	ld	a6,120(sp)
    80006c00:	08013883          	ld	a7,128(sp)
    80006c04:	08813903          	ld	s2,136(sp)
    80006c08:	09013983          	ld	s3,144(sp)
    80006c0c:	09813a03          	ld	s4,152(sp)
    80006c10:	0a013a83          	ld	s5,160(sp)
    80006c14:	0a813b03          	ld	s6,168(sp)
    80006c18:	0b013b83          	ld	s7,176(sp)
    80006c1c:	0b813c03          	ld	s8,184(sp)
    80006c20:	0c013c83          	ld	s9,192(sp)
    80006c24:	0c813d03          	ld	s10,200(sp)
    80006c28:	0d013d83          	ld	s11,208(sp)
    80006c2c:	0d813e03          	ld	t3,216(sp)
    80006c30:	0e013e83          	ld	t4,224(sp)
    80006c34:	0e813f03          	ld	t5,232(sp)
    80006c38:	0f013f83          	ld	t6,240(sp)
    80006c3c:	10010113          	addi	sp,sp,256
    80006c40:	10200073          	sret
    80006c44:	00000013          	nop
    80006c48:	00000013          	nop
    80006c4c:	00000013          	nop

0000000080006c50 <timervec>:
    80006c50:	34051573          	csrrw	a0,mscratch,a0
    80006c54:	00b53023          	sd	a1,0(a0)
    80006c58:	00c53423          	sd	a2,8(a0)
    80006c5c:	00d53823          	sd	a3,16(a0)
    80006c60:	01853583          	ld	a1,24(a0)
    80006c64:	02053603          	ld	a2,32(a0)
    80006c68:	0005b683          	ld	a3,0(a1)
    80006c6c:	00c686b3          	add	a3,a3,a2
    80006c70:	00d5b023          	sd	a3,0(a1)
    80006c74:	00200593          	li	a1,2
    80006c78:	14459073          	csrw	sip,a1
    80006c7c:	01053683          	ld	a3,16(a0)
    80006c80:	00853603          	ld	a2,8(a0)
    80006c84:	00053583          	ld	a1,0(a0)
    80006c88:	34051573          	csrrw	a0,mscratch,a0
    80006c8c:	30200073          	mret

0000000080006c90 <plicinit>:
    80006c90:	ff010113          	addi	sp,sp,-16
    80006c94:	00813423          	sd	s0,8(sp)
    80006c98:	01010413          	addi	s0,sp,16
    80006c9c:	00813403          	ld	s0,8(sp)
    80006ca0:	0c0007b7          	lui	a5,0xc000
    80006ca4:	00100713          	li	a4,1
    80006ca8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80006cac:	00e7a223          	sw	a4,4(a5)
    80006cb0:	01010113          	addi	sp,sp,16
    80006cb4:	00008067          	ret

0000000080006cb8 <plicinithart>:
    80006cb8:	ff010113          	addi	sp,sp,-16
    80006cbc:	00813023          	sd	s0,0(sp)
    80006cc0:	00113423          	sd	ra,8(sp)
    80006cc4:	01010413          	addi	s0,sp,16
    80006cc8:	00000097          	auipc	ra,0x0
    80006ccc:	a44080e7          	jalr	-1468(ra) # 8000670c <cpuid>
    80006cd0:	0085171b          	slliw	a4,a0,0x8
    80006cd4:	0c0027b7          	lui	a5,0xc002
    80006cd8:	00e787b3          	add	a5,a5,a4
    80006cdc:	40200713          	li	a4,1026
    80006ce0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006ce4:	00813083          	ld	ra,8(sp)
    80006ce8:	00013403          	ld	s0,0(sp)
    80006cec:	00d5151b          	slliw	a0,a0,0xd
    80006cf0:	0c2017b7          	lui	a5,0xc201
    80006cf4:	00a78533          	add	a0,a5,a0
    80006cf8:	00052023          	sw	zero,0(a0)
    80006cfc:	01010113          	addi	sp,sp,16
    80006d00:	00008067          	ret

0000000080006d04 <plic_claim>:
    80006d04:	ff010113          	addi	sp,sp,-16
    80006d08:	00813023          	sd	s0,0(sp)
    80006d0c:	00113423          	sd	ra,8(sp)
    80006d10:	01010413          	addi	s0,sp,16
    80006d14:	00000097          	auipc	ra,0x0
    80006d18:	9f8080e7          	jalr	-1544(ra) # 8000670c <cpuid>
    80006d1c:	00813083          	ld	ra,8(sp)
    80006d20:	00013403          	ld	s0,0(sp)
    80006d24:	00d5151b          	slliw	a0,a0,0xd
    80006d28:	0c2017b7          	lui	a5,0xc201
    80006d2c:	00a78533          	add	a0,a5,a0
    80006d30:	00452503          	lw	a0,4(a0)
    80006d34:	01010113          	addi	sp,sp,16
    80006d38:	00008067          	ret

0000000080006d3c <plic_complete>:
    80006d3c:	fe010113          	addi	sp,sp,-32
    80006d40:	00813823          	sd	s0,16(sp)
    80006d44:	00913423          	sd	s1,8(sp)
    80006d48:	00113c23          	sd	ra,24(sp)
    80006d4c:	02010413          	addi	s0,sp,32
    80006d50:	00050493          	mv	s1,a0
    80006d54:	00000097          	auipc	ra,0x0
    80006d58:	9b8080e7          	jalr	-1608(ra) # 8000670c <cpuid>
    80006d5c:	01813083          	ld	ra,24(sp)
    80006d60:	01013403          	ld	s0,16(sp)
    80006d64:	00d5179b          	slliw	a5,a0,0xd
    80006d68:	0c201737          	lui	a4,0xc201
    80006d6c:	00f707b3          	add	a5,a4,a5
    80006d70:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006d74:	00813483          	ld	s1,8(sp)
    80006d78:	02010113          	addi	sp,sp,32
    80006d7c:	00008067          	ret

0000000080006d80 <consolewrite>:
    80006d80:	fb010113          	addi	sp,sp,-80
    80006d84:	04813023          	sd	s0,64(sp)
    80006d88:	04113423          	sd	ra,72(sp)
    80006d8c:	02913c23          	sd	s1,56(sp)
    80006d90:	03213823          	sd	s2,48(sp)
    80006d94:	03313423          	sd	s3,40(sp)
    80006d98:	03413023          	sd	s4,32(sp)
    80006d9c:	01513c23          	sd	s5,24(sp)
    80006da0:	05010413          	addi	s0,sp,80
    80006da4:	06c05c63          	blez	a2,80006e1c <consolewrite+0x9c>
    80006da8:	00060993          	mv	s3,a2
    80006dac:	00050a13          	mv	s4,a0
    80006db0:	00058493          	mv	s1,a1
    80006db4:	00000913          	li	s2,0
    80006db8:	fff00a93          	li	s5,-1
    80006dbc:	01c0006f          	j	80006dd8 <consolewrite+0x58>
    80006dc0:	fbf44503          	lbu	a0,-65(s0)
    80006dc4:	0019091b          	addiw	s2,s2,1
    80006dc8:	00148493          	addi	s1,s1,1
    80006dcc:	00001097          	auipc	ra,0x1
    80006dd0:	a9c080e7          	jalr	-1380(ra) # 80007868 <uartputc>
    80006dd4:	03298063          	beq	s3,s2,80006df4 <consolewrite+0x74>
    80006dd8:	00048613          	mv	a2,s1
    80006ddc:	00100693          	li	a3,1
    80006de0:	000a0593          	mv	a1,s4
    80006de4:	fbf40513          	addi	a0,s0,-65
    80006de8:	00000097          	auipc	ra,0x0
    80006dec:	9dc080e7          	jalr	-1572(ra) # 800067c4 <either_copyin>
    80006df0:	fd5518e3          	bne	a0,s5,80006dc0 <consolewrite+0x40>
    80006df4:	04813083          	ld	ra,72(sp)
    80006df8:	04013403          	ld	s0,64(sp)
    80006dfc:	03813483          	ld	s1,56(sp)
    80006e00:	02813983          	ld	s3,40(sp)
    80006e04:	02013a03          	ld	s4,32(sp)
    80006e08:	01813a83          	ld	s5,24(sp)
    80006e0c:	00090513          	mv	a0,s2
    80006e10:	03013903          	ld	s2,48(sp)
    80006e14:	05010113          	addi	sp,sp,80
    80006e18:	00008067          	ret
    80006e1c:	00000913          	li	s2,0
    80006e20:	fd5ff06f          	j	80006df4 <consolewrite+0x74>

0000000080006e24 <consoleread>:
    80006e24:	f9010113          	addi	sp,sp,-112
    80006e28:	06813023          	sd	s0,96(sp)
    80006e2c:	04913c23          	sd	s1,88(sp)
    80006e30:	05213823          	sd	s2,80(sp)
    80006e34:	05313423          	sd	s3,72(sp)
    80006e38:	05413023          	sd	s4,64(sp)
    80006e3c:	03513c23          	sd	s5,56(sp)
    80006e40:	03613823          	sd	s6,48(sp)
    80006e44:	03713423          	sd	s7,40(sp)
    80006e48:	03813023          	sd	s8,32(sp)
    80006e4c:	06113423          	sd	ra,104(sp)
    80006e50:	01913c23          	sd	s9,24(sp)
    80006e54:	07010413          	addi	s0,sp,112
    80006e58:	00060b93          	mv	s7,a2
    80006e5c:	00050913          	mv	s2,a0
    80006e60:	00058c13          	mv	s8,a1
    80006e64:	00060b1b          	sext.w	s6,a2
    80006e68:	00006497          	auipc	s1,0x6
    80006e6c:	d0048493          	addi	s1,s1,-768 # 8000cb68 <cons>
    80006e70:	00400993          	li	s3,4
    80006e74:	fff00a13          	li	s4,-1
    80006e78:	00a00a93          	li	s5,10
    80006e7c:	05705e63          	blez	s7,80006ed8 <consoleread+0xb4>
    80006e80:	09c4a703          	lw	a4,156(s1)
    80006e84:	0984a783          	lw	a5,152(s1)
    80006e88:	0007071b          	sext.w	a4,a4
    80006e8c:	08e78463          	beq	a5,a4,80006f14 <consoleread+0xf0>
    80006e90:	07f7f713          	andi	a4,a5,127
    80006e94:	00e48733          	add	a4,s1,a4
    80006e98:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80006e9c:	0017869b          	addiw	a3,a5,1
    80006ea0:	08d4ac23          	sw	a3,152(s1)
    80006ea4:	00070c9b          	sext.w	s9,a4
    80006ea8:	0b370663          	beq	a4,s3,80006f54 <consoleread+0x130>
    80006eac:	00100693          	li	a3,1
    80006eb0:	f9f40613          	addi	a2,s0,-97
    80006eb4:	000c0593          	mv	a1,s8
    80006eb8:	00090513          	mv	a0,s2
    80006ebc:	f8e40fa3          	sb	a4,-97(s0)
    80006ec0:	00000097          	auipc	ra,0x0
    80006ec4:	8b8080e7          	jalr	-1864(ra) # 80006778 <either_copyout>
    80006ec8:	01450863          	beq	a0,s4,80006ed8 <consoleread+0xb4>
    80006ecc:	001c0c13          	addi	s8,s8,1
    80006ed0:	fffb8b9b          	addiw	s7,s7,-1
    80006ed4:	fb5c94e3          	bne	s9,s5,80006e7c <consoleread+0x58>
    80006ed8:	000b851b          	sext.w	a0,s7
    80006edc:	06813083          	ld	ra,104(sp)
    80006ee0:	06013403          	ld	s0,96(sp)
    80006ee4:	05813483          	ld	s1,88(sp)
    80006ee8:	05013903          	ld	s2,80(sp)
    80006eec:	04813983          	ld	s3,72(sp)
    80006ef0:	04013a03          	ld	s4,64(sp)
    80006ef4:	03813a83          	ld	s5,56(sp)
    80006ef8:	02813b83          	ld	s7,40(sp)
    80006efc:	02013c03          	ld	s8,32(sp)
    80006f00:	01813c83          	ld	s9,24(sp)
    80006f04:	40ab053b          	subw	a0,s6,a0
    80006f08:	03013b03          	ld	s6,48(sp)
    80006f0c:	07010113          	addi	sp,sp,112
    80006f10:	00008067          	ret
    80006f14:	00001097          	auipc	ra,0x1
    80006f18:	1d8080e7          	jalr	472(ra) # 800080ec <push_on>
    80006f1c:	0984a703          	lw	a4,152(s1)
    80006f20:	09c4a783          	lw	a5,156(s1)
    80006f24:	0007879b          	sext.w	a5,a5
    80006f28:	fef70ce3          	beq	a4,a5,80006f20 <consoleread+0xfc>
    80006f2c:	00001097          	auipc	ra,0x1
    80006f30:	234080e7          	jalr	564(ra) # 80008160 <pop_on>
    80006f34:	0984a783          	lw	a5,152(s1)
    80006f38:	07f7f713          	andi	a4,a5,127
    80006f3c:	00e48733          	add	a4,s1,a4
    80006f40:	01874703          	lbu	a4,24(a4)
    80006f44:	0017869b          	addiw	a3,a5,1
    80006f48:	08d4ac23          	sw	a3,152(s1)
    80006f4c:	00070c9b          	sext.w	s9,a4
    80006f50:	f5371ee3          	bne	a4,s3,80006eac <consoleread+0x88>
    80006f54:	000b851b          	sext.w	a0,s7
    80006f58:	f96bf2e3          	bgeu	s7,s6,80006edc <consoleread+0xb8>
    80006f5c:	08f4ac23          	sw	a5,152(s1)
    80006f60:	f7dff06f          	j	80006edc <consoleread+0xb8>

0000000080006f64 <consputc>:
    80006f64:	10000793          	li	a5,256
    80006f68:	00f50663          	beq	a0,a5,80006f74 <consputc+0x10>
    80006f6c:	00001317          	auipc	t1,0x1
    80006f70:	9f430067          	jr	-1548(t1) # 80007960 <uartputc_sync>
    80006f74:	ff010113          	addi	sp,sp,-16
    80006f78:	00113423          	sd	ra,8(sp)
    80006f7c:	00813023          	sd	s0,0(sp)
    80006f80:	01010413          	addi	s0,sp,16
    80006f84:	00800513          	li	a0,8
    80006f88:	00001097          	auipc	ra,0x1
    80006f8c:	9d8080e7          	jalr	-1576(ra) # 80007960 <uartputc_sync>
    80006f90:	02000513          	li	a0,32
    80006f94:	00001097          	auipc	ra,0x1
    80006f98:	9cc080e7          	jalr	-1588(ra) # 80007960 <uartputc_sync>
    80006f9c:	00013403          	ld	s0,0(sp)
    80006fa0:	00813083          	ld	ra,8(sp)
    80006fa4:	00800513          	li	a0,8
    80006fa8:	01010113          	addi	sp,sp,16
    80006fac:	00001317          	auipc	t1,0x1
    80006fb0:	9b430067          	jr	-1612(t1) # 80007960 <uartputc_sync>

0000000080006fb4 <consoleintr>:
    80006fb4:	fe010113          	addi	sp,sp,-32
    80006fb8:	00813823          	sd	s0,16(sp)
    80006fbc:	00913423          	sd	s1,8(sp)
    80006fc0:	01213023          	sd	s2,0(sp)
    80006fc4:	00113c23          	sd	ra,24(sp)
    80006fc8:	02010413          	addi	s0,sp,32
    80006fcc:	00006917          	auipc	s2,0x6
    80006fd0:	b9c90913          	addi	s2,s2,-1124 # 8000cb68 <cons>
    80006fd4:	00050493          	mv	s1,a0
    80006fd8:	00090513          	mv	a0,s2
    80006fdc:	00001097          	auipc	ra,0x1
    80006fe0:	e40080e7          	jalr	-448(ra) # 80007e1c <acquire>
    80006fe4:	02048c63          	beqz	s1,8000701c <consoleintr+0x68>
    80006fe8:	0a092783          	lw	a5,160(s2)
    80006fec:	09892703          	lw	a4,152(s2)
    80006ff0:	07f00693          	li	a3,127
    80006ff4:	40e7873b          	subw	a4,a5,a4
    80006ff8:	02e6e263          	bltu	a3,a4,8000701c <consoleintr+0x68>
    80006ffc:	00d00713          	li	a4,13
    80007000:	04e48063          	beq	s1,a4,80007040 <consoleintr+0x8c>
    80007004:	07f7f713          	andi	a4,a5,127
    80007008:	00e90733          	add	a4,s2,a4
    8000700c:	0017879b          	addiw	a5,a5,1
    80007010:	0af92023          	sw	a5,160(s2)
    80007014:	00970c23          	sb	s1,24(a4)
    80007018:	08f92e23          	sw	a5,156(s2)
    8000701c:	01013403          	ld	s0,16(sp)
    80007020:	01813083          	ld	ra,24(sp)
    80007024:	00813483          	ld	s1,8(sp)
    80007028:	00013903          	ld	s2,0(sp)
    8000702c:	00006517          	auipc	a0,0x6
    80007030:	b3c50513          	addi	a0,a0,-1220 # 8000cb68 <cons>
    80007034:	02010113          	addi	sp,sp,32
    80007038:	00001317          	auipc	t1,0x1
    8000703c:	eb030067          	jr	-336(t1) # 80007ee8 <release>
    80007040:	00a00493          	li	s1,10
    80007044:	fc1ff06f          	j	80007004 <consoleintr+0x50>

0000000080007048 <consoleinit>:
    80007048:	fe010113          	addi	sp,sp,-32
    8000704c:	00113c23          	sd	ra,24(sp)
    80007050:	00813823          	sd	s0,16(sp)
    80007054:	00913423          	sd	s1,8(sp)
    80007058:	02010413          	addi	s0,sp,32
    8000705c:	00006497          	auipc	s1,0x6
    80007060:	b0c48493          	addi	s1,s1,-1268 # 8000cb68 <cons>
    80007064:	00048513          	mv	a0,s1
    80007068:	00002597          	auipc	a1,0x2
    8000706c:	56058593          	addi	a1,a1,1376 # 800095c8 <CONSOLE_STATUS+0x5b8>
    80007070:	00001097          	auipc	ra,0x1
    80007074:	d88080e7          	jalr	-632(ra) # 80007df8 <initlock>
    80007078:	00000097          	auipc	ra,0x0
    8000707c:	7ac080e7          	jalr	1964(ra) # 80007824 <uartinit>
    80007080:	01813083          	ld	ra,24(sp)
    80007084:	01013403          	ld	s0,16(sp)
    80007088:	00000797          	auipc	a5,0x0
    8000708c:	d9c78793          	addi	a5,a5,-612 # 80006e24 <consoleread>
    80007090:	0af4bc23          	sd	a5,184(s1)
    80007094:	00000797          	auipc	a5,0x0
    80007098:	cec78793          	addi	a5,a5,-788 # 80006d80 <consolewrite>
    8000709c:	0cf4b023          	sd	a5,192(s1)
    800070a0:	00813483          	ld	s1,8(sp)
    800070a4:	02010113          	addi	sp,sp,32
    800070a8:	00008067          	ret

00000000800070ac <console_read>:
    800070ac:	ff010113          	addi	sp,sp,-16
    800070b0:	00813423          	sd	s0,8(sp)
    800070b4:	01010413          	addi	s0,sp,16
    800070b8:	00813403          	ld	s0,8(sp)
    800070bc:	00006317          	auipc	t1,0x6
    800070c0:	b6433303          	ld	t1,-1180(t1) # 8000cc20 <devsw+0x10>
    800070c4:	01010113          	addi	sp,sp,16
    800070c8:	00030067          	jr	t1

00000000800070cc <console_write>:
    800070cc:	ff010113          	addi	sp,sp,-16
    800070d0:	00813423          	sd	s0,8(sp)
    800070d4:	01010413          	addi	s0,sp,16
    800070d8:	00813403          	ld	s0,8(sp)
    800070dc:	00006317          	auipc	t1,0x6
    800070e0:	b4c33303          	ld	t1,-1204(t1) # 8000cc28 <devsw+0x18>
    800070e4:	01010113          	addi	sp,sp,16
    800070e8:	00030067          	jr	t1

00000000800070ec <panic>:
    800070ec:	fe010113          	addi	sp,sp,-32
    800070f0:	00113c23          	sd	ra,24(sp)
    800070f4:	00813823          	sd	s0,16(sp)
    800070f8:	00913423          	sd	s1,8(sp)
    800070fc:	02010413          	addi	s0,sp,32
    80007100:	00050493          	mv	s1,a0
    80007104:	00002517          	auipc	a0,0x2
    80007108:	4cc50513          	addi	a0,a0,1228 # 800095d0 <CONSOLE_STATUS+0x5c0>
    8000710c:	00006797          	auipc	a5,0x6
    80007110:	ba07ae23          	sw	zero,-1092(a5) # 8000ccc8 <pr+0x18>
    80007114:	00000097          	auipc	ra,0x0
    80007118:	034080e7          	jalr	52(ra) # 80007148 <__printf>
    8000711c:	00048513          	mv	a0,s1
    80007120:	00000097          	auipc	ra,0x0
    80007124:	028080e7          	jalr	40(ra) # 80007148 <__printf>
    80007128:	00002517          	auipc	a0,0x2
    8000712c:	03850513          	addi	a0,a0,56 # 80009160 <CONSOLE_STATUS+0x150>
    80007130:	00000097          	auipc	ra,0x0
    80007134:	018080e7          	jalr	24(ra) # 80007148 <__printf>
    80007138:	00100793          	li	a5,1
    8000713c:	00005717          	auipc	a4,0x5
    80007140:	86f72e23          	sw	a5,-1924(a4) # 8000b9b8 <panicked>
    80007144:	0000006f          	j	80007144 <panic+0x58>

0000000080007148 <__printf>:
    80007148:	f3010113          	addi	sp,sp,-208
    8000714c:	08813023          	sd	s0,128(sp)
    80007150:	07313423          	sd	s3,104(sp)
    80007154:	09010413          	addi	s0,sp,144
    80007158:	05813023          	sd	s8,64(sp)
    8000715c:	08113423          	sd	ra,136(sp)
    80007160:	06913c23          	sd	s1,120(sp)
    80007164:	07213823          	sd	s2,112(sp)
    80007168:	07413023          	sd	s4,96(sp)
    8000716c:	05513c23          	sd	s5,88(sp)
    80007170:	05613823          	sd	s6,80(sp)
    80007174:	05713423          	sd	s7,72(sp)
    80007178:	03913c23          	sd	s9,56(sp)
    8000717c:	03a13823          	sd	s10,48(sp)
    80007180:	03b13423          	sd	s11,40(sp)
    80007184:	00006317          	auipc	t1,0x6
    80007188:	b2c30313          	addi	t1,t1,-1236 # 8000ccb0 <pr>
    8000718c:	01832c03          	lw	s8,24(t1)
    80007190:	00b43423          	sd	a1,8(s0)
    80007194:	00c43823          	sd	a2,16(s0)
    80007198:	00d43c23          	sd	a3,24(s0)
    8000719c:	02e43023          	sd	a4,32(s0)
    800071a0:	02f43423          	sd	a5,40(s0)
    800071a4:	03043823          	sd	a6,48(s0)
    800071a8:	03143c23          	sd	a7,56(s0)
    800071ac:	00050993          	mv	s3,a0
    800071b0:	4a0c1663          	bnez	s8,8000765c <__printf+0x514>
    800071b4:	60098c63          	beqz	s3,800077cc <__printf+0x684>
    800071b8:	0009c503          	lbu	a0,0(s3)
    800071bc:	00840793          	addi	a5,s0,8
    800071c0:	f6f43c23          	sd	a5,-136(s0)
    800071c4:	00000493          	li	s1,0
    800071c8:	22050063          	beqz	a0,800073e8 <__printf+0x2a0>
    800071cc:	00002a37          	lui	s4,0x2
    800071d0:	00018ab7          	lui	s5,0x18
    800071d4:	000f4b37          	lui	s6,0xf4
    800071d8:	00989bb7          	lui	s7,0x989
    800071dc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800071e0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800071e4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800071e8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800071ec:	00148c9b          	addiw	s9,s1,1
    800071f0:	02500793          	li	a5,37
    800071f4:	01998933          	add	s2,s3,s9
    800071f8:	38f51263          	bne	a0,a5,8000757c <__printf+0x434>
    800071fc:	00094783          	lbu	a5,0(s2)
    80007200:	00078c9b          	sext.w	s9,a5
    80007204:	1e078263          	beqz	a5,800073e8 <__printf+0x2a0>
    80007208:	0024849b          	addiw	s1,s1,2
    8000720c:	07000713          	li	a4,112
    80007210:	00998933          	add	s2,s3,s1
    80007214:	38e78a63          	beq	a5,a4,800075a8 <__printf+0x460>
    80007218:	20f76863          	bltu	a4,a5,80007428 <__printf+0x2e0>
    8000721c:	42a78863          	beq	a5,a0,8000764c <__printf+0x504>
    80007220:	06400713          	li	a4,100
    80007224:	40e79663          	bne	a5,a4,80007630 <__printf+0x4e8>
    80007228:	f7843783          	ld	a5,-136(s0)
    8000722c:	0007a603          	lw	a2,0(a5)
    80007230:	00878793          	addi	a5,a5,8
    80007234:	f6f43c23          	sd	a5,-136(s0)
    80007238:	42064a63          	bltz	a2,8000766c <__printf+0x524>
    8000723c:	00a00713          	li	a4,10
    80007240:	02e677bb          	remuw	a5,a2,a4
    80007244:	00002d97          	auipc	s11,0x2
    80007248:	3b4d8d93          	addi	s11,s11,948 # 800095f8 <digits>
    8000724c:	00900593          	li	a1,9
    80007250:	0006051b          	sext.w	a0,a2
    80007254:	00000c93          	li	s9,0
    80007258:	02079793          	slli	a5,a5,0x20
    8000725c:	0207d793          	srli	a5,a5,0x20
    80007260:	00fd87b3          	add	a5,s11,a5
    80007264:	0007c783          	lbu	a5,0(a5)
    80007268:	02e656bb          	divuw	a3,a2,a4
    8000726c:	f8f40023          	sb	a5,-128(s0)
    80007270:	14c5d863          	bge	a1,a2,800073c0 <__printf+0x278>
    80007274:	06300593          	li	a1,99
    80007278:	00100c93          	li	s9,1
    8000727c:	02e6f7bb          	remuw	a5,a3,a4
    80007280:	02079793          	slli	a5,a5,0x20
    80007284:	0207d793          	srli	a5,a5,0x20
    80007288:	00fd87b3          	add	a5,s11,a5
    8000728c:	0007c783          	lbu	a5,0(a5)
    80007290:	02e6d73b          	divuw	a4,a3,a4
    80007294:	f8f400a3          	sb	a5,-127(s0)
    80007298:	12a5f463          	bgeu	a1,a0,800073c0 <__printf+0x278>
    8000729c:	00a00693          	li	a3,10
    800072a0:	00900593          	li	a1,9
    800072a4:	02d777bb          	remuw	a5,a4,a3
    800072a8:	02079793          	slli	a5,a5,0x20
    800072ac:	0207d793          	srli	a5,a5,0x20
    800072b0:	00fd87b3          	add	a5,s11,a5
    800072b4:	0007c503          	lbu	a0,0(a5)
    800072b8:	02d757bb          	divuw	a5,a4,a3
    800072bc:	f8a40123          	sb	a0,-126(s0)
    800072c0:	48e5f263          	bgeu	a1,a4,80007744 <__printf+0x5fc>
    800072c4:	06300513          	li	a0,99
    800072c8:	02d7f5bb          	remuw	a1,a5,a3
    800072cc:	02059593          	slli	a1,a1,0x20
    800072d0:	0205d593          	srli	a1,a1,0x20
    800072d4:	00bd85b3          	add	a1,s11,a1
    800072d8:	0005c583          	lbu	a1,0(a1)
    800072dc:	02d7d7bb          	divuw	a5,a5,a3
    800072e0:	f8b401a3          	sb	a1,-125(s0)
    800072e4:	48e57263          	bgeu	a0,a4,80007768 <__printf+0x620>
    800072e8:	3e700513          	li	a0,999
    800072ec:	02d7f5bb          	remuw	a1,a5,a3
    800072f0:	02059593          	slli	a1,a1,0x20
    800072f4:	0205d593          	srli	a1,a1,0x20
    800072f8:	00bd85b3          	add	a1,s11,a1
    800072fc:	0005c583          	lbu	a1,0(a1)
    80007300:	02d7d7bb          	divuw	a5,a5,a3
    80007304:	f8b40223          	sb	a1,-124(s0)
    80007308:	46e57663          	bgeu	a0,a4,80007774 <__printf+0x62c>
    8000730c:	02d7f5bb          	remuw	a1,a5,a3
    80007310:	02059593          	slli	a1,a1,0x20
    80007314:	0205d593          	srli	a1,a1,0x20
    80007318:	00bd85b3          	add	a1,s11,a1
    8000731c:	0005c583          	lbu	a1,0(a1)
    80007320:	02d7d7bb          	divuw	a5,a5,a3
    80007324:	f8b402a3          	sb	a1,-123(s0)
    80007328:	46ea7863          	bgeu	s4,a4,80007798 <__printf+0x650>
    8000732c:	02d7f5bb          	remuw	a1,a5,a3
    80007330:	02059593          	slli	a1,a1,0x20
    80007334:	0205d593          	srli	a1,a1,0x20
    80007338:	00bd85b3          	add	a1,s11,a1
    8000733c:	0005c583          	lbu	a1,0(a1)
    80007340:	02d7d7bb          	divuw	a5,a5,a3
    80007344:	f8b40323          	sb	a1,-122(s0)
    80007348:	3eeaf863          	bgeu	s5,a4,80007738 <__printf+0x5f0>
    8000734c:	02d7f5bb          	remuw	a1,a5,a3
    80007350:	02059593          	slli	a1,a1,0x20
    80007354:	0205d593          	srli	a1,a1,0x20
    80007358:	00bd85b3          	add	a1,s11,a1
    8000735c:	0005c583          	lbu	a1,0(a1)
    80007360:	02d7d7bb          	divuw	a5,a5,a3
    80007364:	f8b403a3          	sb	a1,-121(s0)
    80007368:	42eb7e63          	bgeu	s6,a4,800077a4 <__printf+0x65c>
    8000736c:	02d7f5bb          	remuw	a1,a5,a3
    80007370:	02059593          	slli	a1,a1,0x20
    80007374:	0205d593          	srli	a1,a1,0x20
    80007378:	00bd85b3          	add	a1,s11,a1
    8000737c:	0005c583          	lbu	a1,0(a1)
    80007380:	02d7d7bb          	divuw	a5,a5,a3
    80007384:	f8b40423          	sb	a1,-120(s0)
    80007388:	42ebfc63          	bgeu	s7,a4,800077c0 <__printf+0x678>
    8000738c:	02079793          	slli	a5,a5,0x20
    80007390:	0207d793          	srli	a5,a5,0x20
    80007394:	00fd8db3          	add	s11,s11,a5
    80007398:	000dc703          	lbu	a4,0(s11)
    8000739c:	00a00793          	li	a5,10
    800073a0:	00900c93          	li	s9,9
    800073a4:	f8e404a3          	sb	a4,-119(s0)
    800073a8:	00065c63          	bgez	a2,800073c0 <__printf+0x278>
    800073ac:	f9040713          	addi	a4,s0,-112
    800073b0:	00f70733          	add	a4,a4,a5
    800073b4:	02d00693          	li	a3,45
    800073b8:	fed70823          	sb	a3,-16(a4)
    800073bc:	00078c93          	mv	s9,a5
    800073c0:	f8040793          	addi	a5,s0,-128
    800073c4:	01978cb3          	add	s9,a5,s9
    800073c8:	f7f40d13          	addi	s10,s0,-129
    800073cc:	000cc503          	lbu	a0,0(s9)
    800073d0:	fffc8c93          	addi	s9,s9,-1
    800073d4:	00000097          	auipc	ra,0x0
    800073d8:	b90080e7          	jalr	-1136(ra) # 80006f64 <consputc>
    800073dc:	ffac98e3          	bne	s9,s10,800073cc <__printf+0x284>
    800073e0:	00094503          	lbu	a0,0(s2)
    800073e4:	e00514e3          	bnez	a0,800071ec <__printf+0xa4>
    800073e8:	1a0c1663          	bnez	s8,80007594 <__printf+0x44c>
    800073ec:	08813083          	ld	ra,136(sp)
    800073f0:	08013403          	ld	s0,128(sp)
    800073f4:	07813483          	ld	s1,120(sp)
    800073f8:	07013903          	ld	s2,112(sp)
    800073fc:	06813983          	ld	s3,104(sp)
    80007400:	06013a03          	ld	s4,96(sp)
    80007404:	05813a83          	ld	s5,88(sp)
    80007408:	05013b03          	ld	s6,80(sp)
    8000740c:	04813b83          	ld	s7,72(sp)
    80007410:	04013c03          	ld	s8,64(sp)
    80007414:	03813c83          	ld	s9,56(sp)
    80007418:	03013d03          	ld	s10,48(sp)
    8000741c:	02813d83          	ld	s11,40(sp)
    80007420:	0d010113          	addi	sp,sp,208
    80007424:	00008067          	ret
    80007428:	07300713          	li	a4,115
    8000742c:	1ce78a63          	beq	a5,a4,80007600 <__printf+0x4b8>
    80007430:	07800713          	li	a4,120
    80007434:	1ee79e63          	bne	a5,a4,80007630 <__printf+0x4e8>
    80007438:	f7843783          	ld	a5,-136(s0)
    8000743c:	0007a703          	lw	a4,0(a5)
    80007440:	00878793          	addi	a5,a5,8
    80007444:	f6f43c23          	sd	a5,-136(s0)
    80007448:	28074263          	bltz	a4,800076cc <__printf+0x584>
    8000744c:	00002d97          	auipc	s11,0x2
    80007450:	1acd8d93          	addi	s11,s11,428 # 800095f8 <digits>
    80007454:	00f77793          	andi	a5,a4,15
    80007458:	00fd87b3          	add	a5,s11,a5
    8000745c:	0007c683          	lbu	a3,0(a5)
    80007460:	00f00613          	li	a2,15
    80007464:	0007079b          	sext.w	a5,a4
    80007468:	f8d40023          	sb	a3,-128(s0)
    8000746c:	0047559b          	srliw	a1,a4,0x4
    80007470:	0047569b          	srliw	a3,a4,0x4
    80007474:	00000c93          	li	s9,0
    80007478:	0ee65063          	bge	a2,a4,80007558 <__printf+0x410>
    8000747c:	00f6f693          	andi	a3,a3,15
    80007480:	00dd86b3          	add	a3,s11,a3
    80007484:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007488:	0087d79b          	srliw	a5,a5,0x8
    8000748c:	00100c93          	li	s9,1
    80007490:	f8d400a3          	sb	a3,-127(s0)
    80007494:	0cb67263          	bgeu	a2,a1,80007558 <__printf+0x410>
    80007498:	00f7f693          	andi	a3,a5,15
    8000749c:	00dd86b3          	add	a3,s11,a3
    800074a0:	0006c583          	lbu	a1,0(a3)
    800074a4:	00f00613          	li	a2,15
    800074a8:	0047d69b          	srliw	a3,a5,0x4
    800074ac:	f8b40123          	sb	a1,-126(s0)
    800074b0:	0047d593          	srli	a1,a5,0x4
    800074b4:	28f67e63          	bgeu	a2,a5,80007750 <__printf+0x608>
    800074b8:	00f6f693          	andi	a3,a3,15
    800074bc:	00dd86b3          	add	a3,s11,a3
    800074c0:	0006c503          	lbu	a0,0(a3)
    800074c4:	0087d813          	srli	a6,a5,0x8
    800074c8:	0087d69b          	srliw	a3,a5,0x8
    800074cc:	f8a401a3          	sb	a0,-125(s0)
    800074d0:	28b67663          	bgeu	a2,a1,8000775c <__printf+0x614>
    800074d4:	00f6f693          	andi	a3,a3,15
    800074d8:	00dd86b3          	add	a3,s11,a3
    800074dc:	0006c583          	lbu	a1,0(a3)
    800074e0:	00c7d513          	srli	a0,a5,0xc
    800074e4:	00c7d69b          	srliw	a3,a5,0xc
    800074e8:	f8b40223          	sb	a1,-124(s0)
    800074ec:	29067a63          	bgeu	a2,a6,80007780 <__printf+0x638>
    800074f0:	00f6f693          	andi	a3,a3,15
    800074f4:	00dd86b3          	add	a3,s11,a3
    800074f8:	0006c583          	lbu	a1,0(a3)
    800074fc:	0107d813          	srli	a6,a5,0x10
    80007500:	0107d69b          	srliw	a3,a5,0x10
    80007504:	f8b402a3          	sb	a1,-123(s0)
    80007508:	28a67263          	bgeu	a2,a0,8000778c <__printf+0x644>
    8000750c:	00f6f693          	andi	a3,a3,15
    80007510:	00dd86b3          	add	a3,s11,a3
    80007514:	0006c683          	lbu	a3,0(a3)
    80007518:	0147d79b          	srliw	a5,a5,0x14
    8000751c:	f8d40323          	sb	a3,-122(s0)
    80007520:	21067663          	bgeu	a2,a6,8000772c <__printf+0x5e4>
    80007524:	02079793          	slli	a5,a5,0x20
    80007528:	0207d793          	srli	a5,a5,0x20
    8000752c:	00fd8db3          	add	s11,s11,a5
    80007530:	000dc683          	lbu	a3,0(s11)
    80007534:	00800793          	li	a5,8
    80007538:	00700c93          	li	s9,7
    8000753c:	f8d403a3          	sb	a3,-121(s0)
    80007540:	00075c63          	bgez	a4,80007558 <__printf+0x410>
    80007544:	f9040713          	addi	a4,s0,-112
    80007548:	00f70733          	add	a4,a4,a5
    8000754c:	02d00693          	li	a3,45
    80007550:	fed70823          	sb	a3,-16(a4)
    80007554:	00078c93          	mv	s9,a5
    80007558:	f8040793          	addi	a5,s0,-128
    8000755c:	01978cb3          	add	s9,a5,s9
    80007560:	f7f40d13          	addi	s10,s0,-129
    80007564:	000cc503          	lbu	a0,0(s9)
    80007568:	fffc8c93          	addi	s9,s9,-1
    8000756c:	00000097          	auipc	ra,0x0
    80007570:	9f8080e7          	jalr	-1544(ra) # 80006f64 <consputc>
    80007574:	ff9d18e3          	bne	s10,s9,80007564 <__printf+0x41c>
    80007578:	0100006f          	j	80007588 <__printf+0x440>
    8000757c:	00000097          	auipc	ra,0x0
    80007580:	9e8080e7          	jalr	-1560(ra) # 80006f64 <consputc>
    80007584:	000c8493          	mv	s1,s9
    80007588:	00094503          	lbu	a0,0(s2)
    8000758c:	c60510e3          	bnez	a0,800071ec <__printf+0xa4>
    80007590:	e40c0ee3          	beqz	s8,800073ec <__printf+0x2a4>
    80007594:	00005517          	auipc	a0,0x5
    80007598:	71c50513          	addi	a0,a0,1820 # 8000ccb0 <pr>
    8000759c:	00001097          	auipc	ra,0x1
    800075a0:	94c080e7          	jalr	-1716(ra) # 80007ee8 <release>
    800075a4:	e49ff06f          	j	800073ec <__printf+0x2a4>
    800075a8:	f7843783          	ld	a5,-136(s0)
    800075ac:	03000513          	li	a0,48
    800075b0:	01000d13          	li	s10,16
    800075b4:	00878713          	addi	a4,a5,8
    800075b8:	0007bc83          	ld	s9,0(a5)
    800075bc:	f6e43c23          	sd	a4,-136(s0)
    800075c0:	00000097          	auipc	ra,0x0
    800075c4:	9a4080e7          	jalr	-1628(ra) # 80006f64 <consputc>
    800075c8:	07800513          	li	a0,120
    800075cc:	00000097          	auipc	ra,0x0
    800075d0:	998080e7          	jalr	-1640(ra) # 80006f64 <consputc>
    800075d4:	00002d97          	auipc	s11,0x2
    800075d8:	024d8d93          	addi	s11,s11,36 # 800095f8 <digits>
    800075dc:	03ccd793          	srli	a5,s9,0x3c
    800075e0:	00fd87b3          	add	a5,s11,a5
    800075e4:	0007c503          	lbu	a0,0(a5)
    800075e8:	fffd0d1b          	addiw	s10,s10,-1
    800075ec:	004c9c93          	slli	s9,s9,0x4
    800075f0:	00000097          	auipc	ra,0x0
    800075f4:	974080e7          	jalr	-1676(ra) # 80006f64 <consputc>
    800075f8:	fe0d12e3          	bnez	s10,800075dc <__printf+0x494>
    800075fc:	f8dff06f          	j	80007588 <__printf+0x440>
    80007600:	f7843783          	ld	a5,-136(s0)
    80007604:	0007bc83          	ld	s9,0(a5)
    80007608:	00878793          	addi	a5,a5,8
    8000760c:	f6f43c23          	sd	a5,-136(s0)
    80007610:	000c9a63          	bnez	s9,80007624 <__printf+0x4dc>
    80007614:	1080006f          	j	8000771c <__printf+0x5d4>
    80007618:	001c8c93          	addi	s9,s9,1
    8000761c:	00000097          	auipc	ra,0x0
    80007620:	948080e7          	jalr	-1720(ra) # 80006f64 <consputc>
    80007624:	000cc503          	lbu	a0,0(s9)
    80007628:	fe0518e3          	bnez	a0,80007618 <__printf+0x4d0>
    8000762c:	f5dff06f          	j	80007588 <__printf+0x440>
    80007630:	02500513          	li	a0,37
    80007634:	00000097          	auipc	ra,0x0
    80007638:	930080e7          	jalr	-1744(ra) # 80006f64 <consputc>
    8000763c:	000c8513          	mv	a0,s9
    80007640:	00000097          	auipc	ra,0x0
    80007644:	924080e7          	jalr	-1756(ra) # 80006f64 <consputc>
    80007648:	f41ff06f          	j	80007588 <__printf+0x440>
    8000764c:	02500513          	li	a0,37
    80007650:	00000097          	auipc	ra,0x0
    80007654:	914080e7          	jalr	-1772(ra) # 80006f64 <consputc>
    80007658:	f31ff06f          	j	80007588 <__printf+0x440>
    8000765c:	00030513          	mv	a0,t1
    80007660:	00000097          	auipc	ra,0x0
    80007664:	7bc080e7          	jalr	1980(ra) # 80007e1c <acquire>
    80007668:	b4dff06f          	j	800071b4 <__printf+0x6c>
    8000766c:	40c0053b          	negw	a0,a2
    80007670:	00a00713          	li	a4,10
    80007674:	02e576bb          	remuw	a3,a0,a4
    80007678:	00002d97          	auipc	s11,0x2
    8000767c:	f80d8d93          	addi	s11,s11,-128 # 800095f8 <digits>
    80007680:	ff700593          	li	a1,-9
    80007684:	02069693          	slli	a3,a3,0x20
    80007688:	0206d693          	srli	a3,a3,0x20
    8000768c:	00dd86b3          	add	a3,s11,a3
    80007690:	0006c683          	lbu	a3,0(a3)
    80007694:	02e557bb          	divuw	a5,a0,a4
    80007698:	f8d40023          	sb	a3,-128(s0)
    8000769c:	10b65e63          	bge	a2,a1,800077b8 <__printf+0x670>
    800076a0:	06300593          	li	a1,99
    800076a4:	02e7f6bb          	remuw	a3,a5,a4
    800076a8:	02069693          	slli	a3,a3,0x20
    800076ac:	0206d693          	srli	a3,a3,0x20
    800076b0:	00dd86b3          	add	a3,s11,a3
    800076b4:	0006c683          	lbu	a3,0(a3)
    800076b8:	02e7d73b          	divuw	a4,a5,a4
    800076bc:	00200793          	li	a5,2
    800076c0:	f8d400a3          	sb	a3,-127(s0)
    800076c4:	bca5ece3          	bltu	a1,a0,8000729c <__printf+0x154>
    800076c8:	ce5ff06f          	j	800073ac <__printf+0x264>
    800076cc:	40e007bb          	negw	a5,a4
    800076d0:	00002d97          	auipc	s11,0x2
    800076d4:	f28d8d93          	addi	s11,s11,-216 # 800095f8 <digits>
    800076d8:	00f7f693          	andi	a3,a5,15
    800076dc:	00dd86b3          	add	a3,s11,a3
    800076e0:	0006c583          	lbu	a1,0(a3)
    800076e4:	ff100613          	li	a2,-15
    800076e8:	0047d69b          	srliw	a3,a5,0x4
    800076ec:	f8b40023          	sb	a1,-128(s0)
    800076f0:	0047d59b          	srliw	a1,a5,0x4
    800076f4:	0ac75e63          	bge	a4,a2,800077b0 <__printf+0x668>
    800076f8:	00f6f693          	andi	a3,a3,15
    800076fc:	00dd86b3          	add	a3,s11,a3
    80007700:	0006c603          	lbu	a2,0(a3)
    80007704:	00f00693          	li	a3,15
    80007708:	0087d79b          	srliw	a5,a5,0x8
    8000770c:	f8c400a3          	sb	a2,-127(s0)
    80007710:	d8b6e4e3          	bltu	a3,a1,80007498 <__printf+0x350>
    80007714:	00200793          	li	a5,2
    80007718:	e2dff06f          	j	80007544 <__printf+0x3fc>
    8000771c:	00002c97          	auipc	s9,0x2
    80007720:	ebcc8c93          	addi	s9,s9,-324 # 800095d8 <CONSOLE_STATUS+0x5c8>
    80007724:	02800513          	li	a0,40
    80007728:	ef1ff06f          	j	80007618 <__printf+0x4d0>
    8000772c:	00700793          	li	a5,7
    80007730:	00600c93          	li	s9,6
    80007734:	e0dff06f          	j	80007540 <__printf+0x3f8>
    80007738:	00700793          	li	a5,7
    8000773c:	00600c93          	li	s9,6
    80007740:	c69ff06f          	j	800073a8 <__printf+0x260>
    80007744:	00300793          	li	a5,3
    80007748:	00200c93          	li	s9,2
    8000774c:	c5dff06f          	j	800073a8 <__printf+0x260>
    80007750:	00300793          	li	a5,3
    80007754:	00200c93          	li	s9,2
    80007758:	de9ff06f          	j	80007540 <__printf+0x3f8>
    8000775c:	00400793          	li	a5,4
    80007760:	00300c93          	li	s9,3
    80007764:	dddff06f          	j	80007540 <__printf+0x3f8>
    80007768:	00400793          	li	a5,4
    8000776c:	00300c93          	li	s9,3
    80007770:	c39ff06f          	j	800073a8 <__printf+0x260>
    80007774:	00500793          	li	a5,5
    80007778:	00400c93          	li	s9,4
    8000777c:	c2dff06f          	j	800073a8 <__printf+0x260>
    80007780:	00500793          	li	a5,5
    80007784:	00400c93          	li	s9,4
    80007788:	db9ff06f          	j	80007540 <__printf+0x3f8>
    8000778c:	00600793          	li	a5,6
    80007790:	00500c93          	li	s9,5
    80007794:	dadff06f          	j	80007540 <__printf+0x3f8>
    80007798:	00600793          	li	a5,6
    8000779c:	00500c93          	li	s9,5
    800077a0:	c09ff06f          	j	800073a8 <__printf+0x260>
    800077a4:	00800793          	li	a5,8
    800077a8:	00700c93          	li	s9,7
    800077ac:	bfdff06f          	j	800073a8 <__printf+0x260>
    800077b0:	00100793          	li	a5,1
    800077b4:	d91ff06f          	j	80007544 <__printf+0x3fc>
    800077b8:	00100793          	li	a5,1
    800077bc:	bf1ff06f          	j	800073ac <__printf+0x264>
    800077c0:	00900793          	li	a5,9
    800077c4:	00800c93          	li	s9,8
    800077c8:	be1ff06f          	j	800073a8 <__printf+0x260>
    800077cc:	00002517          	auipc	a0,0x2
    800077d0:	e1450513          	addi	a0,a0,-492 # 800095e0 <CONSOLE_STATUS+0x5d0>
    800077d4:	00000097          	auipc	ra,0x0
    800077d8:	918080e7          	jalr	-1768(ra) # 800070ec <panic>

00000000800077dc <printfinit>:
    800077dc:	fe010113          	addi	sp,sp,-32
    800077e0:	00813823          	sd	s0,16(sp)
    800077e4:	00913423          	sd	s1,8(sp)
    800077e8:	00113c23          	sd	ra,24(sp)
    800077ec:	02010413          	addi	s0,sp,32
    800077f0:	00005497          	auipc	s1,0x5
    800077f4:	4c048493          	addi	s1,s1,1216 # 8000ccb0 <pr>
    800077f8:	00048513          	mv	a0,s1
    800077fc:	00002597          	auipc	a1,0x2
    80007800:	df458593          	addi	a1,a1,-524 # 800095f0 <CONSOLE_STATUS+0x5e0>
    80007804:	00000097          	auipc	ra,0x0
    80007808:	5f4080e7          	jalr	1524(ra) # 80007df8 <initlock>
    8000780c:	01813083          	ld	ra,24(sp)
    80007810:	01013403          	ld	s0,16(sp)
    80007814:	0004ac23          	sw	zero,24(s1)
    80007818:	00813483          	ld	s1,8(sp)
    8000781c:	02010113          	addi	sp,sp,32
    80007820:	00008067          	ret

0000000080007824 <uartinit>:
    80007824:	ff010113          	addi	sp,sp,-16
    80007828:	00813423          	sd	s0,8(sp)
    8000782c:	01010413          	addi	s0,sp,16
    80007830:	100007b7          	lui	a5,0x10000
    80007834:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007838:	f8000713          	li	a4,-128
    8000783c:	00e781a3          	sb	a4,3(a5)
    80007840:	00300713          	li	a4,3
    80007844:	00e78023          	sb	a4,0(a5)
    80007848:	000780a3          	sb	zero,1(a5)
    8000784c:	00e781a3          	sb	a4,3(a5)
    80007850:	00700693          	li	a3,7
    80007854:	00d78123          	sb	a3,2(a5)
    80007858:	00e780a3          	sb	a4,1(a5)
    8000785c:	00813403          	ld	s0,8(sp)
    80007860:	01010113          	addi	sp,sp,16
    80007864:	00008067          	ret

0000000080007868 <uartputc>:
    80007868:	00004797          	auipc	a5,0x4
    8000786c:	1507a783          	lw	a5,336(a5) # 8000b9b8 <panicked>
    80007870:	00078463          	beqz	a5,80007878 <uartputc+0x10>
    80007874:	0000006f          	j	80007874 <uartputc+0xc>
    80007878:	fd010113          	addi	sp,sp,-48
    8000787c:	02813023          	sd	s0,32(sp)
    80007880:	00913c23          	sd	s1,24(sp)
    80007884:	01213823          	sd	s2,16(sp)
    80007888:	01313423          	sd	s3,8(sp)
    8000788c:	02113423          	sd	ra,40(sp)
    80007890:	03010413          	addi	s0,sp,48
    80007894:	00004917          	auipc	s2,0x4
    80007898:	12c90913          	addi	s2,s2,300 # 8000b9c0 <uart_tx_r>
    8000789c:	00093783          	ld	a5,0(s2)
    800078a0:	00004497          	auipc	s1,0x4
    800078a4:	12848493          	addi	s1,s1,296 # 8000b9c8 <uart_tx_w>
    800078a8:	0004b703          	ld	a4,0(s1)
    800078ac:	02078693          	addi	a3,a5,32
    800078b0:	00050993          	mv	s3,a0
    800078b4:	02e69c63          	bne	a3,a4,800078ec <uartputc+0x84>
    800078b8:	00001097          	auipc	ra,0x1
    800078bc:	834080e7          	jalr	-1996(ra) # 800080ec <push_on>
    800078c0:	00093783          	ld	a5,0(s2)
    800078c4:	0004b703          	ld	a4,0(s1)
    800078c8:	02078793          	addi	a5,a5,32
    800078cc:	00e79463          	bne	a5,a4,800078d4 <uartputc+0x6c>
    800078d0:	0000006f          	j	800078d0 <uartputc+0x68>
    800078d4:	00001097          	auipc	ra,0x1
    800078d8:	88c080e7          	jalr	-1908(ra) # 80008160 <pop_on>
    800078dc:	00093783          	ld	a5,0(s2)
    800078e0:	0004b703          	ld	a4,0(s1)
    800078e4:	02078693          	addi	a3,a5,32
    800078e8:	fce688e3          	beq	a3,a4,800078b8 <uartputc+0x50>
    800078ec:	01f77693          	andi	a3,a4,31
    800078f0:	00005597          	auipc	a1,0x5
    800078f4:	3e058593          	addi	a1,a1,992 # 8000ccd0 <uart_tx_buf>
    800078f8:	00d586b3          	add	a3,a1,a3
    800078fc:	00170713          	addi	a4,a4,1
    80007900:	01368023          	sb	s3,0(a3)
    80007904:	00e4b023          	sd	a4,0(s1)
    80007908:	10000637          	lui	a2,0x10000
    8000790c:	02f71063          	bne	a4,a5,8000792c <uartputc+0xc4>
    80007910:	0340006f          	j	80007944 <uartputc+0xdc>
    80007914:	00074703          	lbu	a4,0(a4)
    80007918:	00f93023          	sd	a5,0(s2)
    8000791c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007920:	00093783          	ld	a5,0(s2)
    80007924:	0004b703          	ld	a4,0(s1)
    80007928:	00f70e63          	beq	a4,a5,80007944 <uartputc+0xdc>
    8000792c:	00564683          	lbu	a3,5(a2)
    80007930:	01f7f713          	andi	a4,a5,31
    80007934:	00e58733          	add	a4,a1,a4
    80007938:	0206f693          	andi	a3,a3,32
    8000793c:	00178793          	addi	a5,a5,1
    80007940:	fc069ae3          	bnez	a3,80007914 <uartputc+0xac>
    80007944:	02813083          	ld	ra,40(sp)
    80007948:	02013403          	ld	s0,32(sp)
    8000794c:	01813483          	ld	s1,24(sp)
    80007950:	01013903          	ld	s2,16(sp)
    80007954:	00813983          	ld	s3,8(sp)
    80007958:	03010113          	addi	sp,sp,48
    8000795c:	00008067          	ret

0000000080007960 <uartputc_sync>:
    80007960:	ff010113          	addi	sp,sp,-16
    80007964:	00813423          	sd	s0,8(sp)
    80007968:	01010413          	addi	s0,sp,16
    8000796c:	00004717          	auipc	a4,0x4
    80007970:	04c72703          	lw	a4,76(a4) # 8000b9b8 <panicked>
    80007974:	02071663          	bnez	a4,800079a0 <uartputc_sync+0x40>
    80007978:	00050793          	mv	a5,a0
    8000797c:	100006b7          	lui	a3,0x10000
    80007980:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007984:	02077713          	andi	a4,a4,32
    80007988:	fe070ce3          	beqz	a4,80007980 <uartputc_sync+0x20>
    8000798c:	0ff7f793          	andi	a5,a5,255
    80007990:	00f68023          	sb	a5,0(a3)
    80007994:	00813403          	ld	s0,8(sp)
    80007998:	01010113          	addi	sp,sp,16
    8000799c:	00008067          	ret
    800079a0:	0000006f          	j	800079a0 <uartputc_sync+0x40>

00000000800079a4 <uartstart>:
    800079a4:	ff010113          	addi	sp,sp,-16
    800079a8:	00813423          	sd	s0,8(sp)
    800079ac:	01010413          	addi	s0,sp,16
    800079b0:	00004617          	auipc	a2,0x4
    800079b4:	01060613          	addi	a2,a2,16 # 8000b9c0 <uart_tx_r>
    800079b8:	00004517          	auipc	a0,0x4
    800079bc:	01050513          	addi	a0,a0,16 # 8000b9c8 <uart_tx_w>
    800079c0:	00063783          	ld	a5,0(a2)
    800079c4:	00053703          	ld	a4,0(a0)
    800079c8:	04f70263          	beq	a4,a5,80007a0c <uartstart+0x68>
    800079cc:	100005b7          	lui	a1,0x10000
    800079d0:	00005817          	auipc	a6,0x5
    800079d4:	30080813          	addi	a6,a6,768 # 8000ccd0 <uart_tx_buf>
    800079d8:	01c0006f          	j	800079f4 <uartstart+0x50>
    800079dc:	0006c703          	lbu	a4,0(a3)
    800079e0:	00f63023          	sd	a5,0(a2)
    800079e4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800079e8:	00063783          	ld	a5,0(a2)
    800079ec:	00053703          	ld	a4,0(a0)
    800079f0:	00f70e63          	beq	a4,a5,80007a0c <uartstart+0x68>
    800079f4:	01f7f713          	andi	a4,a5,31
    800079f8:	00e806b3          	add	a3,a6,a4
    800079fc:	0055c703          	lbu	a4,5(a1)
    80007a00:	00178793          	addi	a5,a5,1
    80007a04:	02077713          	andi	a4,a4,32
    80007a08:	fc071ae3          	bnez	a4,800079dc <uartstart+0x38>
    80007a0c:	00813403          	ld	s0,8(sp)
    80007a10:	01010113          	addi	sp,sp,16
    80007a14:	00008067          	ret

0000000080007a18 <uartgetc>:
    80007a18:	ff010113          	addi	sp,sp,-16
    80007a1c:	00813423          	sd	s0,8(sp)
    80007a20:	01010413          	addi	s0,sp,16
    80007a24:	10000737          	lui	a4,0x10000
    80007a28:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007a2c:	0017f793          	andi	a5,a5,1
    80007a30:	00078c63          	beqz	a5,80007a48 <uartgetc+0x30>
    80007a34:	00074503          	lbu	a0,0(a4)
    80007a38:	0ff57513          	andi	a0,a0,255
    80007a3c:	00813403          	ld	s0,8(sp)
    80007a40:	01010113          	addi	sp,sp,16
    80007a44:	00008067          	ret
    80007a48:	fff00513          	li	a0,-1
    80007a4c:	ff1ff06f          	j	80007a3c <uartgetc+0x24>

0000000080007a50 <uartintr>:
    80007a50:	100007b7          	lui	a5,0x10000
    80007a54:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007a58:	0017f793          	andi	a5,a5,1
    80007a5c:	0a078463          	beqz	a5,80007b04 <uartintr+0xb4>
    80007a60:	fe010113          	addi	sp,sp,-32
    80007a64:	00813823          	sd	s0,16(sp)
    80007a68:	00913423          	sd	s1,8(sp)
    80007a6c:	00113c23          	sd	ra,24(sp)
    80007a70:	02010413          	addi	s0,sp,32
    80007a74:	100004b7          	lui	s1,0x10000
    80007a78:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007a7c:	0ff57513          	andi	a0,a0,255
    80007a80:	fffff097          	auipc	ra,0xfffff
    80007a84:	534080e7          	jalr	1332(ra) # 80006fb4 <consoleintr>
    80007a88:	0054c783          	lbu	a5,5(s1)
    80007a8c:	0017f793          	andi	a5,a5,1
    80007a90:	fe0794e3          	bnez	a5,80007a78 <uartintr+0x28>
    80007a94:	00004617          	auipc	a2,0x4
    80007a98:	f2c60613          	addi	a2,a2,-212 # 8000b9c0 <uart_tx_r>
    80007a9c:	00004517          	auipc	a0,0x4
    80007aa0:	f2c50513          	addi	a0,a0,-212 # 8000b9c8 <uart_tx_w>
    80007aa4:	00063783          	ld	a5,0(a2)
    80007aa8:	00053703          	ld	a4,0(a0)
    80007aac:	04f70263          	beq	a4,a5,80007af0 <uartintr+0xa0>
    80007ab0:	100005b7          	lui	a1,0x10000
    80007ab4:	00005817          	auipc	a6,0x5
    80007ab8:	21c80813          	addi	a6,a6,540 # 8000ccd0 <uart_tx_buf>
    80007abc:	01c0006f          	j	80007ad8 <uartintr+0x88>
    80007ac0:	0006c703          	lbu	a4,0(a3)
    80007ac4:	00f63023          	sd	a5,0(a2)
    80007ac8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007acc:	00063783          	ld	a5,0(a2)
    80007ad0:	00053703          	ld	a4,0(a0)
    80007ad4:	00f70e63          	beq	a4,a5,80007af0 <uartintr+0xa0>
    80007ad8:	01f7f713          	andi	a4,a5,31
    80007adc:	00e806b3          	add	a3,a6,a4
    80007ae0:	0055c703          	lbu	a4,5(a1)
    80007ae4:	00178793          	addi	a5,a5,1
    80007ae8:	02077713          	andi	a4,a4,32
    80007aec:	fc071ae3          	bnez	a4,80007ac0 <uartintr+0x70>
    80007af0:	01813083          	ld	ra,24(sp)
    80007af4:	01013403          	ld	s0,16(sp)
    80007af8:	00813483          	ld	s1,8(sp)
    80007afc:	02010113          	addi	sp,sp,32
    80007b00:	00008067          	ret
    80007b04:	00004617          	auipc	a2,0x4
    80007b08:	ebc60613          	addi	a2,a2,-324 # 8000b9c0 <uart_tx_r>
    80007b0c:	00004517          	auipc	a0,0x4
    80007b10:	ebc50513          	addi	a0,a0,-324 # 8000b9c8 <uart_tx_w>
    80007b14:	00063783          	ld	a5,0(a2)
    80007b18:	00053703          	ld	a4,0(a0)
    80007b1c:	04f70263          	beq	a4,a5,80007b60 <uartintr+0x110>
    80007b20:	100005b7          	lui	a1,0x10000
    80007b24:	00005817          	auipc	a6,0x5
    80007b28:	1ac80813          	addi	a6,a6,428 # 8000ccd0 <uart_tx_buf>
    80007b2c:	01c0006f          	j	80007b48 <uartintr+0xf8>
    80007b30:	0006c703          	lbu	a4,0(a3)
    80007b34:	00f63023          	sd	a5,0(a2)
    80007b38:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007b3c:	00063783          	ld	a5,0(a2)
    80007b40:	00053703          	ld	a4,0(a0)
    80007b44:	02f70063          	beq	a4,a5,80007b64 <uartintr+0x114>
    80007b48:	01f7f713          	andi	a4,a5,31
    80007b4c:	00e806b3          	add	a3,a6,a4
    80007b50:	0055c703          	lbu	a4,5(a1)
    80007b54:	00178793          	addi	a5,a5,1
    80007b58:	02077713          	andi	a4,a4,32
    80007b5c:	fc071ae3          	bnez	a4,80007b30 <uartintr+0xe0>
    80007b60:	00008067          	ret
    80007b64:	00008067          	ret

0000000080007b68 <kinit>:
    80007b68:	fc010113          	addi	sp,sp,-64
    80007b6c:	02913423          	sd	s1,40(sp)
    80007b70:	fffff7b7          	lui	a5,0xfffff
    80007b74:	00006497          	auipc	s1,0x6
    80007b78:	17b48493          	addi	s1,s1,379 # 8000dcef <end+0xfff>
    80007b7c:	02813823          	sd	s0,48(sp)
    80007b80:	01313c23          	sd	s3,24(sp)
    80007b84:	00f4f4b3          	and	s1,s1,a5
    80007b88:	02113c23          	sd	ra,56(sp)
    80007b8c:	03213023          	sd	s2,32(sp)
    80007b90:	01413823          	sd	s4,16(sp)
    80007b94:	01513423          	sd	s5,8(sp)
    80007b98:	04010413          	addi	s0,sp,64
    80007b9c:	000017b7          	lui	a5,0x1
    80007ba0:	01100993          	li	s3,17
    80007ba4:	00f487b3          	add	a5,s1,a5
    80007ba8:	01b99993          	slli	s3,s3,0x1b
    80007bac:	06f9e063          	bltu	s3,a5,80007c0c <kinit+0xa4>
    80007bb0:	00005a97          	auipc	s5,0x5
    80007bb4:	140a8a93          	addi	s5,s5,320 # 8000ccf0 <end>
    80007bb8:	0754ec63          	bltu	s1,s5,80007c30 <kinit+0xc8>
    80007bbc:	0734fa63          	bgeu	s1,s3,80007c30 <kinit+0xc8>
    80007bc0:	00088a37          	lui	s4,0x88
    80007bc4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007bc8:	00004917          	auipc	s2,0x4
    80007bcc:	e0890913          	addi	s2,s2,-504 # 8000b9d0 <kmem>
    80007bd0:	00ca1a13          	slli	s4,s4,0xc
    80007bd4:	0140006f          	j	80007be8 <kinit+0x80>
    80007bd8:	000017b7          	lui	a5,0x1
    80007bdc:	00f484b3          	add	s1,s1,a5
    80007be0:	0554e863          	bltu	s1,s5,80007c30 <kinit+0xc8>
    80007be4:	0534f663          	bgeu	s1,s3,80007c30 <kinit+0xc8>
    80007be8:	00001637          	lui	a2,0x1
    80007bec:	00100593          	li	a1,1
    80007bf0:	00048513          	mv	a0,s1
    80007bf4:	00000097          	auipc	ra,0x0
    80007bf8:	5e4080e7          	jalr	1508(ra) # 800081d8 <__memset>
    80007bfc:	00093783          	ld	a5,0(s2)
    80007c00:	00f4b023          	sd	a5,0(s1)
    80007c04:	00993023          	sd	s1,0(s2)
    80007c08:	fd4498e3          	bne	s1,s4,80007bd8 <kinit+0x70>
    80007c0c:	03813083          	ld	ra,56(sp)
    80007c10:	03013403          	ld	s0,48(sp)
    80007c14:	02813483          	ld	s1,40(sp)
    80007c18:	02013903          	ld	s2,32(sp)
    80007c1c:	01813983          	ld	s3,24(sp)
    80007c20:	01013a03          	ld	s4,16(sp)
    80007c24:	00813a83          	ld	s5,8(sp)
    80007c28:	04010113          	addi	sp,sp,64
    80007c2c:	00008067          	ret
    80007c30:	00002517          	auipc	a0,0x2
    80007c34:	9e050513          	addi	a0,a0,-1568 # 80009610 <digits+0x18>
    80007c38:	fffff097          	auipc	ra,0xfffff
    80007c3c:	4b4080e7          	jalr	1204(ra) # 800070ec <panic>

0000000080007c40 <freerange>:
    80007c40:	fc010113          	addi	sp,sp,-64
    80007c44:	000017b7          	lui	a5,0x1
    80007c48:	02913423          	sd	s1,40(sp)
    80007c4c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007c50:	009504b3          	add	s1,a0,s1
    80007c54:	fffff537          	lui	a0,0xfffff
    80007c58:	02813823          	sd	s0,48(sp)
    80007c5c:	02113c23          	sd	ra,56(sp)
    80007c60:	03213023          	sd	s2,32(sp)
    80007c64:	01313c23          	sd	s3,24(sp)
    80007c68:	01413823          	sd	s4,16(sp)
    80007c6c:	01513423          	sd	s5,8(sp)
    80007c70:	01613023          	sd	s6,0(sp)
    80007c74:	04010413          	addi	s0,sp,64
    80007c78:	00a4f4b3          	and	s1,s1,a0
    80007c7c:	00f487b3          	add	a5,s1,a5
    80007c80:	06f5e463          	bltu	a1,a5,80007ce8 <freerange+0xa8>
    80007c84:	00005a97          	auipc	s5,0x5
    80007c88:	06ca8a93          	addi	s5,s5,108 # 8000ccf0 <end>
    80007c8c:	0954e263          	bltu	s1,s5,80007d10 <freerange+0xd0>
    80007c90:	01100993          	li	s3,17
    80007c94:	01b99993          	slli	s3,s3,0x1b
    80007c98:	0734fc63          	bgeu	s1,s3,80007d10 <freerange+0xd0>
    80007c9c:	00058a13          	mv	s4,a1
    80007ca0:	00004917          	auipc	s2,0x4
    80007ca4:	d3090913          	addi	s2,s2,-720 # 8000b9d0 <kmem>
    80007ca8:	00002b37          	lui	s6,0x2
    80007cac:	0140006f          	j	80007cc0 <freerange+0x80>
    80007cb0:	000017b7          	lui	a5,0x1
    80007cb4:	00f484b3          	add	s1,s1,a5
    80007cb8:	0554ec63          	bltu	s1,s5,80007d10 <freerange+0xd0>
    80007cbc:	0534fa63          	bgeu	s1,s3,80007d10 <freerange+0xd0>
    80007cc0:	00001637          	lui	a2,0x1
    80007cc4:	00100593          	li	a1,1
    80007cc8:	00048513          	mv	a0,s1
    80007ccc:	00000097          	auipc	ra,0x0
    80007cd0:	50c080e7          	jalr	1292(ra) # 800081d8 <__memset>
    80007cd4:	00093703          	ld	a4,0(s2)
    80007cd8:	016487b3          	add	a5,s1,s6
    80007cdc:	00e4b023          	sd	a4,0(s1)
    80007ce0:	00993023          	sd	s1,0(s2)
    80007ce4:	fcfa76e3          	bgeu	s4,a5,80007cb0 <freerange+0x70>
    80007ce8:	03813083          	ld	ra,56(sp)
    80007cec:	03013403          	ld	s0,48(sp)
    80007cf0:	02813483          	ld	s1,40(sp)
    80007cf4:	02013903          	ld	s2,32(sp)
    80007cf8:	01813983          	ld	s3,24(sp)
    80007cfc:	01013a03          	ld	s4,16(sp)
    80007d00:	00813a83          	ld	s5,8(sp)
    80007d04:	00013b03          	ld	s6,0(sp)
    80007d08:	04010113          	addi	sp,sp,64
    80007d0c:	00008067          	ret
    80007d10:	00002517          	auipc	a0,0x2
    80007d14:	90050513          	addi	a0,a0,-1792 # 80009610 <digits+0x18>
    80007d18:	fffff097          	auipc	ra,0xfffff
    80007d1c:	3d4080e7          	jalr	980(ra) # 800070ec <panic>

0000000080007d20 <kfree>:
    80007d20:	fe010113          	addi	sp,sp,-32
    80007d24:	00813823          	sd	s0,16(sp)
    80007d28:	00113c23          	sd	ra,24(sp)
    80007d2c:	00913423          	sd	s1,8(sp)
    80007d30:	02010413          	addi	s0,sp,32
    80007d34:	03451793          	slli	a5,a0,0x34
    80007d38:	04079c63          	bnez	a5,80007d90 <kfree+0x70>
    80007d3c:	00005797          	auipc	a5,0x5
    80007d40:	fb478793          	addi	a5,a5,-76 # 8000ccf0 <end>
    80007d44:	00050493          	mv	s1,a0
    80007d48:	04f56463          	bltu	a0,a5,80007d90 <kfree+0x70>
    80007d4c:	01100793          	li	a5,17
    80007d50:	01b79793          	slli	a5,a5,0x1b
    80007d54:	02f57e63          	bgeu	a0,a5,80007d90 <kfree+0x70>
    80007d58:	00001637          	lui	a2,0x1
    80007d5c:	00100593          	li	a1,1
    80007d60:	00000097          	auipc	ra,0x0
    80007d64:	478080e7          	jalr	1144(ra) # 800081d8 <__memset>
    80007d68:	00004797          	auipc	a5,0x4
    80007d6c:	c6878793          	addi	a5,a5,-920 # 8000b9d0 <kmem>
    80007d70:	0007b703          	ld	a4,0(a5)
    80007d74:	01813083          	ld	ra,24(sp)
    80007d78:	01013403          	ld	s0,16(sp)
    80007d7c:	00e4b023          	sd	a4,0(s1)
    80007d80:	0097b023          	sd	s1,0(a5)
    80007d84:	00813483          	ld	s1,8(sp)
    80007d88:	02010113          	addi	sp,sp,32
    80007d8c:	00008067          	ret
    80007d90:	00002517          	auipc	a0,0x2
    80007d94:	88050513          	addi	a0,a0,-1920 # 80009610 <digits+0x18>
    80007d98:	fffff097          	auipc	ra,0xfffff
    80007d9c:	354080e7          	jalr	852(ra) # 800070ec <panic>

0000000080007da0 <kalloc>:
    80007da0:	fe010113          	addi	sp,sp,-32
    80007da4:	00813823          	sd	s0,16(sp)
    80007da8:	00913423          	sd	s1,8(sp)
    80007dac:	00113c23          	sd	ra,24(sp)
    80007db0:	02010413          	addi	s0,sp,32
    80007db4:	00004797          	auipc	a5,0x4
    80007db8:	c1c78793          	addi	a5,a5,-996 # 8000b9d0 <kmem>
    80007dbc:	0007b483          	ld	s1,0(a5)
    80007dc0:	02048063          	beqz	s1,80007de0 <kalloc+0x40>
    80007dc4:	0004b703          	ld	a4,0(s1)
    80007dc8:	00001637          	lui	a2,0x1
    80007dcc:	00500593          	li	a1,5
    80007dd0:	00048513          	mv	a0,s1
    80007dd4:	00e7b023          	sd	a4,0(a5)
    80007dd8:	00000097          	auipc	ra,0x0
    80007ddc:	400080e7          	jalr	1024(ra) # 800081d8 <__memset>
    80007de0:	01813083          	ld	ra,24(sp)
    80007de4:	01013403          	ld	s0,16(sp)
    80007de8:	00048513          	mv	a0,s1
    80007dec:	00813483          	ld	s1,8(sp)
    80007df0:	02010113          	addi	sp,sp,32
    80007df4:	00008067          	ret

0000000080007df8 <initlock>:
    80007df8:	ff010113          	addi	sp,sp,-16
    80007dfc:	00813423          	sd	s0,8(sp)
    80007e00:	01010413          	addi	s0,sp,16
    80007e04:	00813403          	ld	s0,8(sp)
    80007e08:	00b53423          	sd	a1,8(a0)
    80007e0c:	00052023          	sw	zero,0(a0)
    80007e10:	00053823          	sd	zero,16(a0)
    80007e14:	01010113          	addi	sp,sp,16
    80007e18:	00008067          	ret

0000000080007e1c <acquire>:
    80007e1c:	fe010113          	addi	sp,sp,-32
    80007e20:	00813823          	sd	s0,16(sp)
    80007e24:	00913423          	sd	s1,8(sp)
    80007e28:	00113c23          	sd	ra,24(sp)
    80007e2c:	01213023          	sd	s2,0(sp)
    80007e30:	02010413          	addi	s0,sp,32
    80007e34:	00050493          	mv	s1,a0
    80007e38:	10002973          	csrr	s2,sstatus
    80007e3c:	100027f3          	csrr	a5,sstatus
    80007e40:	ffd7f793          	andi	a5,a5,-3
    80007e44:	10079073          	csrw	sstatus,a5
    80007e48:	fffff097          	auipc	ra,0xfffff
    80007e4c:	8e4080e7          	jalr	-1820(ra) # 8000672c <mycpu>
    80007e50:	07852783          	lw	a5,120(a0)
    80007e54:	06078e63          	beqz	a5,80007ed0 <acquire+0xb4>
    80007e58:	fffff097          	auipc	ra,0xfffff
    80007e5c:	8d4080e7          	jalr	-1836(ra) # 8000672c <mycpu>
    80007e60:	07852783          	lw	a5,120(a0)
    80007e64:	0004a703          	lw	a4,0(s1)
    80007e68:	0017879b          	addiw	a5,a5,1
    80007e6c:	06f52c23          	sw	a5,120(a0)
    80007e70:	04071063          	bnez	a4,80007eb0 <acquire+0x94>
    80007e74:	00100713          	li	a4,1
    80007e78:	00070793          	mv	a5,a4
    80007e7c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007e80:	0007879b          	sext.w	a5,a5
    80007e84:	fe079ae3          	bnez	a5,80007e78 <acquire+0x5c>
    80007e88:	0ff0000f          	fence
    80007e8c:	fffff097          	auipc	ra,0xfffff
    80007e90:	8a0080e7          	jalr	-1888(ra) # 8000672c <mycpu>
    80007e94:	01813083          	ld	ra,24(sp)
    80007e98:	01013403          	ld	s0,16(sp)
    80007e9c:	00a4b823          	sd	a0,16(s1)
    80007ea0:	00013903          	ld	s2,0(sp)
    80007ea4:	00813483          	ld	s1,8(sp)
    80007ea8:	02010113          	addi	sp,sp,32
    80007eac:	00008067          	ret
    80007eb0:	0104b903          	ld	s2,16(s1)
    80007eb4:	fffff097          	auipc	ra,0xfffff
    80007eb8:	878080e7          	jalr	-1928(ra) # 8000672c <mycpu>
    80007ebc:	faa91ce3          	bne	s2,a0,80007e74 <acquire+0x58>
    80007ec0:	00001517          	auipc	a0,0x1
    80007ec4:	75850513          	addi	a0,a0,1880 # 80009618 <digits+0x20>
    80007ec8:	fffff097          	auipc	ra,0xfffff
    80007ecc:	224080e7          	jalr	548(ra) # 800070ec <panic>
    80007ed0:	00195913          	srli	s2,s2,0x1
    80007ed4:	fffff097          	auipc	ra,0xfffff
    80007ed8:	858080e7          	jalr	-1960(ra) # 8000672c <mycpu>
    80007edc:	00197913          	andi	s2,s2,1
    80007ee0:	07252e23          	sw	s2,124(a0)
    80007ee4:	f75ff06f          	j	80007e58 <acquire+0x3c>

0000000080007ee8 <release>:
    80007ee8:	fe010113          	addi	sp,sp,-32
    80007eec:	00813823          	sd	s0,16(sp)
    80007ef0:	00113c23          	sd	ra,24(sp)
    80007ef4:	00913423          	sd	s1,8(sp)
    80007ef8:	01213023          	sd	s2,0(sp)
    80007efc:	02010413          	addi	s0,sp,32
    80007f00:	00052783          	lw	a5,0(a0)
    80007f04:	00079a63          	bnez	a5,80007f18 <release+0x30>
    80007f08:	00001517          	auipc	a0,0x1
    80007f0c:	71850513          	addi	a0,a0,1816 # 80009620 <digits+0x28>
    80007f10:	fffff097          	auipc	ra,0xfffff
    80007f14:	1dc080e7          	jalr	476(ra) # 800070ec <panic>
    80007f18:	01053903          	ld	s2,16(a0)
    80007f1c:	00050493          	mv	s1,a0
    80007f20:	fffff097          	auipc	ra,0xfffff
    80007f24:	80c080e7          	jalr	-2036(ra) # 8000672c <mycpu>
    80007f28:	fea910e3          	bne	s2,a0,80007f08 <release+0x20>
    80007f2c:	0004b823          	sd	zero,16(s1)
    80007f30:	0ff0000f          	fence
    80007f34:	0f50000f          	fence	iorw,ow
    80007f38:	0804a02f          	amoswap.w	zero,zero,(s1)
    80007f3c:	ffffe097          	auipc	ra,0xffffe
    80007f40:	7f0080e7          	jalr	2032(ra) # 8000672c <mycpu>
    80007f44:	100027f3          	csrr	a5,sstatus
    80007f48:	0027f793          	andi	a5,a5,2
    80007f4c:	04079a63          	bnez	a5,80007fa0 <release+0xb8>
    80007f50:	07852783          	lw	a5,120(a0)
    80007f54:	02f05e63          	blez	a5,80007f90 <release+0xa8>
    80007f58:	fff7871b          	addiw	a4,a5,-1
    80007f5c:	06e52c23          	sw	a4,120(a0)
    80007f60:	00071c63          	bnez	a4,80007f78 <release+0x90>
    80007f64:	07c52783          	lw	a5,124(a0)
    80007f68:	00078863          	beqz	a5,80007f78 <release+0x90>
    80007f6c:	100027f3          	csrr	a5,sstatus
    80007f70:	0027e793          	ori	a5,a5,2
    80007f74:	10079073          	csrw	sstatus,a5
    80007f78:	01813083          	ld	ra,24(sp)
    80007f7c:	01013403          	ld	s0,16(sp)
    80007f80:	00813483          	ld	s1,8(sp)
    80007f84:	00013903          	ld	s2,0(sp)
    80007f88:	02010113          	addi	sp,sp,32
    80007f8c:	00008067          	ret
    80007f90:	00001517          	auipc	a0,0x1
    80007f94:	6b050513          	addi	a0,a0,1712 # 80009640 <digits+0x48>
    80007f98:	fffff097          	auipc	ra,0xfffff
    80007f9c:	154080e7          	jalr	340(ra) # 800070ec <panic>
    80007fa0:	00001517          	auipc	a0,0x1
    80007fa4:	68850513          	addi	a0,a0,1672 # 80009628 <digits+0x30>
    80007fa8:	fffff097          	auipc	ra,0xfffff
    80007fac:	144080e7          	jalr	324(ra) # 800070ec <panic>

0000000080007fb0 <holding>:
    80007fb0:	00052783          	lw	a5,0(a0)
    80007fb4:	00079663          	bnez	a5,80007fc0 <holding+0x10>
    80007fb8:	00000513          	li	a0,0
    80007fbc:	00008067          	ret
    80007fc0:	fe010113          	addi	sp,sp,-32
    80007fc4:	00813823          	sd	s0,16(sp)
    80007fc8:	00913423          	sd	s1,8(sp)
    80007fcc:	00113c23          	sd	ra,24(sp)
    80007fd0:	02010413          	addi	s0,sp,32
    80007fd4:	01053483          	ld	s1,16(a0)
    80007fd8:	ffffe097          	auipc	ra,0xffffe
    80007fdc:	754080e7          	jalr	1876(ra) # 8000672c <mycpu>
    80007fe0:	01813083          	ld	ra,24(sp)
    80007fe4:	01013403          	ld	s0,16(sp)
    80007fe8:	40a48533          	sub	a0,s1,a0
    80007fec:	00153513          	seqz	a0,a0
    80007ff0:	00813483          	ld	s1,8(sp)
    80007ff4:	02010113          	addi	sp,sp,32
    80007ff8:	00008067          	ret

0000000080007ffc <push_off>:
    80007ffc:	fe010113          	addi	sp,sp,-32
    80008000:	00813823          	sd	s0,16(sp)
    80008004:	00113c23          	sd	ra,24(sp)
    80008008:	00913423          	sd	s1,8(sp)
    8000800c:	02010413          	addi	s0,sp,32
    80008010:	100024f3          	csrr	s1,sstatus
    80008014:	100027f3          	csrr	a5,sstatus
    80008018:	ffd7f793          	andi	a5,a5,-3
    8000801c:	10079073          	csrw	sstatus,a5
    80008020:	ffffe097          	auipc	ra,0xffffe
    80008024:	70c080e7          	jalr	1804(ra) # 8000672c <mycpu>
    80008028:	07852783          	lw	a5,120(a0)
    8000802c:	02078663          	beqz	a5,80008058 <push_off+0x5c>
    80008030:	ffffe097          	auipc	ra,0xffffe
    80008034:	6fc080e7          	jalr	1788(ra) # 8000672c <mycpu>
    80008038:	07852783          	lw	a5,120(a0)
    8000803c:	01813083          	ld	ra,24(sp)
    80008040:	01013403          	ld	s0,16(sp)
    80008044:	0017879b          	addiw	a5,a5,1
    80008048:	06f52c23          	sw	a5,120(a0)
    8000804c:	00813483          	ld	s1,8(sp)
    80008050:	02010113          	addi	sp,sp,32
    80008054:	00008067          	ret
    80008058:	0014d493          	srli	s1,s1,0x1
    8000805c:	ffffe097          	auipc	ra,0xffffe
    80008060:	6d0080e7          	jalr	1744(ra) # 8000672c <mycpu>
    80008064:	0014f493          	andi	s1,s1,1
    80008068:	06952e23          	sw	s1,124(a0)
    8000806c:	fc5ff06f          	j	80008030 <push_off+0x34>

0000000080008070 <pop_off>:
    80008070:	ff010113          	addi	sp,sp,-16
    80008074:	00813023          	sd	s0,0(sp)
    80008078:	00113423          	sd	ra,8(sp)
    8000807c:	01010413          	addi	s0,sp,16
    80008080:	ffffe097          	auipc	ra,0xffffe
    80008084:	6ac080e7          	jalr	1708(ra) # 8000672c <mycpu>
    80008088:	100027f3          	csrr	a5,sstatus
    8000808c:	0027f793          	andi	a5,a5,2
    80008090:	04079663          	bnez	a5,800080dc <pop_off+0x6c>
    80008094:	07852783          	lw	a5,120(a0)
    80008098:	02f05a63          	blez	a5,800080cc <pop_off+0x5c>
    8000809c:	fff7871b          	addiw	a4,a5,-1
    800080a0:	06e52c23          	sw	a4,120(a0)
    800080a4:	00071c63          	bnez	a4,800080bc <pop_off+0x4c>
    800080a8:	07c52783          	lw	a5,124(a0)
    800080ac:	00078863          	beqz	a5,800080bc <pop_off+0x4c>
    800080b0:	100027f3          	csrr	a5,sstatus
    800080b4:	0027e793          	ori	a5,a5,2
    800080b8:	10079073          	csrw	sstatus,a5
    800080bc:	00813083          	ld	ra,8(sp)
    800080c0:	00013403          	ld	s0,0(sp)
    800080c4:	01010113          	addi	sp,sp,16
    800080c8:	00008067          	ret
    800080cc:	00001517          	auipc	a0,0x1
    800080d0:	57450513          	addi	a0,a0,1396 # 80009640 <digits+0x48>
    800080d4:	fffff097          	auipc	ra,0xfffff
    800080d8:	018080e7          	jalr	24(ra) # 800070ec <panic>
    800080dc:	00001517          	auipc	a0,0x1
    800080e0:	54c50513          	addi	a0,a0,1356 # 80009628 <digits+0x30>
    800080e4:	fffff097          	auipc	ra,0xfffff
    800080e8:	008080e7          	jalr	8(ra) # 800070ec <panic>

00000000800080ec <push_on>:
    800080ec:	fe010113          	addi	sp,sp,-32
    800080f0:	00813823          	sd	s0,16(sp)
    800080f4:	00113c23          	sd	ra,24(sp)
    800080f8:	00913423          	sd	s1,8(sp)
    800080fc:	02010413          	addi	s0,sp,32
    80008100:	100024f3          	csrr	s1,sstatus
    80008104:	100027f3          	csrr	a5,sstatus
    80008108:	0027e793          	ori	a5,a5,2
    8000810c:	10079073          	csrw	sstatus,a5
    80008110:	ffffe097          	auipc	ra,0xffffe
    80008114:	61c080e7          	jalr	1564(ra) # 8000672c <mycpu>
    80008118:	07852783          	lw	a5,120(a0)
    8000811c:	02078663          	beqz	a5,80008148 <push_on+0x5c>
    80008120:	ffffe097          	auipc	ra,0xffffe
    80008124:	60c080e7          	jalr	1548(ra) # 8000672c <mycpu>
    80008128:	07852783          	lw	a5,120(a0)
    8000812c:	01813083          	ld	ra,24(sp)
    80008130:	01013403          	ld	s0,16(sp)
    80008134:	0017879b          	addiw	a5,a5,1
    80008138:	06f52c23          	sw	a5,120(a0)
    8000813c:	00813483          	ld	s1,8(sp)
    80008140:	02010113          	addi	sp,sp,32
    80008144:	00008067          	ret
    80008148:	0014d493          	srli	s1,s1,0x1
    8000814c:	ffffe097          	auipc	ra,0xffffe
    80008150:	5e0080e7          	jalr	1504(ra) # 8000672c <mycpu>
    80008154:	0014f493          	andi	s1,s1,1
    80008158:	06952e23          	sw	s1,124(a0)
    8000815c:	fc5ff06f          	j	80008120 <push_on+0x34>

0000000080008160 <pop_on>:
    80008160:	ff010113          	addi	sp,sp,-16
    80008164:	00813023          	sd	s0,0(sp)
    80008168:	00113423          	sd	ra,8(sp)
    8000816c:	01010413          	addi	s0,sp,16
    80008170:	ffffe097          	auipc	ra,0xffffe
    80008174:	5bc080e7          	jalr	1468(ra) # 8000672c <mycpu>
    80008178:	100027f3          	csrr	a5,sstatus
    8000817c:	0027f793          	andi	a5,a5,2
    80008180:	04078463          	beqz	a5,800081c8 <pop_on+0x68>
    80008184:	07852783          	lw	a5,120(a0)
    80008188:	02f05863          	blez	a5,800081b8 <pop_on+0x58>
    8000818c:	fff7879b          	addiw	a5,a5,-1
    80008190:	06f52c23          	sw	a5,120(a0)
    80008194:	07853783          	ld	a5,120(a0)
    80008198:	00079863          	bnez	a5,800081a8 <pop_on+0x48>
    8000819c:	100027f3          	csrr	a5,sstatus
    800081a0:	ffd7f793          	andi	a5,a5,-3
    800081a4:	10079073          	csrw	sstatus,a5
    800081a8:	00813083          	ld	ra,8(sp)
    800081ac:	00013403          	ld	s0,0(sp)
    800081b0:	01010113          	addi	sp,sp,16
    800081b4:	00008067          	ret
    800081b8:	00001517          	auipc	a0,0x1
    800081bc:	4b050513          	addi	a0,a0,1200 # 80009668 <digits+0x70>
    800081c0:	fffff097          	auipc	ra,0xfffff
    800081c4:	f2c080e7          	jalr	-212(ra) # 800070ec <panic>
    800081c8:	00001517          	auipc	a0,0x1
    800081cc:	48050513          	addi	a0,a0,1152 # 80009648 <digits+0x50>
    800081d0:	fffff097          	auipc	ra,0xfffff
    800081d4:	f1c080e7          	jalr	-228(ra) # 800070ec <panic>

00000000800081d8 <__memset>:
    800081d8:	ff010113          	addi	sp,sp,-16
    800081dc:	00813423          	sd	s0,8(sp)
    800081e0:	01010413          	addi	s0,sp,16
    800081e4:	1a060e63          	beqz	a2,800083a0 <__memset+0x1c8>
    800081e8:	40a007b3          	neg	a5,a0
    800081ec:	0077f793          	andi	a5,a5,7
    800081f0:	00778693          	addi	a3,a5,7
    800081f4:	00b00813          	li	a6,11
    800081f8:	0ff5f593          	andi	a1,a1,255
    800081fc:	fff6071b          	addiw	a4,a2,-1
    80008200:	1b06e663          	bltu	a3,a6,800083ac <__memset+0x1d4>
    80008204:	1cd76463          	bltu	a4,a3,800083cc <__memset+0x1f4>
    80008208:	1a078e63          	beqz	a5,800083c4 <__memset+0x1ec>
    8000820c:	00b50023          	sb	a1,0(a0)
    80008210:	00100713          	li	a4,1
    80008214:	1ae78463          	beq	a5,a4,800083bc <__memset+0x1e4>
    80008218:	00b500a3          	sb	a1,1(a0)
    8000821c:	00200713          	li	a4,2
    80008220:	1ae78a63          	beq	a5,a4,800083d4 <__memset+0x1fc>
    80008224:	00b50123          	sb	a1,2(a0)
    80008228:	00300713          	li	a4,3
    8000822c:	18e78463          	beq	a5,a4,800083b4 <__memset+0x1dc>
    80008230:	00b501a3          	sb	a1,3(a0)
    80008234:	00400713          	li	a4,4
    80008238:	1ae78263          	beq	a5,a4,800083dc <__memset+0x204>
    8000823c:	00b50223          	sb	a1,4(a0)
    80008240:	00500713          	li	a4,5
    80008244:	1ae78063          	beq	a5,a4,800083e4 <__memset+0x20c>
    80008248:	00b502a3          	sb	a1,5(a0)
    8000824c:	00700713          	li	a4,7
    80008250:	18e79e63          	bne	a5,a4,800083ec <__memset+0x214>
    80008254:	00b50323          	sb	a1,6(a0)
    80008258:	00700e93          	li	t4,7
    8000825c:	00859713          	slli	a4,a1,0x8
    80008260:	00e5e733          	or	a4,a1,a4
    80008264:	01059e13          	slli	t3,a1,0x10
    80008268:	01c76e33          	or	t3,a4,t3
    8000826c:	01859313          	slli	t1,a1,0x18
    80008270:	006e6333          	or	t1,t3,t1
    80008274:	02059893          	slli	a7,a1,0x20
    80008278:	40f60e3b          	subw	t3,a2,a5
    8000827c:	011368b3          	or	a7,t1,a7
    80008280:	02859813          	slli	a6,a1,0x28
    80008284:	0108e833          	or	a6,a7,a6
    80008288:	03059693          	slli	a3,a1,0x30
    8000828c:	003e589b          	srliw	a7,t3,0x3
    80008290:	00d866b3          	or	a3,a6,a3
    80008294:	03859713          	slli	a4,a1,0x38
    80008298:	00389813          	slli	a6,a7,0x3
    8000829c:	00f507b3          	add	a5,a0,a5
    800082a0:	00e6e733          	or	a4,a3,a4
    800082a4:	000e089b          	sext.w	a7,t3
    800082a8:	00f806b3          	add	a3,a6,a5
    800082ac:	00e7b023          	sd	a4,0(a5)
    800082b0:	00878793          	addi	a5,a5,8
    800082b4:	fed79ce3          	bne	a5,a3,800082ac <__memset+0xd4>
    800082b8:	ff8e7793          	andi	a5,t3,-8
    800082bc:	0007871b          	sext.w	a4,a5
    800082c0:	01d787bb          	addw	a5,a5,t4
    800082c4:	0ce88e63          	beq	a7,a4,800083a0 <__memset+0x1c8>
    800082c8:	00f50733          	add	a4,a0,a5
    800082cc:	00b70023          	sb	a1,0(a4)
    800082d0:	0017871b          	addiw	a4,a5,1
    800082d4:	0cc77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    800082d8:	00e50733          	add	a4,a0,a4
    800082dc:	00b70023          	sb	a1,0(a4)
    800082e0:	0027871b          	addiw	a4,a5,2
    800082e4:	0ac77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    800082e8:	00e50733          	add	a4,a0,a4
    800082ec:	00b70023          	sb	a1,0(a4)
    800082f0:	0037871b          	addiw	a4,a5,3
    800082f4:	0ac77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    800082f8:	00e50733          	add	a4,a0,a4
    800082fc:	00b70023          	sb	a1,0(a4)
    80008300:	0047871b          	addiw	a4,a5,4
    80008304:	08c77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008308:	00e50733          	add	a4,a0,a4
    8000830c:	00b70023          	sb	a1,0(a4)
    80008310:	0057871b          	addiw	a4,a5,5
    80008314:	08c77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008318:	00e50733          	add	a4,a0,a4
    8000831c:	00b70023          	sb	a1,0(a4)
    80008320:	0067871b          	addiw	a4,a5,6
    80008324:	06c77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008328:	00e50733          	add	a4,a0,a4
    8000832c:	00b70023          	sb	a1,0(a4)
    80008330:	0077871b          	addiw	a4,a5,7
    80008334:	06c77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008338:	00e50733          	add	a4,a0,a4
    8000833c:	00b70023          	sb	a1,0(a4)
    80008340:	0087871b          	addiw	a4,a5,8
    80008344:	04c77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008348:	00e50733          	add	a4,a0,a4
    8000834c:	00b70023          	sb	a1,0(a4)
    80008350:	0097871b          	addiw	a4,a5,9
    80008354:	04c77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008358:	00e50733          	add	a4,a0,a4
    8000835c:	00b70023          	sb	a1,0(a4)
    80008360:	00a7871b          	addiw	a4,a5,10
    80008364:	02c77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008368:	00e50733          	add	a4,a0,a4
    8000836c:	00b70023          	sb	a1,0(a4)
    80008370:	00b7871b          	addiw	a4,a5,11
    80008374:	02c77663          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008378:	00e50733          	add	a4,a0,a4
    8000837c:	00b70023          	sb	a1,0(a4)
    80008380:	00c7871b          	addiw	a4,a5,12
    80008384:	00c77e63          	bgeu	a4,a2,800083a0 <__memset+0x1c8>
    80008388:	00e50733          	add	a4,a0,a4
    8000838c:	00b70023          	sb	a1,0(a4)
    80008390:	00d7879b          	addiw	a5,a5,13
    80008394:	00c7f663          	bgeu	a5,a2,800083a0 <__memset+0x1c8>
    80008398:	00f507b3          	add	a5,a0,a5
    8000839c:	00b78023          	sb	a1,0(a5)
    800083a0:	00813403          	ld	s0,8(sp)
    800083a4:	01010113          	addi	sp,sp,16
    800083a8:	00008067          	ret
    800083ac:	00b00693          	li	a3,11
    800083b0:	e55ff06f          	j	80008204 <__memset+0x2c>
    800083b4:	00300e93          	li	t4,3
    800083b8:	ea5ff06f          	j	8000825c <__memset+0x84>
    800083bc:	00100e93          	li	t4,1
    800083c0:	e9dff06f          	j	8000825c <__memset+0x84>
    800083c4:	00000e93          	li	t4,0
    800083c8:	e95ff06f          	j	8000825c <__memset+0x84>
    800083cc:	00000793          	li	a5,0
    800083d0:	ef9ff06f          	j	800082c8 <__memset+0xf0>
    800083d4:	00200e93          	li	t4,2
    800083d8:	e85ff06f          	j	8000825c <__memset+0x84>
    800083dc:	00400e93          	li	t4,4
    800083e0:	e7dff06f          	j	8000825c <__memset+0x84>
    800083e4:	00500e93          	li	t4,5
    800083e8:	e75ff06f          	j	8000825c <__memset+0x84>
    800083ec:	00600e93          	li	t4,6
    800083f0:	e6dff06f          	j	8000825c <__memset+0x84>

00000000800083f4 <__memmove>:
    800083f4:	ff010113          	addi	sp,sp,-16
    800083f8:	00813423          	sd	s0,8(sp)
    800083fc:	01010413          	addi	s0,sp,16
    80008400:	0e060863          	beqz	a2,800084f0 <__memmove+0xfc>
    80008404:	fff6069b          	addiw	a3,a2,-1
    80008408:	0006881b          	sext.w	a6,a3
    8000840c:	0ea5e863          	bltu	a1,a0,800084fc <__memmove+0x108>
    80008410:	00758713          	addi	a4,a1,7
    80008414:	00a5e7b3          	or	a5,a1,a0
    80008418:	40a70733          	sub	a4,a4,a0
    8000841c:	0077f793          	andi	a5,a5,7
    80008420:	00f73713          	sltiu	a4,a4,15
    80008424:	00174713          	xori	a4,a4,1
    80008428:	0017b793          	seqz	a5,a5
    8000842c:	00e7f7b3          	and	a5,a5,a4
    80008430:	10078863          	beqz	a5,80008540 <__memmove+0x14c>
    80008434:	00900793          	li	a5,9
    80008438:	1107f463          	bgeu	a5,a6,80008540 <__memmove+0x14c>
    8000843c:	0036581b          	srliw	a6,a2,0x3
    80008440:	fff8081b          	addiw	a6,a6,-1
    80008444:	02081813          	slli	a6,a6,0x20
    80008448:	01d85893          	srli	a7,a6,0x1d
    8000844c:	00858813          	addi	a6,a1,8
    80008450:	00058793          	mv	a5,a1
    80008454:	00050713          	mv	a4,a0
    80008458:	01088833          	add	a6,a7,a6
    8000845c:	0007b883          	ld	a7,0(a5)
    80008460:	00878793          	addi	a5,a5,8
    80008464:	00870713          	addi	a4,a4,8
    80008468:	ff173c23          	sd	a7,-8(a4)
    8000846c:	ff0798e3          	bne	a5,a6,8000845c <__memmove+0x68>
    80008470:	ff867713          	andi	a4,a2,-8
    80008474:	02071793          	slli	a5,a4,0x20
    80008478:	0207d793          	srli	a5,a5,0x20
    8000847c:	00f585b3          	add	a1,a1,a5
    80008480:	40e686bb          	subw	a3,a3,a4
    80008484:	00f507b3          	add	a5,a0,a5
    80008488:	06e60463          	beq	a2,a4,800084f0 <__memmove+0xfc>
    8000848c:	0005c703          	lbu	a4,0(a1)
    80008490:	00e78023          	sb	a4,0(a5)
    80008494:	04068e63          	beqz	a3,800084f0 <__memmove+0xfc>
    80008498:	0015c603          	lbu	a2,1(a1)
    8000849c:	00100713          	li	a4,1
    800084a0:	00c780a3          	sb	a2,1(a5)
    800084a4:	04e68663          	beq	a3,a4,800084f0 <__memmove+0xfc>
    800084a8:	0025c603          	lbu	a2,2(a1)
    800084ac:	00200713          	li	a4,2
    800084b0:	00c78123          	sb	a2,2(a5)
    800084b4:	02e68e63          	beq	a3,a4,800084f0 <__memmove+0xfc>
    800084b8:	0035c603          	lbu	a2,3(a1)
    800084bc:	00300713          	li	a4,3
    800084c0:	00c781a3          	sb	a2,3(a5)
    800084c4:	02e68663          	beq	a3,a4,800084f0 <__memmove+0xfc>
    800084c8:	0045c603          	lbu	a2,4(a1)
    800084cc:	00400713          	li	a4,4
    800084d0:	00c78223          	sb	a2,4(a5)
    800084d4:	00e68e63          	beq	a3,a4,800084f0 <__memmove+0xfc>
    800084d8:	0055c603          	lbu	a2,5(a1)
    800084dc:	00500713          	li	a4,5
    800084e0:	00c782a3          	sb	a2,5(a5)
    800084e4:	00e68663          	beq	a3,a4,800084f0 <__memmove+0xfc>
    800084e8:	0065c703          	lbu	a4,6(a1)
    800084ec:	00e78323          	sb	a4,6(a5)
    800084f0:	00813403          	ld	s0,8(sp)
    800084f4:	01010113          	addi	sp,sp,16
    800084f8:	00008067          	ret
    800084fc:	02061713          	slli	a4,a2,0x20
    80008500:	02075713          	srli	a4,a4,0x20
    80008504:	00e587b3          	add	a5,a1,a4
    80008508:	f0f574e3          	bgeu	a0,a5,80008410 <__memmove+0x1c>
    8000850c:	02069613          	slli	a2,a3,0x20
    80008510:	02065613          	srli	a2,a2,0x20
    80008514:	fff64613          	not	a2,a2
    80008518:	00e50733          	add	a4,a0,a4
    8000851c:	00c78633          	add	a2,a5,a2
    80008520:	fff7c683          	lbu	a3,-1(a5)
    80008524:	fff78793          	addi	a5,a5,-1
    80008528:	fff70713          	addi	a4,a4,-1
    8000852c:	00d70023          	sb	a3,0(a4)
    80008530:	fec798e3          	bne	a5,a2,80008520 <__memmove+0x12c>
    80008534:	00813403          	ld	s0,8(sp)
    80008538:	01010113          	addi	sp,sp,16
    8000853c:	00008067          	ret
    80008540:	02069713          	slli	a4,a3,0x20
    80008544:	02075713          	srli	a4,a4,0x20
    80008548:	00170713          	addi	a4,a4,1
    8000854c:	00e50733          	add	a4,a0,a4
    80008550:	00050793          	mv	a5,a0
    80008554:	0005c683          	lbu	a3,0(a1)
    80008558:	00178793          	addi	a5,a5,1
    8000855c:	00158593          	addi	a1,a1,1
    80008560:	fed78fa3          	sb	a3,-1(a5)
    80008564:	fee798e3          	bne	a5,a4,80008554 <__memmove+0x160>
    80008568:	f89ff06f          	j	800084f0 <__memmove+0xfc>

000000008000856c <__putc>:
    8000856c:	fe010113          	addi	sp,sp,-32
    80008570:	00813823          	sd	s0,16(sp)
    80008574:	00113c23          	sd	ra,24(sp)
    80008578:	02010413          	addi	s0,sp,32
    8000857c:	00050793          	mv	a5,a0
    80008580:	fef40593          	addi	a1,s0,-17
    80008584:	00100613          	li	a2,1
    80008588:	00000513          	li	a0,0
    8000858c:	fef407a3          	sb	a5,-17(s0)
    80008590:	fffff097          	auipc	ra,0xfffff
    80008594:	b3c080e7          	jalr	-1220(ra) # 800070cc <console_write>
    80008598:	01813083          	ld	ra,24(sp)
    8000859c:	01013403          	ld	s0,16(sp)
    800085a0:	02010113          	addi	sp,sp,32
    800085a4:	00008067          	ret

00000000800085a8 <__getc>:
    800085a8:	fe010113          	addi	sp,sp,-32
    800085ac:	00813823          	sd	s0,16(sp)
    800085b0:	00113c23          	sd	ra,24(sp)
    800085b4:	02010413          	addi	s0,sp,32
    800085b8:	fe840593          	addi	a1,s0,-24
    800085bc:	00100613          	li	a2,1
    800085c0:	00000513          	li	a0,0
    800085c4:	fffff097          	auipc	ra,0xfffff
    800085c8:	ae8080e7          	jalr	-1304(ra) # 800070ac <console_read>
    800085cc:	fe844503          	lbu	a0,-24(s0)
    800085d0:	01813083          	ld	ra,24(sp)
    800085d4:	01013403          	ld	s0,16(sp)
    800085d8:	02010113          	addi	sp,sp,32
    800085dc:	00008067          	ret

00000000800085e0 <console_handler>:
    800085e0:	fe010113          	addi	sp,sp,-32
    800085e4:	00813823          	sd	s0,16(sp)
    800085e8:	00113c23          	sd	ra,24(sp)
    800085ec:	00913423          	sd	s1,8(sp)
    800085f0:	02010413          	addi	s0,sp,32
    800085f4:	14202773          	csrr	a4,scause
    800085f8:	100027f3          	csrr	a5,sstatus
    800085fc:	0027f793          	andi	a5,a5,2
    80008600:	06079e63          	bnez	a5,8000867c <console_handler+0x9c>
    80008604:	00074c63          	bltz	a4,8000861c <console_handler+0x3c>
    80008608:	01813083          	ld	ra,24(sp)
    8000860c:	01013403          	ld	s0,16(sp)
    80008610:	00813483          	ld	s1,8(sp)
    80008614:	02010113          	addi	sp,sp,32
    80008618:	00008067          	ret
    8000861c:	0ff77713          	andi	a4,a4,255
    80008620:	00900793          	li	a5,9
    80008624:	fef712e3          	bne	a4,a5,80008608 <console_handler+0x28>
    80008628:	ffffe097          	auipc	ra,0xffffe
    8000862c:	6dc080e7          	jalr	1756(ra) # 80006d04 <plic_claim>
    80008630:	00a00793          	li	a5,10
    80008634:	00050493          	mv	s1,a0
    80008638:	02f50c63          	beq	a0,a5,80008670 <console_handler+0x90>
    8000863c:	fc0506e3          	beqz	a0,80008608 <console_handler+0x28>
    80008640:	00050593          	mv	a1,a0
    80008644:	00001517          	auipc	a0,0x1
    80008648:	f2c50513          	addi	a0,a0,-212 # 80009570 <CONSOLE_STATUS+0x560>
    8000864c:	fffff097          	auipc	ra,0xfffff
    80008650:	afc080e7          	jalr	-1284(ra) # 80007148 <__printf>
    80008654:	01013403          	ld	s0,16(sp)
    80008658:	01813083          	ld	ra,24(sp)
    8000865c:	00048513          	mv	a0,s1
    80008660:	00813483          	ld	s1,8(sp)
    80008664:	02010113          	addi	sp,sp,32
    80008668:	ffffe317          	auipc	t1,0xffffe
    8000866c:	6d430067          	jr	1748(t1) # 80006d3c <plic_complete>
    80008670:	fffff097          	auipc	ra,0xfffff
    80008674:	3e0080e7          	jalr	992(ra) # 80007a50 <uartintr>
    80008678:	fddff06f          	j	80008654 <console_handler+0x74>
    8000867c:	00001517          	auipc	a0,0x1
    80008680:	ff450513          	addi	a0,a0,-12 # 80009670 <digits+0x78>
    80008684:	fffff097          	auipc	ra,0xfffff
    80008688:	a68080e7          	jalr	-1432(ra) # 800070ec <panic>
	...
