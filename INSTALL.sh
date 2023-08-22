#!/usr/bin/env bash

{
echo "Enter Sudo Password for $USER:" 
read -s UserSudoPASS
PASS=$UserSudoPASS
DIR="$( dirname -- "${BASH_SOURCE[0]}"; )";
DIR="$( realpath -e -- "$DIR"; )";
echo "$PASS" | sudo -i
}
#
{
sudo apt update && sudo apt full-upgrade -y
sudo apt install docker.io docker-compose -y
sudo apt autoremove -y
}
{
sudo mkdir /etc/thehive
sudo cp /$DIR/thehive/etc/application.conf /etc/thehive/
sudo mkdir /etc/cortex
sudo cp /$DIR/cortex/application.conf /etc/cortex/
docker-compose /$DIR/docker/ up 
}
