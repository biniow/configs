#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep --color'

PATH="${PATH}:~/bin"

# Git
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWUPSTREAM='auto'

source /usr/share/git/completion/git-prompt.sh

PS1='\n\t \[\033[32m\][\w\[\033[33;1m\]$(__git_ps1 " (%s)")\[\033[m\]\[\033[32m\]] \[\033[m\]\n\u@precision -> '

EDITOR=/usr/bin/vim

if [[ -f "${HOME}/.config/cloudtoken/bashrc_additions" ]]; then
    source "${HOME}/.config/cloudtoken/bashrc_additions"
fi

source /usr/share/doc/pkgfile/command-not-found.bash

shopt -s autocd # autocd into directory
shopt -s checkwinsize # fix for windows size

archey3

