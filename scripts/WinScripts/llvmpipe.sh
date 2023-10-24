#!/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

sed -i "/GALLIUM_DRIVER/d" $TMPDIR/tmpvars.txt
sed -i "/MESA_LOADER_DRIVER_OVERRIDE/d" $TMPDIR/tmpvars.txt
sed -i "/LIBGL_ALWAYS_SOFTWARE/d" $TMPDIR/tmpvars.txt
cat >> $TMPDIR/tmpvars.txt <<- EOM
GALLIUM_DRIVER=llvmpipe
MESA_LOADER_DRIVER_OVERRIDE=swrast
EOM
$PREFIX/glibc/opt/WinScripts/restart.sh
