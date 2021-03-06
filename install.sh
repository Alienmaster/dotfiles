#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                                          # dotfiles directory
olddir=~/dotfiles_old                                   # old dotfiles backup directory
files="bashrc zshrc oh-my-zsh tmux.conf nanorc alias"   # list of files/folders to symlink in homedir

##########

# download submodules
git submodule update --init --recursive

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    if test -f ~/dotfiles_old/.$file; then
    mv ~/dotfiles_old/.$file{,$(date +'%Y%m%d')}
    fi
    cp -L ~/.$file ~/dotfiles_old/
    echo "Deleting old file and creating symlink to $file in home directory."
    rm ~/.$file
    ln -s $dir/$file ~/.$file
done
