#
# ~/.bash_profile
#

export PATH="$HOME/.bin:$HOME/.config/composer/vendor/bin:$PATH"
export EDITOR='vim'
export PROJECTS="$HOME"/Projects
export GPG_TTY=$(tty)

# XDG
## Default directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share

## Vim Clean-up
[ -d $XDG_DATA_HOME/vim/undo ] || mkdir -p "$XDG_DATA_HOME"/vim/undo
[ -d $XDG_DATA_HOME/vim/swap ] || mkdir -p "$XDG_DATA_HOME"/vim/swap
[ -d $XDG_DATA_HOME/vim/backup ] || mkdir -p "$XDG_DATA_HOME"/vim/backup
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

## Config Clean-up
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export ATOM_HOME="$XDG_DATA_HOME"/atom

## Cache Clean-up
export LESSHISTFILE="-"

## Data Clean-up
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export ATOM_HOME="$XDG_DATA_HOME"/atom
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass

## Runtime Clean-up
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# If bashrc exists load it
[[ -f ~/.bashrc ]] && . ~/.bashrc
