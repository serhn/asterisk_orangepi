# for 
```sh
apt-get install asterisk
apt-get install asterisk-dev
cd /usr/src/
wget https://github.com/oleg-krv/asterisk-chan-dongle/archive/asterisk13.zip

unzip asterisk13.zip
rm -f asterisk13.zip
cd asterisk-chan-dongle-asterisk13
aclocal && autoconf && automake -a
./configure
make
make install
chown asterisk:asterisk /etc/asterisk/dongle.conf
chmod u=rwX,g=rX,o= /etc/asterisk/dongle.conf
echo 'KERNEL=="ttyUSB*", MODE="0666", OWNER="asterisk", GROUP="dialout"' > /etc/udev/rules.d/92-dongle.rules
```
