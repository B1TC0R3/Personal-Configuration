#!/bin/bash

# Path to ssh-key for git repo
ssh_key=/home/thomas/.ssh/git.ssh

# Git configuration
repository=$1
remote=origin
branch=main

# Backup-files
files=(
/home/thomas/.config/nvim/init.vim
/home/thomas/.config/ranger/rc.conf
/home/thomas/.config/picom/config
/home/thomas/.config/neofetch/config.conf
/home/thomas/.zshrc
/home/thomas/.p10k.zsh
/etc/xdg/awesome/rc.lua
/usr/share/awesome/themes/b1tc0r3/theme.lua
)

echo "Copying files..."
for elem in ${files[@]}; do
	install -DC $elem $1/$elem 1>/dev/null && echo -e "Backed up: \e[36m$elem\e[39m"
done
echo -e "\e[32mCopying finished!\e[39m"

echo "Checking for ssh-key..."
ssh -T git@github.com || eval "$(ssh-agent -s)" &>/dev/null && ssh-add $ssh_key
echo -e "\e[32mKey accepted!\e[39m"

git -C $repository add .
git -C $repository commit -m "Automated backup at: `date`"

echo "Uploading files to git..."
git -C $repository push $remote:$branch && echo -e "\e[32mFiles uploaded!\e[39m"
