#!/bin/bash


for directory in */
do
    version=$(basename $directory)
    docker build --pull -t systemd-ubuntu:$version $directory
done

