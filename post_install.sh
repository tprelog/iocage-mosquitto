#!/bin/sh

CONFIG="/usr/local/etc/mosquitto/mosquitto.conf"

# Provide a minimal configuration for mosquitto
cp ${CONFIG}.plugin ${CONFIG}

DBPATH="$(grep ^persistence_location ${CONFIG} | awk '{print($2)}')"
PWFILE="$(grep ^password_file ${CONFIG} | awk '{print($2)}')"
USER="$(grep ^user ${CONFIG} | awk '{print($2)}')"

# Create a non-root user to run the broker
pw adduser -u 1883 -n "${USER}" -w no -d /nonexistent

# Install a directory for the mosquitto.db
install -d -g "${USER}" -m 755 -o "${USER}" -- "${DBPATH}"

# Install an empty password file
install -m 644 -- /dev/null "${PWFILE}"

sysrc mosquitto_enable="YES"
service mosquitto start || exit 1
