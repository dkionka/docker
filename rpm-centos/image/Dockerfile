# Create centos environment for building RPMs.

# currently centos:7
FROM centos:latest

# Install RPM tools.
# Also need wget for pulling down source during RPM build.
RUN \
	yum update -y && \
	yum groupinstall -y "Development Tools" && \
	yum install -y centos-packager rpmdevtools wget
