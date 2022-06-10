#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo add-apt-repository universe -y

echo "select ubuntu version"
echo " 1. 18.04 or newer"
echo " 2. older thean 18.04"

read option
case $option in
1)
    echo "ubuntu 18.04 or newer"
    sudo apt-get install gcc libsdl-image1.2 libsdl-image1.2-dev guile-2.0 guile-2.0-dev libsdl1.2debian libart-2.0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev
    ;;
2)
    echo "older than ubuntu 18.04"
    sudo apt-get install gcc libsdl-image1.2 libsdl-image1.2-dev guile-1.8 guile-1.8-dev libsdl1.2debian libart-2.0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev build-essential
    ;;
*) echo "invalid option" ;;
esac

CPPFLAGS="$CPPFLAGS $(pkg-config --cflags-only-I guile-2.0)" CFLAGS="$CFLAGS $(pkg-config --cflags-only-other guile-2.0)" LDFLAGS="$LDFLAGS $(pkg-config --libs guile-2.0)"

wget https://github.com/psych-d/graphics.h/raw/main/archive/libgraph-1.0.2.tar.gz

tar -xvf libgraph-1.0.2.tar.gz

cd libgraph-1.0.2 && ./configure --disable-guile && sudo make && sudo make install && sudo cp /usr/local/lib/libgraph.* /usr/lib
cd ..
sudo rm -r libgraph-1.0.2
sudo rm libgraph-1.0.2.tar.gz

echo "Successfully installed !"
