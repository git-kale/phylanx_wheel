git clone https://github.com/STEllAR-GROUP/phylanx /phylanx_src
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/git-kale/phylanx_wheel /wheel_src
cd /phylanx_src
git apply /wheel_src/phylanx-wheel-output.patch
git checkout d48b611bbc5337bc14ba93e4bf3cb
cmake -H/phylanx_src -B/phylanx_src/build -DCMAKE_BUILD_TYPE=Debug -DHPX_DIR=/usr/local/lib/cmake/HPX/ -Dblaze_DIR=/usr/local/share/blaze/cmake/ -Dpybind11_DIR=/usr/local/share/cmake/pybind11/
make install -C /phylanx_src/build -j $(nproc)
