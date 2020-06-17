#!/bin/sh
apt-get install -y asterisk asterisk-dev
cd /usr/src/

wget https://github.com/haha8x/asterisk-chan-dongle-16/archive/master.zip

unzip master.zip

rm -f master.zip

cd asterisk-chan-dongle-16-master



./bootstrap
./configure --with-astversion=16.2.1
make
make install

cp etc/dongle.conf /etc/asterisk/
cd ..

rm -rf asterisk-chan-dongle-16-master
chown asterisk:asterisk /etc/asterisk/dongle.conf
chmod u=rwX,g=rX,o= /etc/asterisk/dongle.conf
echo 'KERNEL=="ttyUSB*", MODE="0666", OWNER="asterisk", GROUP="dialout"' > /etc/udev/rules.d/92-dongle.rules
