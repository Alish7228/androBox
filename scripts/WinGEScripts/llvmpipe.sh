#!/bin/bash

winege -k
sed -i "4s/=.*/=llvmpipe/g" /sdcard/3in1ProotX86Emus/proot.conf
sed -i "11s/=.*/=llvmpipe/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "12s/=.*/=swrast/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "11s/=.*/=llvmpipe/g" /sdcard/3in1ProotX86Emus/box64opts
sed -i "12s/=.*/=swrast/g" /sdcard/3in1ProotX86Emus/box64opts
env GALLIUM_DRIVER=llvmpipe MESA_LOADER_DRIVER_OVERRIDE= winedesktopge
