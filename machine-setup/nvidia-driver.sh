#!/bin/sh

add-apt-repository ppa:graphics-drivers/ppa
apt-get update
apt-get -y install nvidia-381
cat /proc/driver/nvidia/version

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb -P /home/luoa/downloads
mv /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
dpkg -i /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64.deb
apt-get update
apt-get -y install cuda

wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/patches/2/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb -P /home/luoa/downloads
mv /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64-deb /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb
dpkg -i /home/luoa/downloads/cuda-repo-ubuntu1604-8-0-local-cublas-performance-update_8.0.61-1_amd64.deb

echo '' >> ~/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source /home/luoa/.bashrc

mv /usr/lib/nvidia-375/libEGL.so.1 /usr/lib/nvidia-375/libEGL.so.1.org
mv /usr/lib32/nvidia-375/libEGL.so.1 /usr/lib32/nvidia-375/libEGL.so.1.org
ln -s /usr/lib/nvidia-375/libEGL.so.375.82 /usr/lib/nvidia-375/libEGL.so.1
ln -s /usr/lib32/nvidia-375/libEGL.so.375.82 /usr/lib32/nvidia-375/libEGL.so.1
