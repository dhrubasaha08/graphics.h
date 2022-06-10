#!/bin/bash
sudo add-apt-repository universe
sudo apt-get update
sudo su -c 'echo -e "deb http://us.archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list'
sudo su -c 'echo -e "deb-src http://us.archive.ubuntu.com/ubuntu/ xenial main universe" >> /etc/apt/sources.list'
sudo apt-get update

echo "select ubuntu version"
echo " 1. 18.04 or newer"
echo " 2. older thean 18.04"

read option
case $option in
1)
    echo "ubuntu 18.04 or newer"
    sudo apt-get install libsdl-image1.2 libsdl-image1.2-dev guile-2.0 guile-2.0-dev libsdl1.2debian libart-2.0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev
    ;;
2)
    echo "older than ubuntu 18.04"
    sudo apt-get install libsdl-image1.2 libsdl-image1.2-dev guile-1.8 guile-1.8-dev libsdl1.2debian libart-2.0-dev libaudiofile-dev libesd0-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev build-essential
    ;;
*) echo "invalid option" ;;
esac

wget https://github.com/psych-d/graphics.h/raw/main/archive/libgraph-1.0.2.tar.gz

tar -xvf libgraph-1.0.2.tar.gz

cd libgraph-1.0.2 && ./configure && make && sudo make install && sudo cp /usr/local/lib/libgraph.* /usr/lib && cd ..
rm -r libgraph-1.0.2 
rm libgraph-1.0.2.tar.gz

echo "Successfully installed !"
