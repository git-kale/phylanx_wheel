git clone https://github.com/NixOS/patchelf /patchelf_src
cd /patchelf_src
git apply /wheel_src/patchelf-largefile-handle.patch
./bootstrap.sh
./configure
make install -j $(nproc)
