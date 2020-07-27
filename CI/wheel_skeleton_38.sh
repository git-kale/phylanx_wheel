cp /phylanx_src/build/dist/phylanx-0.0.1-cp38-cp38-linux_x86_64.whl /github/home/
wheel unpack /github/home/phylanx-0.0.1-cp38-cp38-linux_x86_64.whl -d /github/home/
mkdir /github/home/phylanx-0.0.1/phylanx-libs
mkdir /github/home/phylanx-0.0.1/phylanx-libs/boost
mkdir /github/home/phylanx-0.0.1/phylanx-libs/extras
cp -r /usr/local/lib/phylanx /github/home/phylanx-0.0.1/phylanx-libs/
cp -r /usr/local/lib/hpx /github/home/phylanx-0.0.1/phylanx-libs/