############################################################
# Dockerfile to build mitmproxy (from source)
# Based on Ubuntu
############################################################

FROM ubuntu

RUN apt-get update

#install deps 
RUN apt-get install -q -y language-pack-en wget python git build-essential python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev

#make temporary 
RUN mkdir -p /tmp/mitm-build/ 
WORKDIR /tmp/mitm-build/

#install pip
RUN wget https://bootstrap.pypa.io/get-pip.py 
RUN python get-pip.py 

#install netlib
RUN git clone git://github.com/mitmproxy/netlib.git
RUN pip install netlib/

#install mitmproxy
RUN git clone git://github.com/mitmproxy/mitmproxy.git
RUN pip install mitmproxy/

RUN update-locale LANG=en_US.UTF-8

# Expose the default port
EXPOSE 8080

WORKDIR /

ENV LANG en_US.UTF-8
# Set default container command
ENTRYPOINT /usr/local/bin/mitmproxy
