////
//// Created by os on 8/13/24.
////
//
//
//#include "../h/proto_print.hpp"
//#include "../lib/console.h"
//#include "../h/riscv.hpp"
//void printString(const char *string){
////    riscv::enable_interrupts();
//    while(*string != '\0'){
//        __putc(*string);
//        string++;
//    }
////    riscv::disable_interrupts();
//
//}
//
//void printInteger(uint64 integer){
////    riscv::enable_interrupts();
//    static char digits[] = "0123456789";
//    char buf[16];
//    int i, neg;
//    uint x;
//
//    neg = 0;
//    if(integer < 0){
//        neg = 1;
//        x = -integer;
//    }
//    else{
//        x = integer;
//    }
//
//    i = 0;
//    do
//    {
//        buf[i++] = digits[x%10];
//    }
//    while((x /= 10) != 0);
//    if(neg) buf[i++] = '-';
//
//    while(--i >= 0){
//        __putc(buf[i]);
//    }
////    riscv::disable_interrupts();
//
//}