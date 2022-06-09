#!/bin/bash

# Path to ssh-key for git repo
# eg.: ~/.ssh/git.ssh
ssh_key=$HOME/.ssh/git.ssh

# Git configuration
# Set 'repository' to the path of your backup-git-repository
repository=$HOME/Desktop/config_repo
remote=origin
branch=main

# Backup-files
files=(
/home/thomas/.vimrc
/home/thomas/.zshrc
/home/thomas/.p10k.zsh
/home/thomas/.config/neofetch/config.conf
/home/thomas/.config/ranger/rc.conf
/home/thomas/.config/picom/config
/etc/xdg/awesome/rc.lua
/usr/share/awesome/themes/b1tc0r3/theme.lua
)

print_help () {
	echo "Please configure the script first!"
	echo "You can do so by opening it in any text-editor."
	echo "Make sure both variables are set accordingly to your setup:"
	echo -e "\t- ssh-key"
	echo -e "\t- repository"
	exit
}

# Check if script is configured
[[ -z $ssh_key ]] && echo -e "\e[31mError:\e[39m Ssh-key not configured!" && print_help
[[ -z $repository ]] && echo -e "\e[31mError:\39m Repository not configured!" && print_help
[[ -z $remote ]] && echo -e "\e[31mError:\39m Remote not defined!" && print_help
[[ -z $branch ]] && echo -e "\e[Error:\39m Branch not defined!" && print_help


echo "Copying files..."
for elem in ${files[@]}; do
	install -DC $elem $repository/$elem 1>/dev/null && echo -e "Backed up: \e[36m$elem\e[39m"
done
echo -e "\e[32mCopying finished!\e[39m"

echo "Authenticating ssh-key..."
eval "$(ssh-agent -s)" &>/dev/null
ssh-add $ssh_key
echo -e "\e[32mKey accepted!\e[39m"

git -C $repository add .
git -C $repository commit -m "Automated backup at: `date`"

echo "Uploading files to git..."
git -C $repository pull $remote $branch
git -C $repository push $remote $branch && echo -e "\e[32mFiles uploaded!\e[39m"
