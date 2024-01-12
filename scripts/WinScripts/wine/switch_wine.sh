#!/bin/sh

export PATH=/data/data/com.termux/files/usr/bin
unset LD_LIBRARY_PATH
WINEPREFIX=${WINEPREFIX:-$HOME/.wine}

cachedir=$HOME/.local/cache


$PREFIX/glibc/opt/WinScripts/exit.sh

case $1 in
8.0)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-$1/wine-$1-amd64.tar.xz -P $cachedir
    ;;
8.14)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine/wine-$1-amd64.tar.xz -P $cachedir
    ;;
ge8-13)
    [[ ! -f $cachedir/wine-lutris-GE-Proton8-13-x86_64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-ge-8.13/wine-lutris-GE-Proton8-13-x86_64.tar.xz -P $cachedir
    ;;
9.0)
    [[ ! -f $cachedir/wine-$1-amd64.tar.xz ]] && wget https://github.com/Pipetto-crypto/androBox/releases/download/wine-$1-rc4/wine-$1-amd64.tar.xz -P $cachedir
    ;;
esac 

rm -rf $PREFIX/glibc/opt/wine
if [ "$1" == "ge8-13" ]
then
     tar -xf $cachedir/wine-lutris-GE-Proton8-13-x86_64.tar.xz -C $PREFIX/glibc/opt
     mv $PREFIX/glibc/opt/lutris* $PREFIX/glibc/opt/wine
else
     tar -xf $cachedir/wine-$1-amd64.tar.xz -C $PREFIX/glibc/opt
     mv $PREFIX/glibc/opt/wine-$1-amd64 $PREFIX/glibc/opt/wine
fi

rm -rf $HOME/.wine
WINEESYNC=0 WINEDLLOVERRIDES="mscoree=" wine wineboot
sleep 3
pfxupdate
user="$(ls $HOME/.wine/drive_c/users | grep -e '^u')"
mkdir -p $HOME/.wine/drive_c/users/$user/AppData/Local/ProcessLasso/config
cp -r $PREFIX/glibc/opt/Programs/ProcessLasso/prolasso.ini $HOME/.wine/drive_c/users/u*/AppData/Local/ProcessLasso/config
sleep 3
$PREFIX/glibc/opt/WinScripts/restart.sh
