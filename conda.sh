#!/bin/sh

wget https://repo.continuum.io/archive/Anaconda3-4.4.0-Linux-x86_64.sh -P /home/luoa/downloads
bash /home/luoa/downloads/Anaconda3-4.4.0-Linux-x86_64.sh
conda install --yes pytorch torchvision cuda80 -c soumith
conda install --yes -c menpo opencv3
