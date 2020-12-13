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

echo "Installing docker-compose && git"
sudo apt-get install docker-compose -y
sudo apt-get install git -y
echo "Done !"

echo "Cloning the Lancache project on github ..."
git clone https://github.com/lancachenet/docker-compose /home/$USER/lancache
cd /home/$USER/lancache
echo "Done !"

echo "To finish you have to configure the lancache by running 'sudo nano .env' and 'sudo docker-compose up -d' and fine tuning the parameters for your liking !!!"


