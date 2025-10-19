#include "../h/SysSemaphore.hpp"
#include "../h/Scheduler.hpp"
#include "../h/MemoryAllocator.hpp"

// Global list for timeout management
SysSemaphore* SysSemaphore::semaphore_list_head = nullptr;

SysSemaphore::SysSemaphore(unsigned init)
    : value(init),
      is_destroyed(false),
      blocked_head(nullptr),
      blocked_tail(nullptr),
      timed_wait_head(nullptr),
      timed_wait_tail(nullptr),
      next_semaphore(nullptr),
      prev_semaphore(nullptr)
{
    add_to_global_list();
}

SysSemaphore::~SysSemaphore() {
    is_destroyed = true;


    while (!is_queue_empty()) {
        TCB* tcb = dequeue_blocked();
        if (tcb) {
            tcb->setSuspended(false);
            // Set error code in TCB (you might need to add this field)
            // tcb->semaphore_error = SEMDEAD;
            Scheduler::put(tcb);
        }
    }


    while (timed_wait_head) {
        TimedWaitInfo* info = timed_wait_head;
        timed_wait_head = timed_wait_head->next;
        delete info;
    }

    remove_from_global_list();
}


int SysSemaphore::sys_sem_open(SysSemaphore** handle, unsigned init) {
    if (handle == nullptr) return -1;

    *handle = new SysSemaphore(init);
    return (*handle) ? 0 : -1;
}

int SysSemaphore::sys_sem_close(SysSemaphore* handle) {
    if (handle == nullptr) return -1;

    delete handle;
    return 0;
}

int SysSemaphore::sys_sem_wait(SysSemaphore* handle) {
    if (handle == nullptr) return -1;

    handle->wait();
    return 0;
}

int SysSemaphore::sys_sem_signal(SysSemaphore* handle) {
    if (handle == nullptr) return -1;

    handle->signal();
    return 0;
}

int SysSemaphore::sys_sem_timedwait(SysSemaphore* handle, time_t timeout) {
    if (handle == nullptr) return -1;

    return handle->timedwait(timeout);
}

int SysSemaphore::sys_sem_trywait(SysSemaphore* handle) {
    if (handle == nullptr) return -1;

    return handle->trywait();
}


void SysSemaphore::wait() {
    if (is_destroyed) return;

    value--;

    if (value < 0) {
        TCB* current = TCB::running;
        current->setSuspended(true);
        enqueue_blocked(current);
        TCB::dispatch();
    }
}

void SysSemaphore::signal() {
    if (is_destroyed) return;

    value++;

    if (value <= 0) {
        TCB* tcb = dequeue_blocked();
        if (tcb) {
            remove_timed_wait(tcb);
            tcb->setSuspended(false);
            Scheduler::put(tcb);
        }
    }
}

int SysSemaphore::timedwait(time_t timeout) {
    if (is_destroyed) return SEMDEAD;
    if (timeout <= 0) return trywait();

    value--;

    if (value < 0) {
        TCB* current = TCB::running;
        current->setSuspended(true);

        enqueue_blocked(current);
        add_timed_wait(current, timeout);

        TCB::dispatch();

        // Check if we were woken up by timeout or signal
        // You might need to add a field to TCB to track this
        if (is_destroyed) return SEMDEAD;
        // If woken by timeout, trywait would have already handled cleanup
        return 0;  // Successfully acquired
    }

    return 0;  // Acquired immediately
}

int SysSemaphore::trywait() {
    if (is_destroyed) return SEMDEAD;

    if (value > 0) {
        value--;
        return 0;
    }

    return 1;
}

// Timeout management
void SysSemaphore::add_timed_wait(TCB* tcb, time_t timeout) {
    TimedWaitInfo* info = new TimedWaitInfo;
    info->tcb = tcb;
    info->wake_time = TCB::clock + timeout;
    info->next = nullptr;
    info->prev = nullptr;

    if (timed_wait_head == nullptr) {
        timed_wait_head = timed_wait_tail = info;
    } else {
        timed_wait_tail->next = info;
        info->prev = timed_wait_tail;
        timed_wait_tail = info;
    }
}

void SysSemaphore::remove_timed_wait(TCB* tcb) {
    TimedWaitInfo* current = timed_wait_head;

    while (current) {
        if (current->tcb == tcb) {
            if (current->prev) {
                current->prev->next = current->next;
            } else {
                timed_wait_head = current->next;
            }

            if (current->next) {
                current->next->prev = current->prev;
            } else {
                timed_wait_tail = current->prev;
            }

            delete current;
            return;
        }
        current = current->next;
    }
}

void SysSemaphore::check_timeouts() {
    if (is_destroyed) return;

    TimedWaitInfo* current = timed_wait_head;

    while (current) {
        if (TCB::clock >= current->wake_time) {

            TCB* tcb = current->tcb;
            TimedWaitInfo* to_remove = current;
            current = current->next;


            if (to_remove->prev) {
                to_remove->prev->next = to_remove->next;
            } else {
                timed_wait_head = to_remove->next;
            }

            if (to_remove->next) {
                to_remove->next->prev = to_remove->prev;
            } else {
                timed_wait_tail = to_remove->prev;
            }

            delete to_remove;


            remove_from_blocked_queue(tcb);
            tcb->setSuspended(false);
            // tcb->semaphore_error = TIMEOUT;  // Set timeout error
            Scheduler::put(tcb);

            value++;
        } else {
            current = current->next;
        }
    }
}


void SysSemaphore::add_to_global_list() {
    if (semaphore_list_head) {
        semaphore_list_head->prev_semaphore = this;
    }
    next_semaphore = semaphore_list_head;
    semaphore_list_head = this;
}

void SysSemaphore::remove_from_global_list() {
    if (prev_semaphore) {
        prev_semaphore->next_semaphore = next_semaphore;
    } else {
        semaphore_list_head = next_semaphore;
    }

    if (next_semaphore) {
        next_semaphore->prev_semaphore = prev_semaphore;
    }
}

void SysSemaphore::handle_timer_tick() {
    SysSemaphore* current = semaphore_list_head;
    while (current) {
        current->check_timeouts();
        current = current->next_semaphore;
    }
}


void SysSemaphore::remove_from_blocked_queue(TCB* tcb) {
    if (tcb->prev) {
        tcb->prev->next = tcb->next;
    } else {
        blocked_head = tcb->next;
    }

    if (tcb->next) {
        tcb->next->prev = tcb->prev;
    } else {
        blocked_tail = tcb->prev;
    }

    tcb->next = tcb->prev = nullptr;
}


void SysSemaphore::enqueue_blocked(TCB* tcb) {
    if (tcb == nullptr) return;

    tcb->next = nullptr;
    tcb->prev = nullptr;

    if (blocked_head == nullptr) {
        blocked_head = blocked_tail = tcb;
    } else {
        blocked_tail->next = tcb;
        tcb->prev = blocked_tail;
        blocked_tail = tcb;
    }
}

TCB* SysSemaphore::dequeue_blocked() {
    if (blocked_head == nullptr) return nullptr;

    TCB* tcb = blocked_head;
    blocked_head = blocked_head->next;

    if (blocked_head != nullptr) {
        blocked_head->prev = nullptr;
    } else {
        blocked_tail = nullptr;
    }

    tcb->next = tcb->prev = nullptr;
    return tcb;
}

bool SysSemaphore::is_queue_empty() const {
    return blocked_head == nullptr;
}