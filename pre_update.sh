#!/bin/sh

_DBPATH="/var/db/mosquitto"

# Create a non-root user (mosquitto) to run the broker
id -u mosquitto  > /dev/null 2>&1 \
|| pw adduser -u 1883 -n mosquitto -w no -d /nonexistent

# Create a directory for mosquitto.db (used when persistence is set to true)
if [ ! -d "${_DBPATH}" ]; then
  install -d -g mosquitto -o mosquitto -m 755 -- ${_DBPATH}
fi
