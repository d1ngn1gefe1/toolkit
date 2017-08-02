#!/bin/sh

mkdir /mnt/ssd-local
chown luoa:luoa /mnt/ssd-local
chmod 777 /mnt/ssd-local

apt-get update && apt-get -y install mdadm --no-install-recommend
mdadm --create /dev/md0 --level=0 --raid-devices=8 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000001 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000002 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000003 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000004 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000005 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000006 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000007 /dev/disk/by-id/nvme-nvme.1ae0-6e766d655f6361726400-6e766d655f6361726400-00000008
mkfs.ext4 -F /dev/md0s

mount -a
