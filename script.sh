#!/bin/sh
apt-get install -y asterisk asterisk-dev
cd /usr/src/

wget https://github.com/wdoekes/asterisk-chan-dongle/archive/master.zip

apt install -y unzip autotools-dev automake gcc libsqlite3-dev make

unzip master.zip

rm -f master.zip

cd asterisk-chan-dongle-master



./bootstrap
./configure --with-astversion=16.2.1
make
make install

cp etc/dongle.conf /etc/asterisk/
cd ..

rm -rf asterisk-chan-dongle-master
chown asterisk:asterisk /etc/asterisk/dongle.conf
chmod u=rwX,g=rX,o= /etc/asterisk/dongle.conf
echo 'KERNEL=="ttyUSB*", MODE="0666", OWNER="asterisk", GROUP="dialout"' > /etc/udev/rules.d/92-dongle.rules
