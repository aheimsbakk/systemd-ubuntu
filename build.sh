#!/bin/bash


for directory in */
do
    version=$(basename $directory)
    docker build -t systemd-ubuntu:$version $directory
done

