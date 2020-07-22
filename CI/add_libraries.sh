
cp /usr/local/lib/libhpx_component_storaged.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpx_iostreamsd.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpx_partitioned_vectord.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpx_phylanxd.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpx_processd.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpx_unorderedd.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libhpxd.so* /github/home/phylanx-0.0.1/phylanx-libs/
cp /usr/local/lib/libphylanx_commond.so* /github/home/phylanx-0.0.1/phylanx-libs/

cp /lib/x86_64-linux-gnu/libboost_filesystem.so.1.67.0 /github/home/phylanx-0.0.1/phylanx-libs/boost
cp /lib/x86_64-linux-gnu/libboost_program_options.so.1.67.0 /github/home/phylanx-0.0.1/phylanx-libs/boost
cp /lib/x86_64-linux-gnu/libboost_system.so.1.67.0 /github/home/phylanx-0.0.1/phylanx-libs/boost

cp /usr/lib/x86_64-linux-gnu/blas/libblas.so.3.8.0 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /lib/x86_64-linux-gnu/libgfortran.so.5.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /lib/x86_64-linux-gnu/libhwloc.so.5.7.10 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /usr/lib/x86_64-linux-gnu/lapack/liblapack.so.3.8.0 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /lib/x86_64-linux-gnu/libnuma.so.1.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /lib/x86_64-linux-gnu/libquadmath.so.0.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /usr/lib/x86_64-linux-gnu/libltdl.so.7.3.1 /github/home/phylanx-0.0.1/phylanx-libs/extras
cp /usr/lib/x86_64-linux-gnu/libatomic.so.1.2.0 /github/home/phylanx-0.0.1/phylanx-libs/extras

rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_component_storaged.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_iostreamsd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_partitioned_vectord.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_phylanxd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_processd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpx_unorderedd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libhpxd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/libphylanx_commond.so

rm /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_io_countersd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_memoryd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_parcel_coalescingd.so
rm /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_sined.so

mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_component_storaged.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_component_storaged.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_iostreamsd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_iostreamsd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_partitioned_vectord.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_partitioned_vectord.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_phylanxd.so.0.0.1 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_phylanxd.so.0
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_processd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_processd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpx_unorderedd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpx_unorderedd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libhpxd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/libhpxd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/libphylanx_commond.so.0.0.1 /github/home/phylanx-0.0.1/phylanx-libs/libphylanx_commond.so.0

mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libblas.so.3.8.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/libblas.so.3
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libgfortran.so.5.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/libgfortran.so.5
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libhwloc.so.5.7.10 /github/home/phylanx-0.0.1/phylanx-libs/extras/libhwloc.so.5
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/liblapack.so.3.8.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/liblapack.so.3
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libnuma.so.1.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/libnuma.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libquadmath.so.0.0.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/libquadmath.so.0
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libatomic.so.1.2.0 /github/home/phylanx-0.0.1/phylanx-libs/extras/libatomic.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/extras/libltdl.so.7.3.1 /github/home/phylanx-0.0.1/phylanx-libs/extras/libltdl.so.7

mv /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_io_countersd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_io_countersd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_memoryd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_memoryd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_parcel_coalescingd.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_parcel_coalescingd.so.1
mv /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_sined.so.1.5.0 /github/home/phylanx-0.0.1/phylanx-libs/hpx/libhpx_sined.so.1
