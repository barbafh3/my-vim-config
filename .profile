export QT_QPA_PLATFORMTHEME="qt5ct"
export SXHKD_SHELL=/bin/bash

export XDG_CONFIG_HOME="$HOME/.config"
export HISTFILE="$XDG_DATA_HOME"/bash/history
export GTK2_RC_FILES=/home/junior/.gtkrc-2.0

export PATH=$PATH:~/.scripts/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.bin
export PATH=$PATH:/snap/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:/home/manjaro/.dotnet.tools
export PATH=$PATH:/opt/mono/bin
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.ghcup/bin

export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/bin
export MSBuildSDKsPath=/usr/share/dotnet/sdk/$(dotnet --version)/Sdks
export FrameworkPathOverride=/lib/mono/4.5

export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/gnome-terminal
export BROWSER=/usr/bin/qutebrowser
export FILE_MANAGER="$TERMINAL -e ranger"

export DOCS=$HOME/Documentos
export FAV=$DOCS/Favoritos

export TWITCH_FAVORITES=$FAV/twitch-favorites
export BROWSER_FAVORITES=$FAV/browser-favorites
export BROWSER_MOST_USED=$FAV/browser-most-used

export PATH="$HOME/.cargo/bin:$PATH"
