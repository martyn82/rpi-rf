#!/bin/bash

set -e

mkdir -p /tmp/wiringpi && \
cd /tmp/wiringpi

git clone git://git.drogon.net/wiringPi && \
cd wiringPi && \
git pull origin && \
cat build | sed s/sudo//g > build_no_sudo && \
chmod +x build_no_sudo && \
./build_no_sudo

gpio -v && gpio readall

cd examples && \
wget -O lights.zip https://www.dropbox.com/s/nxdrkuk94w9fpqo/lights.zip?dl=1 && \
unzip lights.zip && \
cd lights

g++ -o kaku kaku.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o action action.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o blokker blokker.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o elro elro.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi