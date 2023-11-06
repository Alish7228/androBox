#!/data/data/com.termux/files/usr/bin/bash

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH

export DISPLAY=${DISPLAY:-:1}


watch -g 'xrandr | grep current | awk "{print \$8\$9\$10}" | tr -d ","' >/dev/null &>/dev/null
until [ "$(ps -aux | grep '[w]atch' | awk '{print $2}')" == "" ]
do 
   sleep 30
done
$PREFIX/glibc/opt/WinScripts/restart.sh
