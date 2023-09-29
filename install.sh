#!/bin/sh
apt-get update
apt-get install picom
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
git clone https://github.com/davatorium/rofi
mkdir build && cd build
../configure
make
make install
apt-get install neofetch
