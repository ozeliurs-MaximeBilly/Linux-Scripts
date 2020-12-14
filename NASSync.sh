#!/bin/bash

echo "Is curlftps installed ?"
sudo apt-get install curlftpfs -y
echo "Done !"

echo "Mounting FTP to /mnt/ftp"
sudo mkdir /mnt/ftp
sudo curlftpfs "master":""@10.0.0.70 /mnt/ftp/

echo "Copy New Movies ..."
cp -Ruv /mnt/ftp/Volume_2/My\ Movies /home/jellyfin/Documents/Jellyfin-Library/My\ Movies/
echo "Copy New Series ..."
cp -Ruv /mnt/ftp/Volume_2/My\ Series /home/jellyfin/Documents/Jellyfin-Library/My\ Series/
echo "Copy New Music ..."
cp -Ruv /mnt/ftp/Volume_2/My\ Music /home/jellyfin/Documents/Jellyfin-Library/My\ Music/
echo "Done !!!"

echo "Unmouting ..."
sudo fusermount -u /mnt/ftp
echo "Done !"
