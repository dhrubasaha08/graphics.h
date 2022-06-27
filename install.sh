# Auto install graphics.h in Ubuntu using bash script
# Copyright (C) 2022  Dhruba Saha
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#!/bin/bash


#installing dependencies
sudo apt update
sudo apt-get update
sudo apt install gcc g++ make -y
sudo apt-get install libsdl-image1.2 libsdl1.2-dev libsdl-image1.2-dev libaudiofile-dev libdirectfb-dev libdirectfb-extra libfreetype6-dev libxext-dev x11proto-xext-dev libfreetype6 libaa1 libaa1-dev libslang2-dev libasound2 libasound2-dev libsdl1.2debian libart-2.0-dev -y


#installing library
wget https://github.com/dhrubasaha08/graphics.h/raw/main/archive/libgraph-1.0.2.tar.gz
tar -xvf libgraph-1.0.2.tar.gz
cd libgraph-1.0.2 && ./configure --disable-guile && sudo make && sudo make install && sudo cp /usr/local/lib/libgraph.* /usr/lib


#cleaning after installation
cd .. && sudo rm -r libgraph-1.0.2 && sudo rm libgraph-1.0.2.tar.gz


#clecking installation status
wget https://github.com/dhrubasaha08/graphics.h/raw/main/archive/check.c
gcc check.c -lgraph -o check
if [ $# -eq 0 ] ;  then
    echo "successfully installed !"
    rm check check.c
else
    echo "installation failed !"
    rm check.c
fi
