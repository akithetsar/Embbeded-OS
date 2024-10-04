////
//// Created by os on 8/14/24.
////
//
//#include "../h/proto_print.hpp"
//#include "../h/TCB.hpp"
//#include "../lib/console.h"
//void testA(void* arg){
//
//    printString((char*)arg);
//    for(uint64 i = 0; i < 10; i++){
//        printString("A: i=");
//        printInteger(i);
//        printString("\n");
//        for(uint64 j = 0; j < 10000; j++){
//            for(uint64 k = 0; k < 30000; k++){
//                //busy wait
//            }
//        }
//        if(i == 6) thread_exit();
//    }
//
//
//}
//
//
//void testB(void* arg){
//    printString((char*)arg);
//
//    for(uint64 i = 0; i < 10; i++){
//        printString("B: i=");
//        printInteger(i);
//        printString("\n");
//        for(uint64 j = 0; j < 10000; j++){
//            for(uint64 k = 0; k < 30000; k++){
//                //busy wait
//            }
//        }
//    }
//
//
//}
//
//void testC(void* arg){
//    printString((char*)arg);
//
//    printString("C: 1");
//    __putc('\n');
//    thread_dispatch();
//    printString("C: 2");
//    __putc('\n');
//    printString("C: 3");
//    __putc('\n');
//    printString("C: 4");
//    __putc('\n');
//    thread_dispatch();
//    printString("C: 5");
//    __putc('\n');
//    printString("C: 6");
//    __putc('\n');
//    printString("C: 7");
//    __putc('\n');
//
//
//}
//
//
//void testD(void* arg){
//    printString((char*)arg);
//
//    printString("D: 1");
//    __putc('\n');
//    thread_dispatch();
//
//    printString("D: 2");
//    __putc('\n');
//    printString("D: 3");
//    __putc('\n');
//    printString("D: 4");
//    __putc('\n');
//    thread_dispatch();
//
//    printString("D: 5");
//    __putc('\n');
//    printString("D: 6");
//    __putc('\n');
//    printString("D: 7");
//    __putc('\n');
//
//}
//void testE(void* arg){
//    printString((char*)arg);
//
//    printString("E: 1");
//    __putc('\n');
//    thread_dispatch();
//
//    printString("E: 2");
//    __putc('\n');
//    printString("E: 3");
//    __putc('\n');
//    printString("E: 4");
//    __putc('\n');
//    thread_dispatch();
//
//    printString("E: 5");
//    __putc('\n');
//    printString("E: 6");
//    __putc('\n');
//    printString("E: 7");
//    __putc('\n');
//
//}