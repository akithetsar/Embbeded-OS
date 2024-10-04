////
//// Created by os on 8/13/24.
////
//
//#ifndef MEMORYALLOCATORTEST_HPP
//#define MEMORYALLOCATORTEST_HPP
//
//#include "../h/MemoryAllocator.hpp"
//#include "../lib/console.h"
//#include "../h/proto_print.hpp"
//class MemoryAllocatorTest {
//public:
//    static void runTests() {
//        testInitialMemoryState();
//        testMergingFreeBlocks();
//        testEdgeCases();
//    }
//
//
//    static void testInitialMemoryState() {
//        printString("Test: Initial Memory State\n");
//        MemoryAllocator::mem_construct();
//        MemoryAllocator::print();
//        printString("-------------------\n\n");
//    }
//
//
//
//
//    static void testMergingFreeBlocks() {
//        printString("Test: Merging Adjacent Free Blocks\n");
//        void* ptr1 = MemoryAllocator::sys_mem_alloc(200);
//        MemoryAllocator::sys_mem_alloc(300);
//        MemoryAllocator::sys_mem_alloc(400);
//        MemoryAllocator::sys_mem_free(ptr1); // Free the first block
//        MemoryAllocator::print();
//        printString("-------------------\n\n");
//    }
//
//    static void testEdgeCases() {
//        printString("Test: Edge Cases (Exceeding Memory Boundaries)\n");
//        void* ptr3 = MemoryAllocator::sys_mem_alloc(134194904); // Try allocating more than available
//        if (!ptr3) {
//            printString("Allocation failed as expected.\n");
//        }
//        MemoryAllocator::print();
//        printString("-------------------\n\n");
//
//        printString("Test: Freeing Unallocated Block\n");
//        int result = MemoryAllocator::sys_mem_free(reinterpret_cast<void*>(2147506722)); // Adjust with your test environment pointer values
//        if (result == -2) {
//            printString("Freeing unallocated memory failed as expected.\n");
//        }
//        MemoryAllocator::print();
//        printString("-------------------\n\n");
//        if(ptr3){
//            MemoryAllocator::sys_mem_free(ptr3);
//        }
//    }
//};
//
//#endif // MEMORYALLOCATORTEST_HPP
