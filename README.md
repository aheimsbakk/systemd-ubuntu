# systemd-ubuntu

This is a base image for running docker with full systemd support. 

Also known as Fat Docker.

## Tags

* `18.10` ([18.10/Dockerfile](https://github.com/aheimsbakk/systemd-ubuntu/blob/master/18.10/Dockerfile))

* `18.04` ([18.04/Dockerfile](https://github.com/aheimsbakk/systemd-ubuntu/blob/master/18.04/Dockerfile))

## Ubuntu Fat Docker

Ubuntu with systemd enabled. 

- Login via console is disabled.

- `cron` is enabled.

- `unattended-upgrades` to keep running docker up to date. 

- `logrotate` to avoid filling up with standard logs.

- `journald` logs to memory and console, max memory for logs is `50M`.

## Start systemd-ubuntu

Example:

    docker run -d --name mydocker --tmpfs /run --tmpfs /run/lock --tmpfs /tmp -v /sys/fs/cgroup:/sys/fs/cgroup:ro aheimsbakk/systemd-ubuntu:18.04

### Examine running docker

    docker exec -ti mydocker bash 

## Caveats

Runs fine on Ubuntu. May be problems on Fedora or non Debian based systems to differences in cgroups.

###### vim: set syn=markdown spell spl=en:

