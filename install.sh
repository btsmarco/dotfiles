#!/bin/bash
#
# Script for installing dotfiles
# Original from kladd https://github.com/kladd/dotfiles/blob/master/install.sh

install_path=$HOME
this_path=$PWD

echo "What prog are you using? (yum, apt-get)"
read program
cd
echo "Ready to start..........."
#installing necessary software
sudo $program install vim
sudo $program install git

# Clean directory back-up old configs
#if [ -e $install_path/.bashrc ] || [ -L $install_path/.bashrc ]; then
#    mv $install_path/.bashrc $install_path/.bashrc.orig
#    echo "Original '.bashrc' saved as '.bashrc.orig'"
#fi

#if [ -e $install_path/.bash_aliases ] || [ -L $install_path/.bash_aliases ]; then
#    mv $install_path/.bash_aliases $install_path/.bash_aliases.orig
#    echo "Original '.bash_aliases' saved as '.bash_aliases.orig'"
#fi

if [ -e $install_path/.gitconfig ] || [ -L $install_path/.gitconfig ]; then
    mv $install_path/.gitconfig $install_path/.gitconfig.orig
    echo "Original '.gitconfig' saved as '.gitconfig.orig'"
fi

if [ -e $install_path/.vimrc ] || [ -L $install_path/.vimrc ]; then
  mv $install_path/.vimrc $install_path/.vimrc.orig
  echo "Original '.vimrc' saved as '.vimrc.orig'"
fi

if [ -d $install_path/.vim ] || [ -L $install_path/.vim ]; then
    mv $install_path/.vim $install_path/.vim.orig
    echo "Original '.vim' saved as '.vim.orig'"
fi

# sym link new config files
echo "Creating symbolic links..."
#ln -s $this_path/bashrc $install_path/.bashrc
#ln -s $this_path/bash_aliases $install_path/.bash_aliases
ln -s $this_path/gitconfig $install_path/.gitconfig
ln -s $this_path/vimrc $install_path/.vimrc
ln -s $this_path/vim $install_path/.vim

echo "setting up Vim"
cd
bash ~/.vim/update.sh all

echo "Installation complete."
