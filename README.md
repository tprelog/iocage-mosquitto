# iocage-mosquitto
Artifact file(s) for [Eclipse Mosquitto](https://mosquitto.org/)

#### Eclipse Mosquitto (MQTT Broker) plugin for FreeNAS 11

 - This branch is for FreeNAS 11.3

**Download plugin and install**

    wget -O /tmp/mosquitto.json https://raw.githubusercontent.com/tprelog/iocage-mosquitto/11.3-RELEASE/mosquitto.json
    sudo iocage fetch -P /tmp/mosquitto.json --branch '11.3-RELEASE'

---

###### Edit `mosquitto` config file from FreeNAS console

    sudo iocage exec mosquitto ee /usr/local/etc/mosquitto/mosquitto.conf

###### Restart `mosquitto`

    sudo iocage exec mosquitto service mosquitto restart

###### Testing subscribe or publish from FreeNAS console

    sudo iocage exec mosquitto mosquitto_sub -d -t /dev/test
    sudo iocage exec mosquitto mosquitto_pub -d -t /dev/test -m "Hello World"

###### To see a list of jails as well as their ip address

    sudo iocage list -l
    +-----+-------------+------+-------+----------+-----------------+---------------------+-----+----------+
    | JID |    NAME     | BOOT | STATE |   TYPE   |     RELEASE     |         IP4         | IP6 | TEMPLATE |
    +=====+=============+======+=======+==========+=================+=====================+=====+==========+
    | 1   | mosquitto   | on   | up    | pluginv2 | 11.3-RELEASE-p5 | epair0b|192.0.1.86  | -   | -        |
    +-----+-------------+------+-------+----------+-----------------+---------------------+-----+----------+

- Tested on FreeNAS-11.3-RC1
- More information about [iocage plugins](https://doc.freenas.org/11.3/plugins.html) and [iocage jails](https://doc.freenas.org/11.3/jails.html) can be found in the [FreeNAS guide](https://doc.freenas.org/11.3/intro.html#introduction)
