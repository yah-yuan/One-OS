#!/bin/bash

# 1. build raw hardisk image

qemu-img create -o size=16M one.img

# 2. build the os

cd boot/
make
if [ $? -ne 0 ]
then
    echo "Make failed, exit"
    exit 1
fi
cd ../

# 3. write MBR to img

qemu-img dd bs=512 count=1 if=./boot/mbr.o of=one.img