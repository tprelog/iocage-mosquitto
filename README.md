# iocage-mosquitto
Artifact file(s) for [Eclipse Mosquitto](https://mosquitto.org/)

---
## iocage-plugin-mosquitto

 - This script will by default create a plugin-jail for Eclipse Mosquitto on FreeNAS 11.2 

**Download plugin and install**

    wget -O /tmp/mosquitto.json http://gitlab.local/troy/iocage-mosquitto/raw/master/mosquitto.json
    sudo iocage fetch -P dhcp=on vnet=on bpf=yes -n /tmp/mosquitto.json --branch 'master'

---
---
###### Edit `mosquitto` config file from FreeNAS console

    sudo iocage exec mosquitto ee /usr/local/etc/mosquitto/mosquitto.conf

###### Restart `mosquitto`

    sudo iocage exec service mosquitto restart

###### Testing subscribe or publish from FreeNAS console

    sudo iocage exec mosquitto mosquitto_sub -d -t /dev/test
    sudo iocage exec mosquitto mosquitto_pub -d -t /dev/test -m "Hello World"

---
---
### iocage-jail-mosquitto

 - You can also use a pkg-list quickly to create a standard-jail for Mosquitto
 
**Download pkg-list and create a jail using it to install requirements**

    wget -O /tmp/pkglist.json http://gitlab.local/troy/iocage-mosquitto/raw/master/pkg-list.json
    sudo iocage create -r 11.2-RELEASE boot=on dhcp=on bpf=yes vnet=on -p /tmp/pkglist.json -n mosquitto

**Enable and start the service**

    sudo iocage exec mosquitto sysrc /etc/rc.conf mosquitto_enable="YES"
    sudo iocage exec mosquitto service mosquitto start

---
###### To see a list of jails as well as their ip address

    sudo iocage list -l
    +-----+-------------+------+-------+----------+-----------------+---------------------+-----+----------+
    | JID |    NAME     | BOOT | STATE |   TYPE   |     RELEASE     |         IP4         | IP6 | TEMPLATE |
    +=====+=============+======+=======+==========+=================+=====================+=====+==========+
    | 1   | mosquitto   | on   | up    | pluginv2 | 11.2-RELEASE-p4 | epair0b|192.0.1.86  | -   | -        |
    +-----+-------------+------+-------+----------+-----------------+---------------------+-----+----------+
    | 2   | mosquitto_2 | on   | up    | jail     | 11.2-RELEASE-p4 | epair0b|192.0.1.79  | -   | -        |
    +-----+-------------+------+-------+----------+-----------------+---------------------+-----+----------+


Tested on FreeNAS-11.2-BETA3  
More information about [iocage plugins](https://doc.freenas.org/11.2/plugins.html) and [iocage jails](https://doc.freenas.org/11.2/jails.html) can be found in the [FreeNAS guide](https://doc.freenas.org/11.2/intro.html#introduction)  
This script should also still work with FreeNAS 11.1
