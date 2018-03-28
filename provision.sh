#!/bin/sh

# Install dependency package for Docker
yum install -y yum-utils device-mapper-persistent-data lvm2

# Add Yum Repository For Docker
if [ ! -e '/etc/yum.repos.d/docker-ce.repo' ]; then
  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum makecache fast
fi

# Install Docker
yum install -y docker-ce

# Install Docker-compose
if [ ! -e '/usr/local/bin/docker-compose' ]; then
  curl -L https://github.com/docker/compose/releases/download/1.20.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
fi

usermod -aG docker vagrant

systemctl enable docker
systemctl start docker
