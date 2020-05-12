#!/bin/sh

_CONFIG="/usr/local/etc/mosquitto/mosquitto.conf"
_DBPATH="/var/db/mosquitto"

# Create a non-root user (mosquitto) to run the broker
pw adduser -u 1883 -n mosquitto -w no

# Create a directory for mosquitto.db (used when persistence is set to true)
install -d -g mosquitto -o mosquitto -m 755 -- ${_DBPATH}

# Provide a minimal configuration (default options and comments removed)
mv "${_CONFIG}" "${_CONFIG}.orig"
cp "${_CONFIG}.plugin" "${_CONFIG}"

sysrc -f /etc/rc.conf mosquitto_enable="YES"
service mosquitto start 2>/dev/null
