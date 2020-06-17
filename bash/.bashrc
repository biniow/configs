#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color'
alias yaml2js="python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'"

source ~/.atlas.aliases

unset npm_config_prefix

#export npm_config_prefix=~/.node_modules # replaced by nvm

#PATH="${PATH}:~/bin:${npm_config_prefix}/node_modules/.bin" # due to replaced by 
PATH="${PATH}:~/bin"

# Golang
GOPATH="${HOME}/.golang"

# Git
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_DESCRIBE_STYLE='contains'

source /usr/share/git/completion/git-prompt.sh

PS1='\n\t \[\033[32m\][\w\[\033[33;1m\]$(__git_ps1 " (%s)")\[\033[m\]\[\033[32m\]] \[\033[m\]\n\u@precision -> '

EDITOR=/usr/bin/vim

if [[ -f "${HOME}/.config/cloudtoken/bashrc_additions" ]]; then
    source "${HOME}/.config/cloudtoken/bashrc_additions"
fi

source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s autocd # autocd into directory
shopt -s checkwinsize # fix for windows size

export HISTCONTROL=ignorespace

# make larger fonts in zoom
export QT_SCALE_FACTOR=2


nodejs-env () {
	source ~/.nvm/nvm.sh
	nvm use stable >> /dev/null
	echo "Nvm config has been applied. You can use node and npm in your shell"
}

archey3
