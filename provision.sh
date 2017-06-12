#!/bin/bash
set -xe

# sudo yum install -y git vim

# # anyenv
# git clone https://github.com/riywo/anyenv ~/.anyenv
# echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
# echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
# source ~/.bash_profile

# # ndenv
# anyenv install ndenv
# source ~/.bash_profile

# # node
# ndenv install v7.10.0
# ndenv global v7.10.0

# java
yum install -y java-1.8.0-openjdk-devel.x86_64

# install digdag
curl -o /usr/local/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-0.9.12"
chmod +x /usr/local/bin/digdag

# setting digdag
mkdir -p /var/log/digdag/log /usr/local/etc/digdag/
cp /home/vagrant/synced/settings/start.bash /usr/local/etc/digdag/
chmod +x /usr/local/etc/digdag/start.bash
cp /home/vagrant/synced/settings/postgresql.properties /usr/local/etc/digdag/
groupadd digdag
useradd -g digdag -d /opt/digdag digdag
mkdir -p /usr/local/var/log/digdag/tasklogs /usr/local/var/log/digdag/accesslogs
chown -R digdag:digdag /usr/local/var/log/digdag

# install postgres
yum install -y 'https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-7-x86_64/pgdg-centos96-9.6-3.noarch.rpm'
yum install -y postgresql96-server
/usr/pgsql-9.6/bin/postgresql96-setup initdb
cp -f /home/vagrant/synced/settings/postgresql.conf /var/lib/pgsql/9.6/data/postgresql.conf
cp -f /home/vagrant/synced/settings/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf
systemctl start postgresql-9.6

# create database for digdag
#sudo -u postgres psql -c "CREATE ROLE digdag WITH PASSWORD 'digdagpass' NOSUPERUSER NOCREATEDB NOCREATEROLE LOGIN;"
#sudo -u postgres psql -c "CREATE DATABASE digdag_db WITH OWNER digdag;"
#sudo -u postgres psql -c 'CREATE EXTENSION "uuid-ossp";'
#sudo -u postgres createuser -s digdag -P
#sudo -u postgres createdb digdag_db -O digdag
#http://qiita.com/tomlla/items/9fa2feab1b9bd8749584

# setting service
cp /home/vagrant/synced/settings/digdag.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable digdag
