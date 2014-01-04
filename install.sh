#! /bin/sh

# install.sh
# expects dotfiles repo to be kept in ~/Google\ Drive/System\ Configuration/

#alias zsh files
ln -s ~/Google\ Drive/System\ Configuration/dot/.zshrc ~/.zshrc

#alias git files
ln -s ~/Google\ Drive/System\ Configuration/dot/.gitconfig ~/.gitconfig
ln -s ~/Google\ Drive/System\ Configuration/dot/.gitignore_global ~/.gitignore_global