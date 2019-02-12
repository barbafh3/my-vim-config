# vi: syntax=zsh

# Enable vim like keybindings
fish_vi_key_bindings

# Load the abbreviations file
source $HOME/.config/fish/abbreviations

set PATH ~/.scripts $PATH
set PATH ~/.scripts/gen-aliases $PATH
set PATH /snap/bin $PATH
set PATH ~/.local/bin $PATH
