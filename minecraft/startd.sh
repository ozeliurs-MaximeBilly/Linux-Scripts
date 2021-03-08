#!/bin/bash

# Description : "Start deamon"

if [ "$#" = 0 ];
then
	echo "Démarrage de tous les serveurs ..."

		for SERV in `ls ~/minecraft/ | grep ".mc"`
		do
		  echo "Démarrage de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
		done

		echo "Serveurs en cours de démarrage ..."

else
	for SERV in "$@"
	do
		echo "Démarrage de $@."

		for SERV in "$@"
		do
		  echo "Démarrage de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
		done

		echo "Serveurs en cours de démarrage ..."
	done
fi
