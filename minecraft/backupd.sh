#!/bin/bash

# Description : "Backup deamon"

#define backup folder
script_path="$(dirname $(readlink -f $0))/"
backup_path="$script_path../backup" # ici /root/minecraft/scripts/../backup
server_path="$script_path../


if [ "$#" = 0 ];
then
	echo "Backup de tous les serveurs ..."

	echo "Prevention des joueurs ..."
	for SERV in `ls $server_path | grep ".mc"`
	do
		screen -R "$SERV" -X stuff " say Redemarrage du serveur pour Backup dans 2 minutes !$(printf "\r")"
	done

	sleep 120s

	for SERV in `ls $server_path | grep ".mc"`
	do
		echo "Arret de $SERV."
		screen -R "$SERV" -X stuff "say Redemarrage imminent. $(printf "\r")"
		sleep 2s
		screen -R "$SERV" -X stuff "stop $(printf "\r")"
	done

	sleep 30s

	for SERV in `ls $server_path | grep ".mc"`
	do
		echo "Backup de $SERV."
		if [ -d "$backup_path/$SERV" ];
		then
    		echo "Directory exists."
    	else
    		mkdir $backup_path/$SERV
    	fi

    	tar -cvpzf "$backup_path/$SERV/backup-$(date +%F\ -\ %Hh).tar.gz" "$server_path/$SERV"
    done

    sleep 30s

    for SERV in `ls $server_path | grep ".mc"`
    do
    	echo "Démarrage de $SERV."
    	screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
    	screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
    done

    echo "Serveurs en cours de démarrage ..."

else

	echo "Prevention des joueurs ..."
	for SERV in "$@"
	do
		screen -R "$SERV" -X stuff " say Redemarrage du serveur pour Backup dans 2 minutes !$(printf "\r")"
	done

	sleep 120s

	for SERV in "$@"
	do
		echo "Arret de $SERV."
		screen -R "$SERV" -X stuff "say Redemarrage imminent. $(printf "\r")"
		sleep 2s
		screen -R "$SERV" -X stuff "stop $(printf "\r")"
	done

	sleep 30s

	for SERV in "$@"
	do
		echo "Backup de $SERV."
		if [ -d "$backup_path/$SERV" ];
		then
    		echo "Directory exists."
    	else
    		mkdir $backup_path/$SERV
    	fi

    	tar -cvpzf "$backup/$SERV/backup-$(date +%F\ -\ %Hh).tar.gz" "$backup/minecraft/$SERV"
    done

    sleep 30s

    for SERV in "$@"
    do
    	echo "Démarrage de $SERV."
    	screen -R "$SERV" -X stuff "cd ~/minecraft/$SERV/ $(printf "\r")"
    	screen -R "$SERV" -X stuff "./start.sh $(printf "\r")"
    done

    echo "Serveurs en cours de démarrage ..."

fi
