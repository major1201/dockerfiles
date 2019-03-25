export ZSH="/root/.oh-my-zsh"

ZSH_THEME="ys"
CASE_SENSITIVE="true"

plugins=(
  git
  colored-man-pages
  jsontools
  history-substring-search
  z
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export PATH="/usr/local/sbin:$PATH"
export EDITOR="vim"

# alias
alias ls="ls -A --color"
alias ll="ls -lhA --color"

HIST_STAMPS="%Y-%m-%d %H:%M:%S"

bindkey \^U backward-kill-line
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export LC_CTYPE="en_US.utf-8"

setopt dotglob
