#!/bin/sh

echo "\u001b[33mUpdating Services ...\u001b[0m"
sudo apt-get update
sudo apt-get install git -y
sudo apt-get install apache2 -y
echo "\u001b[32mServices Updated.\u001b[0m"

echo "\u001b[33mCloning Websites to websites ...\u001b[0m"
mkdir /home/ubuntu/
cd /home/ubuntu/
echo "\u001b[33mCleaning up previous pull ...\u001b[0m"
rm /home/ubuntu/websites -r
echo "\u001b[33mPulling ...\u001b[0m"
git clone https://github.com/Oseliurs/html.git
echo "\u001b[32mWebsite Cloned !!\u001b[0m"

echo "\u001b[33mUpdating Contents ...\u001b[0m"
echo "\u001b[33mEmptying Website Active Directory ...\u001b[0m"
sudo rm /var/www/beta -r
sudo rm /var/www/main -r
echo "\u001b[33mMoving new version ...\u001b[0m"
sudo mv /home/ubuntu/websites/main /var/www/main
sudo mv /home/ubuntu/websites/beta /var/www/beta
echo "\u001b[32mContents Updated !!!\u001b[0m"
