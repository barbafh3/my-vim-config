# vi: syntax=zsh

# Enable vim like keybindings
fish_vi_key_bindings

# Load the abbreviations file
source $HOME/.config/fish/abbreviations
#cat ~/.cache/wal/sequences

set fish_greeting ''

set JAVA_HOME /usr/lib/jvm/java-11-openjdk/bin $JAVA_HOME
set MSBuildSDKsPath /usr/share/dotnet/sdk/(dotnet --version) $MSBuildSDKsPath
# set FrameworkPathOverride /lib/mono/4.5

set PATH ~/.local/bin $PATH
set PATH ~/.gem/ruby/2.6.0/bin $PATH
set PATH /home/manjaro/.dotnet/tools $PATH

powerline-daemon -q

# neofetch

# terminal-blur
