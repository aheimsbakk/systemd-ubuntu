# What is systemd-ubuntu

This is a base image for running docker with full systemd support.

## Tags

* `18.04`

    - Ubuntu 18.04 with systemd enabled. 
    - Runs `unattended-upgrades` to keep image up to date. 
    - `logrotate` is enabled.
    - Console login is disabled.
    - journald logs to memory and redirects to console.
    - Extra packages that is installed for getting tools like `ip`, `top`, `ping` and `dig` is `iproute2`, `procps`, `iputils-ping` and ` dnsutils`.

## Start systemd-ubuntu

    docker run -d --name mydocker \
		--tmpfs /run \
        --tmpfs /run/lock \
        --tmpfs /tmp \
        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
		aheimsbakk/systemd-ubuntu:18.04

### Examine running docker

    docker exec -ti mydocker bash 

## Caveats

Runs fine on Ubuntu. May be problems on Fedora or non Debain based systems to differences in cgroups.

###### vim: set syn=markdown spell spl=en:

