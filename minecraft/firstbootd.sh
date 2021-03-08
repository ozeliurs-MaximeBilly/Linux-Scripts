#!/bin/bash

# Description : "Cold Start Daemon"

echo "Démarrage de tous les serveurs ..."

for SERV in `ls ~/minecraft/ | grep ".mc"`
do
  echo "Démarrage"
  screen -S "$SERV" -d -m 
  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
  screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
done

echo "Serveurs en cours de démarrage ..."
