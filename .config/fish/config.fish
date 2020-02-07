# vi: syntax=zsh

# Enable vim like keybindings
fish_vi_key_bindings

# Load the abbreviations file
source $HOME/.config/fish/abbreviations
#cat ~/.cache/wal/sequences

set fish_greeting ''

set EDITOR /usr/bin/vim
set JAVA_HOME /usr/lib/jvm/java-11-openjdk/bin
set MSBuildSDKsPath /usr/share/dotnet/sdk/(dotnet --version)
set FrameworkPathOverride /lib/mono/4.5

set PATH ~/.scripts/bin $PATH
set PATH /snap/bin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.gem/ruby/2.6.0/bin $PATH
set PATH /home/manjaro/.dotnet/tools $PATH

set TERMINAL /usr/bin/kitty $TERMINAL
set IMAGE ~/Imagens/wallpapers/Mountain-1080p-wallpaper.jpg

powerline-daemon -q

neofetch

# terminal-blur
