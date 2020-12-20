# dotfiles
## What are dotfiles?
Dotfiles are plain text configuration files on Unix like operating systems. Some
examples are `~/.bashrc` and `~/.vimrc`. They are named *dotfiles* because these
files typically begin with a period `.` making them hidden files.

Because these are plain text files git can be used to track changes.

## XDG Base Directory Specification
Before [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
dotfiles(user-configuration), user-data, user-cache and user-runtime used to
reside in the users homedirectory. Now these files are located elsewhere in the
user homedirectory using environment variables.

The specific environment variables can be found here: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html#variables

The Arch Linux Wiki has compiled a list of which programs support
*XDG Base Directory* here: https://wiki.archlinux.org/index.php/XDG_Base_Directory


## Managing dotfiles
Copying or moving each individual file is a cumbersome job. Especially when each
specific program can have a different name/location for their config file.
Fortunately there is a tool that makes this job easy: [GNU Stow](https://www.gnu.org/software/stow/)
### GNU Stow
>   GNU Stow is a symlink farm manager which takes distinct packages of software
and/or data located in separate directories on the filesystem, and makes them
appear to be installed in the same place.

GNU Stow creates symlinks form the `-t` directory to the files/directories in
the `stow` directory. `~/.bashrc -> ~/devel/dotfiles/stow/.bashrc` In this
example `~/.bashrc` links to `~/devel/dotfiles/stow/.bashrc`.

### GNU Stow Command
To successfully stow the right files to the right location `cd` into the cloned
directory. By default, when `-t` flag is not given, GNU Stow will stow in the
parent directory. The current working directory in this example is
`~/devel/dotfiles`. `dotfiles` Is this repository.

```
stow -t $HOME stow/
```

When a file already exists in the target directory `-t` GNU Stow will give a
warning. Remove the reported files in the target directory to proceed.
```
WARNING! stowing stow would cause conflicts:
  * existing target is neither a link nor a directory: .bashrc
  * existing target is neither a link nor a directory: .bash_profile
All operations aborted.
```

## Package managers
In the root of the repository are package lists. `pacman.txt` Can also be used
with `pacstrap` during the Arch Linux installation:
`pacstrap /mnt - < pacman.txt`.

Commands to output these files:
```
apm list --installed --bare --versions=false > apm.txt
composer global show -N -D > composer.txt
pacman -Qqe > pacman.txt
```

Commands to install packages:
```
apm install < apm.txt
composer global require $(cat composer.txt) 
pacman --needed -S - < pacman.txt
```

## Dconf
GNOME uses a dconf database for its settings. Use the following command to dump
all gnome-dconf settings:
```
dconf dump / > dconf.txt
```

Command to load dconf settings:
```
dconf load / < dconf.txt
```
