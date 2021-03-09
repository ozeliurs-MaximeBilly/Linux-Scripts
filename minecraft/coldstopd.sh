#!/bin/bash

# Description : "Stop everything deamon"

echo "Arret de tous les serveurs ..."

for SERV in `ls ~/minecraft/ | grep ".mc"`
do
  echo "Arret de $SERV."
  screen -R "$SERV" -X stuff "stop $(printf "\r")"
done

sleep 30s

for SERV in `ls ~/minecraft/ | grep ".mc"`
do
  echo "Arret du screen : $SERV."
  screen -X -R "$SERV" quit
done

echo "Tout est arrete !"
