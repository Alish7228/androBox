#!/bin/bash

unset WINEPREFIX
winege -k
sed -i "8s/=.*/=64/g" /sdcard/3in1ProotX86Emus/proot.conf
sleep 3
winedesktop64
