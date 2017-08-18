#!/bin/bash

sh ./basics.sh

sh ./hdd-persistent.sh
sh ./ssd-persistent.sh
sh ./ssd-local.sh
sh ./bucket.sh
sh ./symlink.sh

sh ./nvidia-driver.sh
sh ./cudnn.sh

sh ./python.sh
sh ./opencv.sh
sh ./pytorch.sh