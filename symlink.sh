#!/bin/sh

if [ -d "/mnt/hdd-persistent" ]; then
  ln -s /mnt/hdd-persistent /home/luoa/slowbro
else
  ln -s /mnt/ssd-persistent /home/luoa/slowbro
fi
ln -s /mnt/ssd-local /home/luoa/dragonite
ln -s /mnt/bucket /home/luoa/bucket
