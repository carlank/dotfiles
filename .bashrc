#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash transparency by default
# Need to figure out a way to mesh xcompmgr and paperview
# [ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

alias ls='ls --color=auto'
alias start='xdg-open'

# Common applications
alias aseprite='steam -applaunch 431730'

PS1='\A \u \W \$ '
PATH="$HOME/bin:$PATH"
alias config='/usr/bin/git --git-dir=/home/nsf/.dotfiles/ --work-tree=/home/nsf'
