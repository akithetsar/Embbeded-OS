//
// Created by os on 8/28/24.
//

#ifndef PROJECT_BASE_IOBUFFER_HPP
#define PROJECT_BASE_IOBUFFER_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"
class IOBuffer {


public:
    size_t capacity;
    IOBuffer(uint8 initial_capacity);
    ~IOBuffer();
    void init(uint8 initial_capacity);
    void destroy();
    void enqueue(char data);
    char dequeue();
    bool is_empty() const;
    bool is_full() const;
    size_t get_size() const;
    size_t get_capacity() const;
private:
    char* buffer;        // The buffer holding the data
    // The total capacity of the buffer
    size_t head;         // Points to the front of the queue
    size_t tail;         // Points to the rear of the queue
    size_t size;         // The current number of elements in the queue
public:
    sem_t availability;
    void resize(size_t new_capacity);
};



#endif //PROJECT_BASE_IOBUFFER_HPP
