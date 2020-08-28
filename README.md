# 摸鱼记

平安摸鱼

能用就行

不懂就跳

下次不鸽

# Install

## QEMU Install

## If you are using WSL1...

Although MS has announced there will be adaption for WSL1/2 GUI application, but in my current version, not yet.

insall xming in your windows. run it.

`export DISPLAY=:0.0` to your running wsl console

## If you are using WSL2...

Insall xming in your windows. run it with `-ac` param.

Let xming program pass your windows firewall( or you may waste time on this fuck)

Note: xming use port 6000 to public its service.

run `export DISPLAY=$(yourWindowsHostIp):0.0` in your running wsl console. And this console can now run qemu or any other GUI applications.

## build the os

sh build.sh

## run

sh run.sh