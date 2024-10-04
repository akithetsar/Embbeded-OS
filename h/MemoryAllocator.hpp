//
// Created by os on 8/8/24.
//

#ifndef PROJECT_BASE_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_MEMORYALLOCATOR_HPP
#include "../lib/hw.h"

class MemoryAllocator {

public:

    //Initializes memory
    static void mem_construct();
    //Allocates the size of memory in bocks
    static void* sys_mem_alloc(size_t size);
    //Frees the memory that ptr points to
    static int sys_mem_free(const void* ptr);

    static void print();
    static void printFreeBlocks();


private:

    struct BlockHeader {
        BlockHeader *next;
        uint64 size;
        bool alloc_verify = false;
    };

    static BlockHeader *freeMemHead;
    static uint64 constexpr HEADER_SIZE = sizeof(BlockHeader);

    static void merge(BlockHeader *blk1, BlockHeader* blk2);

    static void printFreeList();
};

#endif //PROJECT_BASE_MEMORYALLOCATOR_HPP
