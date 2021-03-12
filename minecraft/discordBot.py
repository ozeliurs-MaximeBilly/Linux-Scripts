import discord
import os
import subprocess
import time

installPath = "/root/minecraft"
help = "Voici la liste des commandes : \n$help : Afficher ce message.\n$ping : Tester si le bot fonctionne.\n$tps <nom_du_serv> : Afficher le tps du serveur"

def getServers():
    servers = subprocess.check_output(('ls '+installPath+'/').split(" "))
    servers = str(servers)[2:-3].split("\\n")
    servers.remove("scripts")
    return servers

client = discord.Client()

@client.event
async def on_ready():
    print('We have logged in as {0.user}'.format(client))

@client.event
async def on_message(message):
    if message.author == client.user:
        return

    if message.content.startswith('$ping'):
        await message.channel.send('pong')

    if message.content.startswith('$help'):
        await message.reply(help)

    if message.content.startswith("$tps"):
        server = message.content.split("$tps")[1].strip()
        if ".mc" not in server:
            server += ".mc"

        servers = getServers()

        if server in servers:

            os.system('screen -R "' + server + '" -X stuff "tps $(printf "\r")"')
            time.sleep(3)
            try:
                out = str(subprocess.check_output(['tail', '-n1', ("/root/minecraft/"+ server +"/logs/latest.log")]))
                await message.reply(server + " : " + out.split("[Server thread/INFO]: ")[1].split("\\")[0])
            except subprocess.CalledProcessError as err:
                print(err)

        else:
            await message.reply("Les serveurs disponibles sont :\n" + "\n".join(servers))

    if message.content.startswith('$backup'):
        await message.reply("En cours de dev ...")

        server = message.content.split("$backup")[1].strip()
        if ".mc" not in server:
            server += ".mc"

        servers = getServers()

        if server in servers:
            os.system("/root/minecraft/scripts/backupd.sh "+server)
            await message.reply("Backup de "+server+" en cours ...")
        else:
            await message.reply("Les serveurs disponibles sont :\n" + "\n".join(servers))
        

client.run("ODE5NTE0MzU3MDMyNjgxNDkz.YEnuOA.4USDNlOMXiH3nmx720uVtJOmFGs")
