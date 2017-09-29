#!/bin/sh

apt-get update && apt-get install -y python-numpy python-scipy python-nose python-h5py python-skimage python-matplotlib python-pandas python-sklearn python-sympy
apt-get clean && apt-get autoremove
rm -rf /var/lib/apt/lists/*

apt-get update
apt-get install -y git python-dev python3-dev python-numpy python3-numpy build-essential python-pip python3-pip python-virtualenv swig python-wheel libcurl3-dev
apt-get install -y libfreetype6-dev libpng12-dev
pip3 install -U matplotlib ipython[all] jupyter pandas scikit-image Cython
