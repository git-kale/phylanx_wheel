patchelf --set-rpath '$ORIGIN/../phylanx-libs:$ORIGIN/../phylanx-libs/boost:$ORIGIN/../phylanx-libs/extras' /root/phylanx-0.0.1/phylanx/_phylanxd.cpython-37m-x86_64-linux-gnu.so
patchelf --set-rpath '$ORIGIN/../:$ORIGIN/../../phylanx-libs/boost:$ORIGIN/../../phylanx-libs/extras' /root/phylanx-0.0.1/phylanx-libs/phylanx/*
patchelf --set-rpath '$ORIGIN/../:$ORIGIN/../boost:$ORIGIN/../extras' /root/phylanx-0.0.1/phylanx-libs/hpx/*
patchelf --set-rpath '$ORIGIN' /root/phylanx-0.0.1/phylanx-libs/boost/*
patchelf --set-rpath '$ORIGIN' /root/phylanx-0.0.1/phylanx-libs/extras/*
