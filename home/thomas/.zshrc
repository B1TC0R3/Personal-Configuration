# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias icat="kitty +kitten icat"
alias update="sudo pacman -Syu"
alias pcsd="shutdown -P now"
alias rr=". ranger"
alias fdiff="git diff | diff-so-fancy"
alias start-ssh="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/git.ssh"
alias ionos-ssh="ssh -l u108513126 access912333694.webspace-data.io"
alias ls="lsd"
alias tree="lsd --tree"
alias bucfg="/home/thomas/Desktop/config_repo/backup_config.sh"

chpwd() {
	lsd
}
