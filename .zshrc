# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export PS1='%{^[[01;38;05;214;48;05;123m%}%m%{^[[0m%} '
# Path to your oh-my-zsh installation.
  export ZSH="/home/barbafh/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="gruvbox-powerline"
#ZSH_THEME="agnoster"
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
)

#source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias terminatorconf="vim ~/.config/terminator/config"
alias d:="cd ~/Drive-D"
alias D:="cd ~/Drive-D"
alias downloads="cd ~/Downloads"
alias ..="cd .."
alias szsh="source ~/.zshrc"
alias dbx="cd ~/Dropbox"
# alias ohmyzsh="mate ~/.oh-my-zsh"


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

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
#antigen theme robbyrussell
#antigen theme commanderkelso/oh-my-zsh-gruvbox-powerline-theme gruvbox-powerline
antigen theme agnoster

# Tell Antigen that you're done.
antigen apply


######### POWERLEVEL9K SETTINGS
#POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_MODE='nerdfont-complete'

prompt_zsh_showStatus () {
	local color='%F{022}'
    currentSong=`spotifycli --status`;
    echo -n "   %{$color%}\uf9c6$currentSong" ; 
}

lang_segment () {
    dir="$(dirname "$PWD")"
    if [[ $dir == *"Dev/python"* ]] ; then 
        echo -n "%{%F{yellow}%K{blue}'\uf81f' Python}"
    fi
    if [[ $dir == *"Dev/javascript"* ]] ; then
        echo -n "%{%F{black}%K{yellow}'\ue781' Javascript}"
    fi
        
}

zsh_internet_signal(){
  #Try to ping google DNS to see if you have internet
  local net=$(ping 8.8.8.8 -c 1| grep transmitted | awk '{print $6}' | grep 0)
  local color='%F{red}'
  local symbol="\uf818"
  if [[ ! -z "$net" ]] ;
  then color='%F{022}' ; symbol="\uf817" ;
  fi

  echo -n "$color$symbol%f" # \f1eb is wifi bars
}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#OS_ICON='\uF312'
#ICON=$(print_icon 'LINUX_ICON')
#CUSTOM_ICON='\uF312'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir custom_lang_segment vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status zsh_showStatus custom_internet_signal time) 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰\uF460\uF460\uF460%F{white} "
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰ %K{darkgreen}%F{white}`echo $USER` %f%k%F{white}%f "

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="darkgreen"

POWERLEVEL9K_USER_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_USER_DEFAULT_BACKGROUND="darkgreen"
POWERLEVEL9K_USER_ICON="\uF007"

POWERLEVEL9K_DIR_HOME_FOREGROUND="darkgreen"
POWERLEVEL9K_DIR_HOME_BACKGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="darkgreen"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="darkgreen"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="white"

POWERLEVEL9K_CUSTOM_LANG_SEGMENT="lang_segment"
POWERLEVEL9K_CUSTOM_INTERNET_SIGNAL="zsh_internet_signal"

source $ZSH/oh-my-zsh.sh
