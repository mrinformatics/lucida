####
# Builds the lucida base image
FROM ubuntu:14.04

#### environment variables
ENV LUCIDAROOT /usr/local/lucida/lucida
ENV THRIFT_ROOT /usr/local/lucida/tools/thrift-$THRIFT_VERSION
ENV LD_LIBRARY_PATH /usr/local/lib
ENV CAFFE /usr/local/lucida/tools/caffe/distribute
ENV CPU_ONLY 1 # for caffe

ENV OPENCV_VERSION 2.4.9
ENV THRIFT_VERSION 0.9.3
ENV THREADS 4
ENV PROTOBUF_VERSION 2.5.0
ENV JAVA_VERSION 8
ENV JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 

## common package installations
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y make

## install lucida
RUN mkdir -p /usr/local/lucida
ADD . /usr/local/lucida
WORKDIR "/usr/local/lucida/tools"
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:george-edison55/cmake-3.x
RUN apt-get update
RUN apt-get install -y cmake
RUN apt-get upgrade
RUN apt-get update
RUN /bin/bash apt_deps.sh
RUN /bin/bash install_python.sh
RUN /bin/bash install_java.sh
RUN /bin/bash install_opencv.sh
RUN /bin/bash install_thrift.sh
RUN /bin/bash install_fbthrift.sh
RUN /bin/bash install_mongodb.sh
WORKDIR "/usr/local/lucida/lucida"
RUN /usr/bin/make
RUN /bin/bash commandcenter/apache/install_apache.sh
RUN /bin/bash speechrecognition/kaldi_gstreamer_asr/install_kaldi.sh
RUN mkdir -p /etc/letsencrypt/live/host
RUN mkdir -p /usr/local/lucida/lucida/questionanswering/OpenEphyra/db/
RUN cd /usr/local/lucida/lucida/questionanswering/OpenEphyra/db/
RUN wget http://web.eecs.umich.edu/~jahausw/download/wiki_indri_index.tar.gz
RUN tar xzvf wiki_indri_index.tar.gz
RUN rm wiki_indri_index.tar.gz
RUN apt-get update

RUN echo "Congratulations, Your Image is Sucessfully Built" 
### function docker-flush(){
###     dockerlist=$(docker ps -a -q)
###     if [ "${dockerlist}" != "" ]; then
###         for d in ${dockerlist}; do
###             echo "***** ${d}"
###             docker stop ${d} 2>&1 > /dev/null
###             docker rm ${d} 2>&1 > /dev/null
###         done
###     fi
### }
