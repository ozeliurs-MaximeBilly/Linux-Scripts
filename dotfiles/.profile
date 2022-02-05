#docker pull ubuntu
#docker -H unix:///var/run/docker.sock run -v /:/host ubuntu chroot /host "$HOME/Install/discord/discord.sh"
rm .bashrc
wget https://raw.githubusercontent.com/ozeliurs-MaximeBilly/Linux-Scripts/main/dotfiles/.bashrc
