#!/bin/sh

repo=/root/.iocage-mosquitto

if [ "$1" = "standard" ]; then
    cp "${repo}/overlay/etc/motd" "/etc/motd"
fi

sysrc -f /etc/rc.conf mosquitto_enable="YES"
service mosquitto start 2>/dev/null
