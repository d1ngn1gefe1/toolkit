#!/bin/sh

apt-get update
apt-get upgrade
apt-get -y install build-essential cmake g++ gfortran git pkg-config python-dev software-properties-common wget htop imagemagick
apt-get autoremove
rm -rf /var/lib/apt/lists/*
