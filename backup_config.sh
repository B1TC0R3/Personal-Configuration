#!/bin/bash

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
	install -DC $elem $1/$elem 1>/dev/null && echo -e "Backed up(\e[36m`date`\e[39m): $elem"
done
echo -e "Copying finished (\e[36m`date`\e[39m)!"

echo "Commiting changes..."
git add $1
git commit -m "Automated backup at: `date`"
echo -e "Changes commited (\e[36m`date`\e[39m)"

echo "Uploading files to git..."
git push &>/dev/null && echo "Files uploaded!"
