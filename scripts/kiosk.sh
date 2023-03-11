#!/bin/bash
set -eu -o pipefail

export DEBIAN_FRONTEND=noninteractive

puppet_dir='/etc/puppet'
home_dir='/home/pi'


# Package install
apt-get -y install \
    puppet \
    git

cd $home_dir
git clone https://github.com/PeterJCLaw/srcomp-kiosk
cd srcomp-kiosk
git submodule update --init --recursive

chown 1000:1000 -R $home_dir/srcomp-kiosk
ln -s $home_dir/srcomp-kiosk $puppet_dir

# Run puppet config at boot
mv /tmp/packer/kiosk/kiosk-puppet.service /usr/lib/systemd/system/
chmod 644 /usr/lib/systemd/system/kiosk-puppet.service
systemctl enable kiosk-puppet.service
