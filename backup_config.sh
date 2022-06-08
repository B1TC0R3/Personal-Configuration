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

for elem in ${files[@]}; do
	install -DC $elem $1/$elem
done
