#! /bin/sh

# install.sh
# expects dotfiles repo to be kept in ~/bin/

#alias zsh files
ln -s ~/bin/dotfiles/zsh      ~/.zsh
ln -s ~/bin/dotfiles/zsh/zshrc ~/.zshrc

#alias vim files
ln -s ~/bin/dotfiles/vim       ~/.vim
ln -s ~/bin/dotfiles/vim/vimrc ~/.vimrc
ln -s ~/bin/dotfiles/vim/gvimrc ~/.gvimrc

#alias git files
ln -s ~/bin/dotfiles/gitconfig ~/.gitconfig
