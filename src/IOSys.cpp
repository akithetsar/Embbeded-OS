//
// Created by os on 8/29/24.
//
#include "../h/IOSys.hpp"



IOBuffer* IOSys::iBuffer = nullptr;
IOBuffer* IOSys::oBuffer = nullptr;

void IOSys::io_construct() {
    iBuffer = reinterpret_cast<IOBuffer*>(mem_alloc(sizeof(IOBuffer)));
    oBuffer = reinterpret_cast<IOBuffer*>(mem_alloc(sizeof(IOBuffer)));
    iBuffer->init(DEFAULT_BUFFER_CAPACITY);
    oBuffer->init(DEFAULT_BUFFER_CAPACITY);
}

void IOSys::io_destroy() {
    iBuffer->destroy();
    oBuffer->destroy();
    mem_free(iBuffer);
    mem_free(oBuffer);
}

void IOSys::sys_putc(char c) {
    oBuffer->enqueue(c);
}

char IOSys::sys_getc() {
    return iBuffer->dequeue();
}
