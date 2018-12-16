#!/bin/bash


for version in 18.04
do
    docker build -t systemd-ubuntu:$version \
        .
done

# To be used when ARG can be used before FROM
#--build-arg ubuntu_image="ubuntu:$version" \
