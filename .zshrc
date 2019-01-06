#            _              
#           | |             
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#    / /\__ \ | | | | | (__ 
#   /___|___/_| |_|_|  \___|
#
#   ________________________

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
imageSource=~/Imagens/ilya-kuvshinov-catears_edit_resized.png
imageSize=500px
#neofetch --kitty --size $imageSize  --source $imageSource

export PS1='%{^[[01;38;05;214;48;05;123m%}%m%{^[[0m%} '
# Path to your oh-my-zsh installation.
export ZSH="/home/barbafh/.oh-my-zsh"
# Ignore NEODE_MODULES folder on fuzzy finding FZF
export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

TMOUT=1

TRAPALRM() {
    zle reset-prompt
}

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

# Loads alias file
source ~/.aliases

# Return the glyph from given NerdFont code
function glyph(){
    echo -ne "\u$1" | xclip -selection primary
    notify-send "Glyph $(xclip -o) was added to the clipboard." &> /dev/null
}

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

prompt_show_spotify () {
    content=`spotifycli --status-short`;
    #"$1_prompt_segment" "$0" "$2" "black" "darkgreen" "\uf1bc $content"
    "$1_prompt_segment" "$0" "$2" "darkgreen" "black" "\uf1bc $content" 
}

getLanguageOrFramework(){
    dir="$( cd "$(dirname "$0")" ; pwd -P )"
    if [[ $dir == *"Dev/python"* ]] ; then
		echo "python";
    fi
    if [[ $dir == *"Dev/javascript"* ]] ; then
        echo "javascript";
    fi
    if [[ $dir == *"Dev/react"* ]] ; then
		echo "react";
    fi
    if [[ $dir == *"Dev/nodejs"* ]] ; then
        echo "nodejs";
    fi
    if [[ $dir == *"Dev/flask"* ]] ; then
        echo "flask";
    fi
    if [[ $dir == *"Dev/java"* ]] ; then
        echo "java";
    fi
    if [[ $dir == *"Dev/rubyonrails"* ]] ; then
        echo "rails";
    fi
    if [[ $dir == *"Dev/c++"* ]] ; then
        echo "c++";
    fi
    if [[ $dir == *"Dev/angular"* ]] ; then
        echo "angular";
    fi
    if [[ $dir == *"Dev/php"* ]] ; then
        echo "php";
    fi
    if [[ $dir == *"Dev/vuejs"* ]] ; then
        echo "vuejs";
    fi
    if [[ $dir == *"Dev/django"* ]] ; then
        echo "django";
    fi
    if [[ $dir == *".vim"* ]] ; then
        echo "vim";
    fi
}

prompt_lang_segment () {
	dir="$( cd "$(dirname "$0")" ; pwd -P )"
    if [[ $dir == *"Dev/python"* ]] ; then 
        content="\uf81f Python%f"
		"$1_prompt_segment" "$0" "$2" "blue" "yellow" "$content" "#"
    fi
    if [[ $dir == *"Dev/js"* ]] ; then
        content="\ue781 Javascript%f"
		"$1_prompt_segment" "$0" "$2" "yellow" "black" "$content" "#"
    fi
	if [[ $dir == *"Dev/react"* ]] ; then
        content="\ufc06 React%f"
		"$1_prompt_segment" "$0" "$2" "blue" "black" "$content" "#"
    fi   
	if [[ $dir == *"Dev/nodejs"* ]] ; then
        content="\uf898 Node.js%f"
		"$1_prompt_segment" "$0" "$2" "black" "green" "$content" "#"
    fi 
	if [[ $dir == *"Dev/java"* ]] ; then
        content="\ue256 Java%f"
		"$1_prompt_segment" "$0" "$2" "white" "red" "$content" "#"
    fi
	if [[ $dir == *"Dev/rubyonrails"* ]] ; then
        content="\ue604 Ruby on Rails%f"
		"$1_prompt_segment" "$0" "$2" "white" "red" "$content" "#"
    fi
	if [[ $dir == *"Dev/c++"* ]] ; then
        content="\ue61d C++%f"
		"$1_prompt_segment" "$0" "$2" "blue" "white" "$content" "#"
    fi
	if [[ $dir == *"Dev/angular"* ]] ; then
        content="\ufbbd Angular%f"
		"$1_prompt_segment" "$0" "$2" "red" "white" "$content" "#"
    fi
	if [[ $dir == *"Dev/php"* ]] ; then
        content="\uf81e PHP%f"
		"$1_prompt_segment" "$0" "$2" "blue" "black" "$content" "#"
    fi
	if [[ $dir == *"Dev/vuejs"* ]] ; then
        content="\ufd42 Vue.js%f"
		"$1_prompt_segment" "$0" "$2" "darkgreen" "white" "$content" "#"
    fi
	if [[ $dir == *"Dev/django"* ]] ; then
        content="\ue71d Django%f"
		"$1_prompt_segment" "$0" "$2" "darkgreen" "white" "$content" "#"
    fi
	if [[ $dir == *"Dev/flask"* ]] ; then
        content="\uf592 Flask%f"
		"$1_prompt_segment" "$0" "$2" "white" "black" "$content" "#"
    fi
	if [[ $dir == *".vim"* ]] ; then
        content="\ue7c5 Vim%f"
		"$1_prompt_segment" "$0" "$2" "green" "gray" "$content" "#"
    fi
}

prompt_internet_signal(){
  #Try to ping google DNS to see if you have internet
  local net=$(ping 8.8.8.8 -c 1| grep transmitted | awk '{print $6}' | grep 0)
  if [[ ! -z "$net" ]] ;
    then 
        content="\uf817" ;
        "$1_prompt_segment" "$0" "$2" "white" "darkgreen" "$content"
    else
        content="\uf818"
        "$1_prompt_segment" "$0" "$2" "white" "red" "$content"
  fi
}

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
#OS_ICON='\uF312'
#ICON=$(print_icon 'LINUX_ICON')
#CUSTOM_ICON='\uF312'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user dir_writable dir lang_segment vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status show_spotify virtualenv nodeenv time) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv nodeenv background_jobs ram disk_usage) 
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{white}╭"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{white}╰\uF460\uF460\uF460%F{white} "

POWERLEVEL9K_TIME_FORMAT="%D{%d/%m/%Y \uf073  %H:%M:%S}"


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

source $ZSH/oh-my-zsh.sh

#xmodmap ~/.Xmodmap
