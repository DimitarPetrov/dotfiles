# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export ANDROID_SDK=$HOME/Library/Android/sdk
export GOPATH=$HOME/go
export PATH=$PATH:${HOME}/Library/Python/2.7/bin:${HOME}/go/bin:${HOME}/Documents/scripts:${HOME}/Documents/scripts/sap:${HOME}/Documents/scripts/personal:${HOME}/flutter/bin:$ANDROID_SDK/emulator:$ANDROID_SDK/tools
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="avit"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

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
COMPLETION_WAITING_DOTS="true"

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
  docker
  kubectl
  cloudfoundry
  copyfile
  encode64
  extract
  mvn
  web-search
  vi-mode
  cf
  z
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Extend file descriptors count for this terminal session
ulimit -n 1024

# Git aliases:
alias gc="git clone"
alias gs="git status"
alias ga="git add"
alias gm="git commit"
alias gam="git commit -a -m"
alias up="git push"
alias upp="git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)"
alias down="git pull"
alias goto="git checkout $1"
alias gf="git diff"
alias gl="git log --graph --decorate --pretty=oneline --abbrev-commit --all"
alias gira="git reset HEAD --hard"
alias gb="git branch"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"

db() {
  if [ $1 = '-d' ]; then
    docker stop $2; docker rm $2
  else
    docker run --name $1 -d -p $2:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres postgres
  fi
}

dbm() {
  if [ $1 = '-d']; then
    docker stop $2; docker rm $2
  else
    docker run --name $1 -d -p $2:27017 -v $3:/data/db mongo
  fi
}

dbr() {
  docker stop $1; docker rm $1; db $1 $2
}

port() {
  lsof -i ":$1"
}

alias dp="psql -h localhost -U postgres"
alias goland="/usr/local/bin/goland"

alias smctll=sm-login.sh
alias smctli="cd $GOPATH/src/github.com/Peripli/service-manager-cli && go build -o smctl && mv smctl $GOPATH/bin"

alias work=work.sh
alias nowork=stop_work.sh

alias prolog="docker start rserve; docker start prolog"
alias noprolog="docker stop prolog; docker stop rserve"

alias docker-clean='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias gotest='go test -race -p 1 -count 1 ./...'

alias loc="countLoC.sh"
alias loc-file-names="countLoC.sh tests print-files"
alias loc-no-tests="countLoC.sh no-tests"
alias loc-no-tests-file-names="countLoC.sh no-tests print-files"

alias toolkit="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock --name toolkit dnpetrovv/toolkit"

# added by travis gem
[ -f /Users/i356426/.travis/travis.sh ] && source /Users/i356426/.travis/travis.sh
