#!/bin/sh

wget https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v6/prod/8.0_20170307/cudnn-8.0-linux-x64-v6.0-tgz -P /home/luoa/downloads
mv /home/luoa/downloads/cudnn-8.0-linux-x64-v6.0-tgz /home/luoa/downloads/cudnn-8.0-linux-x64-v6.0.tgz
tar xvf /home/luoa/downloads/cudnn-8.0-linux-x64-v6.0.tgz -C /home/luoa/downloads/
cd /home/luoa/downloads/cuda
cp */*.h /usr/local/cuda/include/
cp */libcudnn* /usr/local/cuda/lib64/
chmod a+r /usr/local/cuda/lib64/libcudnn*
cd /home/luoa

mv /usr/local/cuda-8.0/targets/x86_64-linux/lib/libcudnn.so.6 /usr/local/cuda-8.0/targets/x86_64-linux/lib/libcudnn.so.6.org
ln -s /usr/local/cuda-8.0/targets/x86_64-linux/lib/libcudnn.so.6.0.21 /usr/local/cuda-8.0/targets/x86_64-linux/lib/libcudnn.so.6