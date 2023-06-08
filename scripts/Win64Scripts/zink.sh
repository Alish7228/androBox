#!/bin/bash

wine64 -k
sed -i "4s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/proot.conf
sed -i "11s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "12s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box86opts
sed -i "11s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box64opts
sed -i "12s/=.*/=zink/g" /sdcard/3in1ProotX86Emus/box64opts
env GALLIUM_DRIVER=zink MESA_LOADER_DRIVER_OVERRIDE=zink winedesktop64
