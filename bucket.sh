#!/bin/sh

mkdir /mnt/bucket
chown luoa:luoa /mnt/bucket
chmod 777 /mnt/bucket

export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

apt-get update
apt-get -y install gcsfuse
apt-get update && apt-get upgrade
