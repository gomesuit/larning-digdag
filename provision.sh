#!/bin/bash
set -e

sudo yum install -y git vim

# anyenv
git clone https://github.com/riywo/anyenv ~/.anyenv
echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(anyenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

anyenv install ndenv
source ~/.bash_profile
ndenv install v7.10.0

#sudo yum install java-1.8.0-openjdk.x86_64
sudo yum install -y java-1.8.0-openjdk-devel.x86_64

git clone -b v0.9.12 https://github.com/treasure-data/digdag.git
