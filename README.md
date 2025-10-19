# Embedded OS - Simple Kernel for RISC‑V (Operativni sistemi 1)

![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20macOS%20%7C%20Linux-lightgrey?style=for-the-badge)
![Language](https://img.shields.io/badge/Primary%20Language-C%2B%2B-blue?style=for-the-badge)
![Makefile](https://img.shields.io/badge/Build-Makefile-yellow?style=for-the-badge)
![Emulator](https://img.shields.io/badge/Runtime-QEMU-black?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Active%20Development-brightgreen?style=for-the-badge)
![Integration](https://img.shields.io/badge/Git-Integration-red?style=for-the-badge)

A compact, student-focused teaching kernel for RV64IMA RISC‑V. This repository contains the project skeleton, interfaces and guidance for building a small multithreaded embedded OS (time‑sharing) used in the "Operativni sistemi 1" course at ETF, University of Belgrade.

---

## Table of Contents
- About
- Features
- Architecture & APIs (quick)
- Build & Run (quick)
- Recommended workflow
- Project layout
- Tests & grading
- License & contact

---

## About
This project asks students to implement a small, functional kernel that supports:
- threads (lightweight threads within one address space),
- semaphores,
- memory allocator with block granularity,
- console I/O (interrupt-driven buffers),
- optional time-slicing / preemption (timer interrupt),
- a layered interface: ABI (ecall), C API, and a C++ OO wrapper API.

The deliverable is a statically-linked single executable (kernel + app) intended to run on an emulated RV64IMA RISC‑V platform inside QEMU (provided VM).

---

## Features (At a glance)
- Single-address-space "library" kernel (kernel + app share same image)
- ABI via RISC‑V ecall (a0 = syscall code; a1.. = args)
- C API (syscall wrappers) and C++ API (Thread, Semaphore, Console, PeriodicThread)
- operator new/delete remapped to kernel allocator
- Low-level context switching and interrupt handling implemented in RISC‑V assembly where needed
- Build targets: `make qemu`, `make qemu-gdb`, `make clean` (configured for the course VM)

---

## Architecture & API (quick summary)
- ABI: system calls invoked with ecall. Return value in a0; mem_alloc ABI expects blocks, not raw bytes.
- C API: syscall_c.hpp - mem_alloc, mem_free, thread_create, thread_exit, thread_dispatch, sem_* , time_sleep, getc/putc.
- C++ API: syscall_cpp.hpp - Thread, Semaphore, PeriodicThread, Console, and global operator new/delete wrappers.
- Hardware stubs: hw.lib, mem.lib, console.lib (provided); student code lives in src/ and headers in inc/ (or h/).

---

## Build & Run (quick)
Recommended: use the provided VM (Windows/macOS/Linux host) and CLion or terminal as instructed by the course.

1. Open the project in the provided VM (CLion recommended).
2. Build & run:
   - make qemu        # build + run in QEMU
   - make qemu-gdb    # build and wait for gdb connection (remote debug)
   - make clean       # clean build artifacts
3. The QEMU terminal becomes the kernel's stdin/stdout. After execution, stop the emulator in the VM (use the GUI Stop or the CLion controls).

Note: Do not use host OS threads, semaphores, or malloc/new for kernel services — implement them in the kernel (unless you intentionally link provided libs mem.lib or console.lib as allowed by assignment).



