# base image
FROM ubuntu:18.04
LABEL maintainer "Sleepy Mario <theonesleepymario@gmail.com>"

# environment variables
ARG PV=4.19

# install dependencies
RUN apt-get update && \
	apt-get upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y make g++ wget tcl tcl-dev tdom tk tk-dev tcl-snack sudo pulseaudio alsa 

# tmpdir
RUN mkdir -p /root/tmp

# fetch and compile scidvspc 
RUN cd /root/tmp && \
	wget http://sourceforge.net/projects/scidvspc/files/source/scid_vs_pc-${PV}.tgz/download && \
	tar xzvf /root/tmp/download && \
	cd /root/tmp/scid_vs_pc-${PV} && \
	./configure BINDIR=/usr/local/bin/ && \
	make install

# remove leftovers
RUN rm -rf /root/tmp
RUN apt-get purge -y wget g++ make && \
        apt-get autoremove -y && \
        apt-get autoclean -y && \
        apt-get clean -y

RUN echo 'scidvspc ALL = NOPASSWD: ALL' > /etc/sudoers.d/scidvspc
RUN chmod 0440 /etc/sudoers.d/scidvspc
RUN adduser --disabled-password scidvspc --gecos "Scidvspc"

USER scidvspc
ENV HOME /home/scidvspc
ENV PULSE_SERVER unix:/tmp/pulse

# run scid_vs_pc
CMD sudo /etc/init.d/dbus start && /usr/local/bin/scid
