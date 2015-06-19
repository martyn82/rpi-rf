#!/bin/bash

set -e

git clone git://git.drogon.net/wiringPi && \
cd wiringPi && \
git pull origin && \
./build

gpio -v && gpio readall

cd examples && \
wget -O lights.zip https://www.dropbox.com/s/nxdrkuk94w9fpqo/lights.zip?dl=1 && \
unzip lights.zip && \
cd lights

echo "Compiling switches..."

g++ -o kaku kaku.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o action action.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o blokker blokker.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi
g++ -o elro elro.cpp -I/usr/local/include -L/usr/local/lib -lwiringPi

mv kaku /kaku
mv action /action
mv blokker /blokker
mv elro /elro

chmod +x /kaku
chmod +x /action
chmod +x /blokker
chmod +x /elro
