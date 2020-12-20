#!/bin/sh

echo "Updating Services ..."
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install apache2 -y
echo "Services Updates."

echo "Cloning Websites to websites ..."
mkdir /home/ubuntu/
cd /home/ubuntu/
echo "Cleaning up previous pull ..."
rm /home/ubuntu/websites -r
echo "Pulling ..."
git clone https://github.com/Oseliurs/html.git
echo "Website Cloned"

echo "Updating Contents ..."
echo "Emptying Website Active Directory ..."
sudo rm /var/www/beta -r
sudo rm /var/www/main -r
echo "Moving new version ..."
sudo mv /home/ubuntu/websites/main /var/www/main
sudo mv /home/ubuntu/websites/beta /var/www/beta
echo "Contents Updated !!!"
