# vi: syntax=zsh

# Enable vim like keybindings
fish_vi_key_bindings

# Load the abbreviations file
source $HOME/.config/fish/abbreviations
cat ~/.cache/wal/sequences

set EDITOR /usr/bin/vim
set JAVA_HOME /usr/lib/jvm/java-11-openjdk/bin

set PATH ~/.scripts/bin $PATH
set PATH /snap/bin $PATH
set PATH ~/.local/bin $PATH

