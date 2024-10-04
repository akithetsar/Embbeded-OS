//
// Created by os on 8/29/24.
//
//
// Created by os on 8/29/24.
//
#include "../h/IOBuffer.hpp"


void IOBuffer::init(uint8 initial_capacity) {
    capacity = initial_capacity;
    buffer = nullptr;
    head = 0;
    tail = 0;
    size = 0;
    buffer = reinterpret_cast<char*>(mem_alloc(capacity));
    sem_open(&availability, 0);
}
void IOBuffer::destroy() {
    if (buffer) {
        mem_free(buffer);
    }
    sem_close(availability);
}


void IOBuffer::resize(size_t new_capacity) {
    char* new_buffer = static_cast<char*>(mem_alloc(new_capacity));

    // Copy data to the new buffer
    for (size_t i = 0; i < size; ++i) {
        new_buffer[i] = buffer[(head + i) % capacity];
    }

    // Free the old buffer
    mem_free(buffer);

    // Update pointers and capacity
    buffer = new_buffer;
    capacity = new_capacity;
    head = 0;
    tail = size;  // New tail is at the end of the current data
}

void IOBuffer::enqueue(char data) {
    if (is_full()) {
        // Double the capacity when the buffer is full
        resize(capacity * 2);
    }

    buffer[tail] = data;
    tail = (tail + 1) % capacity;
    ++size;
    sem_signal(availability);

}

char IOBuffer::dequeue() {

    sem_wait(availability);
    char data = buffer[head];
    head = (head + 1) % capacity;
    --size;

    return data;
}

bool IOBuffer::is_empty() const {
    return size == 0;
}

bool IOBuffer::is_full() const {
    return size == capacity;
}

size_t IOBuffer::get_size() const {
    return size;
}

size_t IOBuffer::get_capacity() const {
    return capacity;
}



