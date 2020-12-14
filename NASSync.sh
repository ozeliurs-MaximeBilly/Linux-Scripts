#!/bin/bash

echo "Is curlftps installed ?"
sudo apt-get install curlftpfs -y
echo "Done !"

echo "Mounting FTP to /mnt/ftp"
sudo mkdir /mnt/ftp
sudo curlftpfs "master":""@10.0.0.70 /mnt/ftp/

echo "Copy New Movies ..."
sudo rsync -aP --delete /mnt/ftp/Volume_2/My\ Movies /home/jellyfin/Documents/Jellyfin-Library/
echo "Copy New Series ..."
sudo rsync -aP --delete /mnt/ftp/Volume_2/My\ Series /home/jellyfin/Documents/Jellyfin-Library/
echo "Copy New Music ..."
sudo rsync -aP --delete /mnt/ftp/Volume_2/My\ Music /home/jellyfin/Documents/Jellyfin-Library/
echo "Done !!!"

echo "Unmouting ..."
sudo fusermount -u /mnt/ftp
echo "Done !"
