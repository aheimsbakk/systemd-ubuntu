#
# Docker: systemd-ubuntu-18.10
# 
# Docker for running full systemd enabled dockers without console. 
# Enabled unattended upgrades for security, logrotate and logging to console.
#
# Example: 
#   docker run -d --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro systemd-ubuntu:18.10
# 
# Tip: 
#   If you want to detach from a running docker, CTRL+p CTRL+q

# Base image
FROM ubuntu:18.10

# Let OS know that we're a docker container
ENV container docker 

# Environment variables for apt
ENV LC_ALL C 
ENV DEBIAN_FRONTEND noninteractive

# Install 
#   systemd, logrotate and unattended-upgrades
RUN apt-get update; \
    apt-get install -y systemd logrotate unattended-upgrades; \
    apt-get clean

# Keep journal in memory, max 50M
RUN sed -i 's#^.\(Storage\).*#\1=volatile#' /etc/systemd/journald.conf; \
    sed -i 's#^.\(RuntimeMaxUse\).*#\1=50M#' /etc/systemd/journald.conf

# Forward journal to console
RUN sed -i 's#^.\(ForwardToConsole\).*#\1=yes#' /etc/systemd/journald.conf

# Remove interactive prompt on console
RUN systemctl mask getty.target

# Add entrypoint, install packages in APT environment variable
COPY docker-entrypoint.sh /

# Stop systemd 
STOPSIGNAL SIGRTMIN+3

# Mount these volumes
VOLUME /run /run/lock /tmp /sys/fs/cgroup

# When exec to docker, start in /root
WORKDIR /root

# Install extra packages on start
ENTRYPOINT ["/docker-entrypoint.sh"]

# Start with systemd
CMD exec /sbin/init


