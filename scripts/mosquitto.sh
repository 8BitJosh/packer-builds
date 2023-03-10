#!/bin/bash
set -eu -o pipefail

export DEBIAN_FRONTEND=noninteractive

apt-get -y update

# Package install
apt-get -y install mosquitto mosquitto-clients

mv /tmp/packer/mosquitto/mosquitto.conf /etc/mosquitto/mosquitto.conf
chmod 644 /etc/mosquitto/mosquitto.conf
