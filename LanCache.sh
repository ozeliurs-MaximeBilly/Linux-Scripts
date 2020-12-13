#!/bin/bash

echo "Updating && Upgrading ..."
sudo apt-get update && sudo apt-get upgrade -y
echo "Updated && Upgraded !"

sudo apt-get install curl

echo "Downloading Docker ..."
cd /home/$USER/
curl -fsSL https://get.docker.com -o get-docker.sh
echo "Done !"

echo "Installing Docker ..."
sudo sh get-docker.sh
rm /home/$USER/get-docker.sh
echo "Done !"

sudo apt-get install docker-compose

sudo apt-get install git

git clone https://github.com/lancachenet/docker-compose /home/$USER/lancache
cd /home/$USER/lancache

echo "To finish you have to configure the lancache by running 'nano .env' and ' docker-compose up -d' and fine tuning the parameters for your liking !!!"


