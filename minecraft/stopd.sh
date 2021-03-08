#!/bin/bash

# Description : "Stop deamon"

if [ "$#" = 0 ];
then
	  echo "Arret de tous les serveurs ..."

		for SERV in `ls ~/minecraft/$.mc`
		do
		  echo "Arret de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "stop $(printf "\r")"
		done

		sleep 30s

else
	for SERV in "$@"
	do

		for SERV in "$@"
		do
		  echo "Arret de $SERV."
		  screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
		  screen -R "$SERV" -X stuff "stop $(printf "\r")"
		done
    
	done
fi
