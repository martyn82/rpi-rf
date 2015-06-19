#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

rm -r -- /tmp/wiringpi 2> /dev/null

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

mkdir -p $DIR/../bin

cp kaku $DIR/../bin
cp action $DIR/../bin
cp blokker $DIR/../bin
cp elro $DIR/../bin

echo "Done. You can now build the docker image."
