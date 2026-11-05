# x86_64 syscall-calculator

A fully functional calculator written purely in x86_64 Assembly for Linux. This project performs basic arithmetic operations (addition, subtraction, multiplication, division) without using any C standard libraries (like `stdio.h` or `stdlib.h`). It communicates directly with the Linux kernel via system calls.

## ✨ Features
* Pure x86_64 Assembly (NASM)
* No external libraries (freestanding)
* Modular architecture (`main`, `math`, `io`)
* String to integer parsing (custom `atoi`)
* Integer to string conversion (custom `itoa` with stack-based digit extraction)
* Signed integer arithmetic support

## 🛠️ How it works
The program reads user input from `stdin` using the `read` syscall, parses the ASCII characters into 64-bit integers, performs the math, converts the result back to a string, and prints it to `stdout` using the `write` syscall.

## ⚙️ How to Build and Run
1. Ensure you have `nasm` and `ld` installed.
2. Make the build script executable:
   `chmod +x build.sh`
3. Build and run:
   `./build.sh`
