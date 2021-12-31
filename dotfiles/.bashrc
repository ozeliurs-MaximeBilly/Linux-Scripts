# Colors
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
pur='\[\033[01;35m\]'   # Purple
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset


# SHell options
HISTCONTROL=ignoreboth # Don't put duplicate lines or lines starting with space in the history.
shopt -s histappend # Append to the history file, don't overwrite it.
shopt -s checkwinsize # Check the window size after each command and, if necessary.


# Set history length
HISTSIZE=4000
HISTFILESIZE=8000


# Prompt Setup

# Git in Prompt
function git_branch() {
# TODO USE git rev-parse --is-inside-work-tree
    if [ -d .git ] ; then
        printf " %s" "($(git branch 2> /dev/null | awk '/\*/{print $2}'))";
    fi
}

# Set Prompt
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then # We have color support
	PS1='${debian_chroot:+($debian_chroot)}'${ylw}'[\t]'${blu}'$(git_branch)'${clr}':'${grn}'\w'${clr}'\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\[\t\]$(git_branch):\w\$ '
fi


# Command aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Custom commands

function sys() {
	printf "\n"
	printf "   %s\n" "IP ADDR: $(wget -qO- ifconfig.me)"
	printf "   %s\n" "USER: $(echo $USER)"
	printf "   %s\n" "DATE: $(date)"
	printf "   %s\n" "UPTIME: $(uptime -p)"
	printf "   %s\n" "HOSTNAME: $(hostname -f)"
	printf "   %s\n" "CPU: $(cat /proc/cpuinfo | awk -F: '/model name/{print $2}' | head -1)"
	printf "   %s\n" "KERNEL: $(uname -rms)"
	printf "   %s\n" "PACKAGES: $(dpkg --get-selections | wc -l)"
	printf "   %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1" "}')"
	printf "   %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
	printf "\n"
}

function gitauto() {
	printf "\e[1;31mAuto Committing ...\e[0m\n";
	git add -A;
	git commit -m "$(wget -qO- http://whatthecommit.com/index.txt)";
	git push;
}
