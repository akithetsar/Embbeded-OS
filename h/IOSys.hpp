//
// Created by os on 8/29/24.
//

#ifndef PROJECT_BASE_IOSYS_HPP
#define PROJECT_BASE_IOSYS_HPP

#include "IOBuffer.hpp"
class IOSys {
public:

    static void io_construct();
    static void io_destroy();

    static void sys_putc(char c);
    static char sys_getc();

    static constexpr uint8 DEFAULT_BUFFER_CAPACITY = 6;
    static IOBuffer* iBuffer;
    static IOBuffer* oBuffer;

};

#endif //PROJECT_BASE_IOSYS_HPP
