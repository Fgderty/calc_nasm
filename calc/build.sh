#!/bin/bash
set -e

echo "---Building Modular Calculator---"

echo "Compiling main.asm..."
nasm -f elf64 main.asm -o main.o

echo "Compiling math.asm..."
nasm -f elf64 math.asm -o math.o

echo "Compiling io.asm..."
nasm -f elf64 io.asm -o io.o

echo "Linking..."
ld main.o math.o io.o -o calc

echo "[OK] Build successful."
echo "---Running Calculator---"

./calc

