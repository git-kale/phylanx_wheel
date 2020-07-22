# PIP Package of the Phylanx Project

## Phylanx: An Asynchronous Distributed Array Computing Toolkit

Find the project website [here](http://phylanx.stellar-group.org/). This repository contains the wheel file and steps to recreate the wheel on different systems

* Note: The package is still in developement, and should be installed on failsafe enviroment like docker.


### Basic Installation
```
git lfs clone https://github.com/git-kale/phylanx_wheel.git
cd phylanx_wheel
pip3 install phylanx-0.0.1-cp37-cp37m-linux_x86_64.whl
export PHYLANX_PLUGINS_PATH=/usr/local/lib/python3.7/phylanx-libs/phylanx
```
### Testing on Docker 
Note that the wheel file is stored on git lfs as github doesnt allow files larger than 64MB in a repository. Docker pulls the wheel from the lfs and runs it on phylanx. The inside the repository run:
```
cd testing/
docker build -t <build_name> .
```

The docker image with preinstalled wheel is available on dockerhub for testing. A CI will be added to create the wheel files and update the images.

```
docker pull f14kym0n573r/phylanx-wheel-dev:beta
```
### Building of Wheel

Tools used:

[wheel](https://pypi.org/project/wheel/) <br>
[patchelf](https://github.com/NixOS/patchelf.git) <br>
ldd<br>
git<br>
[cmake](https://pypi.org/project/cmake/)<br>

#### Steps to create the wheel
1. Pull the [container](https://hub.docker.com/layers/stellargroup/phylanx_base/prerequisites/images/sha256-438dd7c86cbf608615c6a6effe9f2553b96c2e7b6c9a7c3772b9b43aeec26820?context=explore) with all the dependencies of Phylanx preinstalled.
```
docker pull stellargroup/phylanx_base:prerequisites
```
2. Install BlazeTensor on the docker
```
git clone https://github.com/STEllAR-GROUP/blaze_tensor.git --depth=1 /blaze_tensor
cmake -H/blaze_tensor -B/blaze_tensor/build
cmake --build /blaze_tensor/build --target install
```
3. Clone the phylanx repository. Refer [this](https://github.com/STEllAR-GROUP/phylanx/pull/1204#) PR for code changes or use this [patch](https://github.com/git-kale/phylanx_wheel/blob/master/phylanx-wheel-output.patch).
```
git clone https://github.com/STEllAR-GROUP/phylanx.git /phylanx
cd /phylanx
git apply <patch-location>
```
*Note*: Install wheel package if it is not installed [pip3 install wheel]

4. Build Phylanx
```
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DHPX_DIR=/usr/local/lib/cmake/HPX/ -Dblaze_DIR=/usr/local/share/blaze/cmake/ -Dpybind11_DIR=/usr/local/share/cmake/pybind11/ ..
make -j $(nproc)
make install -j $(nproc)
```
5. A wheel file will be generated at /phylanx/build/dist/\<wheel-file>. This wheel file contains only one shared library *_phylanxd.cpython-37m-x86_64-linux-gnu.so*. Move and unpack the wheel file to /root.
```
cp /phylanx/build/dist/<wheel-file> /root/
wheel unpack <wheel-file>
```
6. There are various shared libs that now need to be moved inside the wheel to make a it a standalone package.
* Phylanx : /phylanx/build/libs && /usr/local/lib
* HPX : /usr/local/lib
* Other deps : /lib/x86_64-linux-gnu/

    To check all the dependencies of phylanx libs
    ```
    find /phylanx/build/lib -name "*.so*" | xargs -I{} patchelf --print-needed {} | sort | uniq
    ```
    
    So the deps can be classified into 3 types:
    - Phylanx Dependencies  (/phylanx-libs && /phylanx-libs/phylanx)
    - HPX Dependecnies      (/phylanx-libs && /phylanx-libs/hpx)
    - Boost Dependencies    (/phylanx-libs/boost)
    - Extra Dependecnies    (/phylanx-libs/extras)
    ```            
                     ___________________
                    |                  ↓
    Phylanx ----> HPX ---> Boost ---> Extra
       |_____________________↑           ↑           
       |_________________________________|
       
    ```
7. Inside the unpacked wheel create a folder /phylanx-libs that will contain all the binary dependencies of the project. Copy all the dependencies within the package. (See Packaging for more info)
```
.
|-- phylanx
|   |-- ast
|   |-- core
|   |-- execution_tree
|   |-- plugins
|   `-- util
|-- phylanx-0.0.1.dist-info
`-- phylanx-libs
    |-- boost
    |-- extras
    |-- hpx
    `-- phylanx
```
8.  Phylanx contains symlinks and the binary in the package. Some of the dependencies are on symlinks rather than actual libraries eg. *_phylanxd.cpython-37m-x86_64-linux-gnu.so* has dependency on *_libhpx_phylax(d).so.1*. Therefore we need to rename(as symlink) and copy the actual binaries to *phylanx-libs*. Repeat this step for all the dependencies

eg. For a dependecy libfoo.so.0 which links to /path/to/libbfoo.so.0.0.1 and needs to be put in location extras.
````
readlink -f libfoo.so.0        // Ouputs : /path/to/libbfoo.so.0.0.1
cp /path/to/libbfoo.so.0.0.1 phylanx-libs/extras
mv libbfoo.so.0.0.1 libbfoo.so.0
````

9. Running a simple unix check shows that the rpaths of the libraries are not correct. The ouptut shows which libraries was linker unable to find due to incorrect rpath.
```
find <unpacked-wheel> -name "*.so*" | xargs -I{} ldd {} | grep "not found"
```

10. Use patchelf to change the rpath of shared libraries as explained below. The correctness of the rpaths can be verified similar to Step 8. 

11. Now pack the wheel file again. 
```
wheel pack <unpacked-wheel>
```

12. This wheel can be tested as per Test Instructions.

### Packaging

A wheel is basically a zip file with a different extension name.
The wheel uses zipfile library to compress the package into the wheel. The zipfile has an open issue about handling symlinks [https://bugs.python.org/issue27318].
So when a wheel [a zip file] is installed it basically unpacks libraries into their install location. While doing so the symlinks are not preserved they are replaced by their respective libs.

Phylanx contains various symlinks and the the binary in package i.e. *_phylanxd.cpython-37m-x86_64-linux-gnu.so* has dependency on symlink rather than actual binary. Therefore we need to rename(as symlink) and copy the actual binaries to *phylanx-libs*.

For finding plugins PHYLANX_PLUGIN_PATH needs to be set to *phylanx-libs/phylanx*

### Working with patchelf Tool

The patchelf tool can only patch binaries upto 32MB. Phylanx contains binaries which would not work with the tool. A simple [patch](https://github.com/git-kale/phylanx_wheel/patchelf-largefile-handle.patch) can make the tool work with certain [limitations](https://github.com/NixOS/patchelf/issues/62#issuecomment-148918355).

Our requirement is to set relative rpaths so that the wheel will work indepedent of installation location. The special variable $ORIGIN can be used for this purpose.

*$ORIGIN is a special variable that means ‘this executable’, and it means the actual executable filename, as readlink would see it, so symlinks are followed.  In other words, $ORIGIN is special and resolves to wherever the binary is at runtime.*

**Installation**
```
git clone https://github.com/NixOS/patchelf.git
cd patchelf/
git apply <patchelf-patch>
```
*Note: If patchelf command is not found the binary located in /use/local/bin can be used. Replace *patchelf* with */usr/local/bin/patchelf* in this case.

**Checking rpath of binary**
```
patchelf --print-rpath libfoo.so
```
**Checking the dependencies of binary**
```
patchelf --print-needed libfoo.so
```
**Setting rpath to a relative path ./a and ./b**
```
patchelf --set-rpath '$ORIGIN/a:$ORIGIN/b' libfoo.so
```
### Debugging the package

There are 2 parts of the library: Python & Bianary. Python errors can be found and recitified using the error message on execution of tests. If error is while using the binary part, A segmaentation fault is occured.
gdb 7 extended the support to debug cpython packages. Vanilla gdb can hence be used to debug the segfaults during execution. 
```
gdb python3
run <test.py>
backtrace
```
*Note:* Install gdb for debugging

### Testing

The testfiles are in *testing/python* folder.
As of now wheel passes all the tests that the build system passes.
 
Failing Tests in test-suite
````
test_nodes.py
test_symbol_table.py
````
The reason for failing the tests is the misspelled name of package in the test.