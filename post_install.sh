#!/bin/sh

sysrc -f /etc/rc.conf mosquitto_enable="YES"
service mosquitto start 2>/dev/null
