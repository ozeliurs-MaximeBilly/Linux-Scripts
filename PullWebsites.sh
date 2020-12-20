#!/bin/sh

echo "\e[33mUpdating Services ...\e[0m"
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install apache2 -y
echo "\e[32mServices Updated.\e[0m"

echo "\e[33mCloning Websites to websites ...\e[0m"
mkdir /home/ubuntu/
cd /home/ubuntu/
echo "\e[33mCleaning up previous pull ...\e[0m"
rm /home/ubuntu/websites -r
echo "\e[33mPulling ...\e[0m"
git clone https://github.com/Oseliurs/websites.git
echo "\e[32mWebsite Cloned !!\e[0m"

echo "\e[33mUpdating Contents ...\e[0m"
echo "\e[33mEmptying Website Active Directory ...\e[0m"
sudo rm /var/www/beta -r
sudo rm /var/www/main -r
echo "\e[33mCopying new version ...\e[0m"
sudo cp -r /home/ubuntu/websites/main /var/www/main
sudo cp -r /home/ubuntu/websites/beta /var/www/beta
echo "\e[32mContents Updated !!!\e[0m"
