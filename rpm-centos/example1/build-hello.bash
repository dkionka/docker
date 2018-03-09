#!/bin/bash -pux

# increment each time
container=rpm-2-try9

# when Dockerfile changes
image=rpm-4

# constants
subdir=storage
script=run-rpmbuild.bash
home_user=/root

# for debugging
interactive=1
interactive=0
if (( interactive )); then
	rm_opt="-it"
	cmd="bash"
else
	rm_opt="--rm"
	cmd="$home_user/$subdir/$script"
fi

# map PWD
cd $(dirname $0)
my_pwd=$(pwd | sed 's,/C/,//c/,i')

docker images
docker ps -a

# what is it going to run?
cat $subdir/$script
rm -rf $subdir/RPMS

time docker run \
	-v $my_pwd/$subdir:$home_user/$subdir \
	$rm_opt \
	--name $container \
	$image \
	$cmd

# what did we get?
find $subdir/RPMS
