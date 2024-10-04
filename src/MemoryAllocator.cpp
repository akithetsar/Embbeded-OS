//
// Created by os on 8/9/24.
//
#include "../h/MemoryAllocator.hpp"
#include "../lib/console.h"
#include "../h/proto_print.hpp"
MemoryAllocator::BlockHeader* MemoryAllocator::freeMemHead = nullptr;

void MemoryAllocator::mem_construct() {
    //At beginning the free memory list is just one block that points to the start of address space
    MemoryAllocator::freeMemHead = (MemoryAllocator::BlockHeader*)(HEAP_START_ADDR);
    MemoryAllocator::freeMemHead->next = nullptr;
    MemoryAllocator::freeMemHead->size = reinterpret_cast<uint64>(HEAP_END_ADDR) - reinterpret_cast<uint64>(HEAP_START_ADDR) - MemoryAllocator::HEADER_SIZE;
}

void *MemoryAllocator::sys_mem_alloc(size_t size) {
    MemoryAllocator::BlockHeader *optimalBlock = MemoryAllocator::freeMemHead, *prev = nullptr;

    //Find the optimal block(first fit algorithm)
    for(; optimalBlock != nullptr; prev = optimalBlock, optimalBlock = optimalBlock->next){
        if(optimalBlock->size > size) break;
    }

    //Not enough space left to allocate
    if(!optimalBlock) return nullptr;

    //Create the new next block for prev
    MemoryAllocator::BlockHeader *new_next;
    if(optimalBlock->size == size + MemoryAllocator::HEADER_SIZE){
        new_next = optimalBlock->next;
    }
    else{
        uint64 new_size = optimalBlock->size - size - MemoryAllocator::HEADER_SIZE;
        optimalBlock->size = size;

        new_next = reinterpret_cast<MemoryAllocator::BlockHeader*>(reinterpret_cast<uint64>(optimalBlock) + (uint64)size + MemoryAllocator::HEADER_SIZE);
        new_next->next = optimalBlock->next;
        new_next->size = new_size;
        new_next->alloc_verify = false;
    }


    if(prev) prev->next = new_next;
    else MemoryAllocator::freeMemHead = new_next;
    optimalBlock->alloc_verify = true; // field for verifying proper allocation
    return (void*)(optimalBlock + 1); // optimalBlock + 1 moves the pointer with ptr arithmetic to after header

}

int MemoryAllocator::sys_mem_free(const void *ptr) {
    if(ptr == nullptr) return -3;
    MemoryAllocator::BlockHeader *to_free = (MemoryAllocator::BlockHeader*)(ptr) - 1;
    if(to_free < HEAP_START_ADDR || to_free > HEAP_END_ADDR) return -1; // out of memory address space detected code
    if(!to_free->alloc_verify) return -2; // non-proper allocation detected code
    to_free->alloc_verify = false; // reset allocation because it will be freed;
    MemoryAllocator::BlockHeader *prev = nullptr, *after = MemoryAllocator::freeMemHead;

    //Find the prev and after free block
    for(; after != nullptr; prev = after, after = after->next){
        if(after >= to_free) break;
    }

    if(!prev){
        //Whole list is after to_free
        MemoryAllocator::BlockHeader *temp = freeMemHead;
        MemoryAllocator::freeMemHead = to_free;
        freeMemHead->next = temp;
    }
    else{
        prev->next = to_free;
        to_free->next = after;
    }
    MemoryAllocator::merge(to_free, after);
    MemoryAllocator::merge(prev, to_free);

    return 0;
}

void MemoryAllocator::merge(MemoryAllocator::BlockHeader *blk1, MemoryAllocator::BlockHeader *blk2) {
    if(!blk1 || !blk2) return;

    if(reinterpret_cast<uint64>(blk1) + MemoryAllocator::HEADER_SIZE + blk1->size == reinterpret_cast<uint64>(blk2)){
        blk1->size = blk1->size + blk2->size + MemoryAllocator::HEADER_SIZE;
        blk1->next = blk2->next;
    }
}

//void MemoryAllocator::print() {
//    BlockHeader* current = (BlockHeader*)HEAP_START_ADDR;
//    BlockHeader* freeBlock = freeMemHead;
//
//    printString("Memory Blocks:\n");
//
//    while (reinterpret_cast<uint64>(current) < reinterpret_cast<uint64>(HEAP_END_ADDR)) {
//        printString("[");
//        printInteger(reinterpret_cast<uint64>(current));
//        printString(" | Size: ");
//        printInteger(current->size);
//        printString(" | Allocated: ");
//        printString(current->alloc_verify ? "Yes" : "No");
//        printString("]\n");
//
//        if (current == freeBlock) {
//            freeBlock = freeBlock->next;  // Move to the next free block
//        }
//
//        current = reinterpret_cast<BlockHeader*>(reinterpret_cast<uint64>(current) + current->size + HEADER_SIZE);
//    }
//}
//
//void MemoryAllocator::printFreeBlocks() {
//    BlockHeader* current = freeMemHead;
//
//    printString("Free Memory Blocks:\n");
//
//    while (current != nullptr) {
//        // Print the address of the current block
//        printString("[");
//        printInteger(reinterpret_cast<uint64>(current));
//        printString(" | Size: ");
//
//        // Print the size of the current block
//        printInteger(current->size);
//        printString(" | Allocated: ");
//
//        // Print whether the block is allocated (should be "No" for free blocks)
//        if (current->alloc_verify) {
//            printString("Yes");
//        } else {
//            printString("No");
//        }
//
//        printString("]\n");
//
//        // Move to the next block in the list
//        current = current->next;
//    }
//
//    printString("-------------------\n");
//}
//





