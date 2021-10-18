#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash transparency by default
# Need to figure out a way to mesh xcompmgr and paperview
# [ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

alias ls='ls --color=auto'
alias rm='rm -i'
alias start='xdg-open'
# alias exa='exa --icons'
alias exalt='exa -lTL 2'

# Common applications
alias za='zathura'
alias aseprite='steam -applaunch 431730'
alias icat='kitty +kitten icat'

PS1='\A \u \W \$ '
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export EDITOR="/usr/bin/nvim"
# ew
alias config='/usr/bin/git --git-dir=/home/nsf/.dotfiles/ --work-tree=/home/nsf'
. "$HOME/.cargo/env"

source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash
