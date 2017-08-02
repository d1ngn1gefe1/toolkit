#!/bin/sh

apt-get -y install build-essential cmake git
apt-get -y install pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy
apt-get -y install libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
apt-get -y install libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev
apt-get -y install libvorbis-dev libxvidcore-dev v4l-utils python-vtk
apt-get -y install liblapacke-dev libopenblas-dev checkinstall
apt-get -y install libgdal-dev

cd ~/downloads
wget -O opencv.zip https://github.com/opencv/opencv/archive/3.2.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.2.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-3.2.0 opencv
mv opencv_contrib-3.2.0 opencv_contrib

cd ~/downloads/opencv
mkdir ~/downloads/opencv/build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
	  -D CMAKE_INSTALL_PREFIX=/usr/local \
	  -D INSTALL_C_EXAMPLES=ON \
	  -D INSTALL_PYTHON_EXAMPLES=ON \
	  -D OPENCV_EXTRA_MODULES_PATH=~/downloads/opencv_contrib/modules \
	  -D BUILD_EXAMPLES=ON ..
make -j32
sudo make install
sudo ldconfig