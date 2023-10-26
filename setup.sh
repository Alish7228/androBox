#!/bin/bash

echo -e "\nInstalling required dependencies"

termux-change-repo
pkg update && pkg upgrade -y
pkg install x11-repo tur-repo -y
pkg install pulseaudio git virglrenderer-android mesa wget fontconfig freetype libpng termux-x11-nightly cabextract zenity openbox file xorg-xrandr xterm -y

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
     termux-setup-storage
fi

if [ -f /sdcard/glibc_prefix.tar.xz ]
then
     echo -e "\nInstalling the glibc prefix" 
     tar -xvf /sdcard/glibc_prefix.tar.xz -C $PREFIX
else 
     echo -e "\nNo glibc prefix detected, put the prefix into the root of your sdcard"
     exit
fi

if [ -f /sdcard/wine-*-amd64.tar.xz ]
then
     echo -e "\nInstalling patched wine"
     tar -xvf /sdcard/wine-*-amd64.tar.xz -C $PREFIX/glibc/opt
else
     echo -e "\nNo patched wine detected, put the patched wine into the root of your sdcard"
     exit
fi

git clone https://github.com/Pipetto-crypto/androBox.git -b androBoxNew 
for item in $HOME/androBox/scripts/*
do
   [[ ! -d $item ]] && chmod +x $item && mv $item $PREFIX/bin
done

mkdir -p /sdcard/androBox
mv $HOME/androBox/configs/* /sdcard/androBox

echo "check_certificate = off" > $HOME/.wgetrc

rm -rf $HOME/androBox
wine wineboot
pfxupdate

cat >> $HOME/.androBox <<- EOM
#androBox configuration file

checkres=enabled
services=disabled
EOM
