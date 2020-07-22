cp /phylanx_src/build/dist/phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl /root/
wheel unpack /root/phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl
mkdir /root/phylanx-0.0.1/phylanx-libs
mkdir /root/phylanx-0.0.1/phylanx-libs/boost
mkdir /root/phylanx-0.0.1/phylanx-libs/extras
cp -r /usr/local/lib/phylanx /root/phylanx-0.0.1/phylanx-libs/
cp -r /usr/local/lib/hpx /root/phylanx-0.0.1/phylanx-libs/
