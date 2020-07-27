pip3 install wheel pytest numpy

git clone https://github.com/STEllAR-GROUP/blaze_tensor.git --depth=1 /blaze_tensor
cmake -H/blaze_tensor -B/blaze_tensor/build
cmake --build /blaze_tensor/build --target install
