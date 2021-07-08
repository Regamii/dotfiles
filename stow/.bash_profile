#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin:$HOME/.bin:$HOME/.config/composer/vendor/bin:$PATH"
export EDITOR='vim'
export PROJECTS="$HOME"/Projects
export GPG_TTY=$(tty)

# XDG
## Default directories
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_RUNTIME_DIR=/run/user/"$UID"

## Config Clean-up
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export SCREENRC="$XDG_CONFIG_HOME"/screen/screenrc
export HTOPRC="$XDG_CONFIG_HOME"/htop/htoprc

## Cache Clean-up
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history

## Data Clean-up
export HISTFILE="$XDG_DATA_HOME"/bash/history
export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history
export SQLITE_HISTORY=$XDG_DATA_HOME/sqlite_history
export ATOM_HOME="$XDG_DATA_HOME"/atom
export PASSWORD_STORE_DIR="$XDG_DATA_HOME"/pass
export ATOM_HOME="$XDG_DATA_HOME"/atom

## Runtime Clean-up
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

# If bashrc exists load it
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Run startx if $DISPLAY is not set and tty is /dev/tty1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx "$XINITRC"
fi
