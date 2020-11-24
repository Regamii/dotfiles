#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] $$ return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# prompt
PS1='\[\e[0m\][\[\e[0m\]$?\[\e[0m\]]\[\e0\[\e[0m\][\[\e[0;1;91m\]\u\[\e[0m\]@\[\e[0;1;91m\]\h\[\e[0m\]:\[\e[0;1;38;5;27m\]\w\[\e[0m\]]\[\e[m\] \[\e[0m\](\[\e[0;1;92m\]$(git branch 2>/dev/null | grep '"'"'^*'"'"' | colrm 1 2)\[\e[0m\])\[\e[0m\]\$\[\e[m\] \[\e0'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# more aliases
alias sdn='sudo shutdown now'
alias SS='sudo systemctl'
