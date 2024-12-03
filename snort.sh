#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex zlib1g-dev liblzma-dev openssl libssl-dev cmake libhwloc-dev pkg-config luajit libluajit-5.1-dev libpcap-dev libdumbnet-dev libunwind-dev liblzma-dev zlib1g-dev libssl-dev libnghttp2-dev

# Clone the Snort repository
git clone https://github.com/snort3/snort3.git

# Navigate to the Snort directory
cd snort3

# Create a build directory
mkdir build
cd build

# Configure and build Snort
../configure_cmake.sh --prefix=/usr/local --enable-tcmalloc

# Compile and install Snort
make
sudo make install

# Update the library paths
sudo ldconfig

# Create Snort directories
sudo mkdir /etc/snort
sudo mkdir /etc/snort/rules
sudo mkdir /var/log/snort
sudo touch /etc/snort/rules/local.rules

# Automatically detect the network interface
NET_INTERFACE=$(ip route | grep default | sed -e "s/^.*dev.//" -e "s/.proto.*//")

# Test run Snort
snort -c /etc/snort/snort.conf -i $NET_INTERFACE

