#!/bin/bash

export DISPLAY=$(grep nameserver /etc/resolv.conf | sed "s/nameserver //"):0.0
qemu-system-i386 one.img