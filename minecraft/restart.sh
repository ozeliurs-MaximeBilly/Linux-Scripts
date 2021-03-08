#!/bin/bash

# Description : "Restart deamon"

if [ "$#" = 0 ];
then
	echo "Redemarrage de tous les serveurs ..."

		for SERV in `ls ~/minecraft/`
		do
		  echo "Arret de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "stop $(printf "\r")"
		done

		sleep 30s

		for SERV in `ls ~/minecraft/`
		do
		  echo "Démarrage de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
		done

		echo "Serveurs en cours de démarrage ..."

else
	for SERV in "$@"
	do
		echo "Redemarrage de $@."

		for SERV in "$@"
		do
		  echo "Arret de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "stop $(printf "\r")"
		done

		sleep 30s

		for SERV in "$@"
		do
		  echo "Démarrage de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
		done

		echo "Serveurs en cours de démarrage ..."
	done
fi
