#!/bin/sh

echo "Letting people know that the server is going to restart...."
screen -R Minecraft\ server -X stuff "say Redemarrage du serveur pour Backup dans 5 minutes ! $(printf "\r")"
screen -R Minecraft\ server -X stuff "say CECI N'EST PAS UN TEST ! $(printf "\r")"
sleep 240s
screen -R Minecraft\ server -X stuff "say Redemarrage du serveur pour Backup dans 1 minutes ! $(printf "\r")"
sleep 30s
screen -R Minecraft\ server -X stuff "say Redemarrage du serveur pour Backup dans 30 secondes ! $(printf "\r")"
sleep 20s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 10 secondes ! $(printf "\r")"
sleep 5s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 5 ... $(printf "\r")"
sleep 1s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 4 ... $(printf "\r")"
sleep 1s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 3 ... $(printf "\r")"
sleep 1s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 2 ... $(printf "\r")"
sleep 1s
screen -R Minecraft\ server -X stuff "say Redemarrage dans 1 ... $(printf "\r")"
sleep 1s
screen -R Minecraft\ server -X stuff "say Redemarrage ... $(printf "\r")"
screen -R Minecraft\ server -X stuff "stop $(printf "\r")"
sleep 30s

echo "Doing Backup"
tar -cvpzf "/home/debian/backup/backup-$(date +%F\ -\ %Hh).tar.gz" /home/debian/MC/
echo "Backup Done !"

screen -R Minecraft\ server -X stuff "java -Xmx4096M -Xms1024M -jar paper-1.15.2.jar nogui $(printf "\r")"
echo "Done"
