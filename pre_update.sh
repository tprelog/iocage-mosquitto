#!/bin/sh

# shellcheck disable=SC1091,2154
. /etc/rc.subr && load_rc_config mosquitto

CONFIG="${mosquitto_config:-/usr/local/etc/mosquitto/mosquitto.conf}"
DBPATH="$(grep ^persistence_location "${CONFIG}" | awk '{print($2)}')"
USER="$(grep ^user "${CONFIG}" | awk '{print($2)}')"

# https://mosquitto.org/documentation/migrating-to-2-0/
sed -i '' "s|^port|listener|" "${CONFIG}"

# Create a non-root user to run the broker
id -u "${USER}" > /dev/null 2>&1 \
|| pw adduser -u 1883 -n "${USER}" -w no -d /nonexistent

# Install a directory for mosquitto.db
if [ ! -d "${DBPATH}" ]; then
  install -d -g "${USER}" -m 755 -o "${USER}" -- "${DBPATH}"
fi
