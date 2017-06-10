#!/bin/bash
set -e

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
sudo yum install -y java-1.8.0-openjdk-devel.x86_64

curl -o ~/bin/digdag --create-dirs -L "https://dl.digdag.io/digdag-0.9.12"
chmod +x ~/bin/digdag
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile

