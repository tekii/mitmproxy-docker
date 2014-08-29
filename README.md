mitmproxy-docker
================

Dockerfile for mitmproxy compiled from source

#Build (same as build.sh)
docker build -t mitmproxy:source .

#Start (same as start.sh)
docker run -i -t mitmproxy:source --anticache -z

