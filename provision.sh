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

# Add EPEL Repository
if [ ! -e '/etc/yum.repos.d/epel.repo' ]; then
  yum install -y epel-release
fi

# Add Remi Repository
if [ ! -e '/etc/yum.repos.d/remi.repo' ]; then
  rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
fi

# Install PHP
yum install -y --enablerepo=remi,remi-php72 php php-devel php-mbstring php-pdo php-gd

# Install Composer
if [ ! -e '/usr/local/bin/composer' ]; then
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
  php composer-setup.php
  php -r "unlink('composer-setup.php');"
  mv composer.phar /usr/local/bin/composer
fi