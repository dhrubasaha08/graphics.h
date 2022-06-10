#!/bin/bash

sudo apt-get update
sudo apt-get upgrade -y
sudo apt install gcc g++ make make-guile -y
sudo apt-get install libsdl-image1.2 libsdl1.2-dev libsdl-image1.2-dev libaudiofile-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev build-essential libsdl1.2debian libart-2.0-dev -y

###     os selection menu   ###

echo "Select OS Version"

#echo "<serial>. <distro_name> <code_name> XX.XX.XX"

echo "1. Ubuntu Xenial 16.04.XX"
echo "2. Ubuntu Bionic 18.04.XX"
echo "3. Ubuntu Focal 20.04.XX"
echo "4. Ubuntu Jammy 22.04.XX"

read option
case $option in

1)
    echo "Ubuntu Xenial 16.04.XX"
    sudo add-apt-repository universe -y
    sudo apt install guile-1.8 guile-1.8-dev -y
    ;;
2)
    echo "Ubuntu Bionic 18.04.XX"
    sudo apt install guile-2.0 guile-2.0-dev -y
    ;;
3)
    echo "Ubuntu Focal 20.04.XX"
    sudo apt install guile-1.8 guile-1.8-dev -y
    ;;

4)
    echo "Ubuntu Jammy 22.04.XX"
    sudo apt install guile-1.8 guile-1.8-dev -y
    ;;
*) echo "invalid option" ;;
esac

###     end of os selection menu    ###

CPPFLAGS="$CPPFLAGS $(pkg-config --cflags-only-I guile-2.0)" CFLAGS="$CFLAGS $(pkg-config --cflags-only-other guile-2.0)" LDFLAGS="$LDFLAGS $(pkg-config --libs guile-2.0)"

wget https://github.com/psych-d/graphics.h/raw/main/archive/libgraph-1.0.2.tar.gz

tar -xvf libgraph-1.0.2.tar.gz

cd libgraph-1.0.2 && ./configure --disable-guile && sudo make && sudo make install && sudo cp /usr/local/lib/libgraph.* /usr/lib
cd ..
sudo rm -r libgraph-1.0.2
sudo rm libgraph-1.0.2.tar.gz

echo "Successfully installed !"
