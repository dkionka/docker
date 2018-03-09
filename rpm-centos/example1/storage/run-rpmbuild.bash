#!/bin/bash -epux

subdir=storage

# sanity check
id
pwd
echo HOME=$HOME

# set up
cd
rpmdev-setuptree
ls -al
cp $subdir/hello.spec rpmbuild/SPECS

# download sources
cd rpmbuild/SOURCES
wget http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz

# build RPM
cd ../SPECS
rpmbuild -ba hello.spec

# what did we get?
cp -af ../RPMS $HOME/$subdir/

echo $0: Succeeded
