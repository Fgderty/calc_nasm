# x86-64 Assembly Calculator

A fully functional command-line calculator written purely in x86-64 Assembly (NASM) for Linux. 

This project demonstrates modular programming in Assembly, linking multiple object files, and interacting directly with the Linux kernel via system calls (`syscall`) without using any C standard libraries (libc).

## ✨ Features
* **Supported operations:** Addition, Subtraction, Multiplication, Division.
* **Input/Output:** Custom implementation of `atoi` (string to integer) and `itoa` (integer to string using stack).
* **Architecture:** Modular design split into `main.asm` (entry point), `math.asm` (logic), and `io.asm` (input/output).
* **ABI Compliance:** Follows System V AMD64 calling convention (`rdi`, `rsi`, `rdx`).

## ⚙️ How to Build and Run
The project includes an automated build script (`build.sh`) that handles compilation, linking, and execution.

1. Make the script executable:
   ```bash
   chmod +x build.sh
