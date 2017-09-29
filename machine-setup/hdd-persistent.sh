#!/bin/sh

mkdir /mnt/hdd-persistent
chown luoa:luoa /mnt/hdd-persistent
chmod 777 /mnt/hdd-persistent

sudo mkfs.ext4 -m 0 -F -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb

echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /mnt/hdd-persistent ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab

mount -a
