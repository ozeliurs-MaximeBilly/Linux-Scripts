!/bin/sh

HOME=/home/ubuntu

echo "\e[33mUpdating Services ...\e[0m"
sudo apt-get update
sudo apt-get install git -y
echo "\e[32mServices Updated.\e[0m"

echo "\e[33mCloning Websites to websites ...\e[0m"
cd $HOME
echo "\e[33mCleaning up previous pull ...\e[0m"
rm $HOME/websites -r
echo "\e[33mPulling ...\e[0m"
git clone https://github.com/Oseliurs/websites.git
rm $HOME/websites/README.md
echo "\e[32mWebsite Cloned !!\e[0m"

echo "\e[33mUpdating Contents ...\e[0m"
echo "\e[33mEmptying Website Active Directory ...\e[0m"
cd /var/www/
sudo rm * -r
echo "\e[33mCopying new version ...\e[0m"
sudo cp -r $HOME/websites/* /var/www/
echo "\e[32mContents Updated !!!\e[0m"
