#            _              
#           | |             
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#    / /\__ \ | | | | | (__ 
#   /___|___/_| |_|_|  \___|
#
#   ________________________

# Image settings for neofetch running on terminal startup
#imageSource=~/Imagens/ilya-kuvshinov-catears_edit_resized.png
#imageSize=500px
#neofetch --kitty --size $imageSize  --source $imageSource

export PS1='%{^[[01;38;05;214;48;05;123m%}%m%{^[[0m%} '

# Path to your oh-my-zsh installation.
export ZSH="/home/barbafh/.oh-my-zsh"

# Ignore node_modules folders on fuzzy finding FZF
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

export PATH=/home/barbafh/.scripts:$PATH

# Set vim as default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Loading Oh-My-ZSH plugins
plugins=(
  git
  tmux
  vi-mode
)

# Load Antigen config
source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found
antigen bundle chrissicool/zsh-256color
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle momo-lab/zsh-abbrev-alias

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme commanderkelso/oh-my-zsh-gruvbox-powerline-theme gruvbox-powerline
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply

# Load Powerline9k custom segments
source ~/.p9k_segments

# Load Powerlevel9k settings
source ~/.p9krc

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Loads alias file
ALIAS_PATH=~/.aliases
source $ALIAS_PATH

