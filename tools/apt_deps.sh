#!/bin/bash
## Installs all package manager dependencies
## FROM ubuntu:14.04

apt-get update
ln -s -f bash /bin/sh
ln -s /usr/bin/pip2 /usr/local/bin/pip
apt-get install -y zlib1g-dev \
                   libatlas3-base \
                   python2.7-dev \
                   libblas3 \
                   libblas-dev \
                   liblapack3 \
                   liblapack-dev \
                   libc6 \
                   software-properties-common \
                   gfortran \
                   make \
                   ant \
                   gcc \
                   g++ \
                   wget \
                   automake \
                   git \
                   curl \
                   libboost-dev \
                   libboost-all-dev \
                   libevent-dev \
                   libdouble-conversion-dev \
                   libtool \
                   liblz4-dev \
                   liblzma-dev \
                   binutils-dev \
                   libjemalloc-dev \
                   pkg-config \
                   libtesseract-dev \
                   libopenblas-dev \
                   libblas-dev \
                   libatlas-dev \
                   libatlas-base-dev \
                   libiberty-dev \
                   liblapack-dev \
                   zip \
                   unzip \
                   sox \
                   libsox-dev \
                   autoconf \
                   autoconf-archive \
                   bison \
                   swig \
                   python-pip \
                   subversion \
                   libssl-dev \
                   libprotoc-dev \
                   supervisor \
                   flac \
                   gawk \
                   imagemagick \
                   libgflags-dev libgoogle-glog-dev liblmdb-dev \
                   libleveldb-dev libsnappy-dev libhdf5-serial-dev \
                   bc \
                   python-numpy \
                   flex \
                   libkrb5-dev \
                   libsasl2-dev \
                   libnuma-dev \
                   scons \
                   python-gi \
                   python-gobject \
                   python-gobject-2 \
                   vim \
                   memcached \
                   libyaml-dev \
                   libffi-dev \
                   libbz2-dev \
                   python-yaml \
                   python-gi python3-gi \
                   gstreamer1.0-tools \
                   gir1.2-gstreamer-1.0 \
                   gir1.2-gst-plugins-base-1.0 \
                   gstreamer1.0-plugins-good \
                   gstreamer1.0-plugins-ugly \
                   gstreamer1.0-plugins-bad \
                   gstreamer1.0-libav \
&& pip install virtualenv ws4py
