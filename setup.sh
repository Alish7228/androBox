#!/bin/bash

echo -e "\nInstalling required dependencies"

pkg update && pkg upgrade
pkg install x11-repo -y
pkg install pulseaudio virglrenderer-android mesa xorg-server-xvfb xwayland megadl proot-distro -y

if [ ! -d ~/storage ]
then
     echo -e "\nGranting internal storage permissions"
fi

echo -e "\nInstalling the rootfs"

mkdir -p $PREFIX/var/lib/proot-distro && mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs
proot-distro restore ubuntu.tar.gz
wget https://raw.githubusercontent.com/Pipetto-crypto/3in1ProotX86Emus/master/ubuntu
chmod +x ubuntu && mv ubuntu $PREFIX/bin
