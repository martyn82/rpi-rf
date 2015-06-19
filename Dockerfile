FROM hypriot/rpi-gpio
MAINTAINER Martijn Endenburg <martijn.endenburg@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

COPY bin/kaku /kaku
COPY bin/action /action
COPY bin/blokker /blokker
COPY bin/elro /elro
