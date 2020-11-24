#
# ~/.bash_profile
#

export PATH="$PATH:$HOME/.bin"
export EDITOR='vim'
export TERMINAL='st'
export BROWSER='firefox'
export READER='zathura'
export RPOJECTS="$HOME/Projects"

# If bashrc exists load it
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep -x dwm || exec startx
fi
