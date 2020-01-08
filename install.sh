#!/bin/bash

# Copyright © 2019 UnravelTEC
# Michael Maier <michael.maier+github@unraveltec.com>
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
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# If you want to relicense this code under another license, please contact info+github@unraveltec.com.

if [ ! "$1" ]; then
  echo
  #aptitude update
  # python3-paho-mqtt buster only
  #aptitude install python3-pip python3-setuptools mosquitto python3-paho-mqtt python3-rpi.gpio
 # pip3 install adafruit-blinka adafruit-circuitpython-sgp30
  # for stretch
  # pip3 install paho-mqtt
fi

targetdir=/usr/local/bin/

mkdir -p $targetdir

exe1=MAX6675-temp.py
serv1=MAX6675.service

rsync -raxc --info=name $exe1 $targetdir

rsync -raxc --info=name $serv1 /etc/systemd/system/

systemctl daemon-reload
systemctl enable $serv1 && echo "systemctl enable $serv1 OK"
systemctl restart $serv1 && echo "systemctl restart $serv1 OK"
