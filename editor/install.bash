#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Editor (Vim)"
echo "= = ="
echo

echo "Installing Plugins"
echo "- - -"
echo

mkdir -p ~/.vim/{bundle,plugin,colors}

# Enable cross-brace completion via % key
download-file ~/.vim/plugin/matchit.vim https://raw.githubusercontent.com/tmhedberg/matchit/master/plugin/matchit.vim

# Themes
download-file ~/.vim/colors/base16-tomorrow.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-tomorrow.vim
download-file ~/.vim/colors/base16-tomorrow-night.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-tomorrow-night.vim
download-file ~/.vim/colors/base16-solarized-light.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-solarized-light.vim
download-file ~/.vim/colors/base16-solarized-dark.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-solarized-dark.vim

# Rename
download-file ~/.vim/plugin/rename.vim https://raw.githubusercontent.com/danro/rename.vim/master/plugin/rename.vim

# Tmux Navigator
download-file ~/.vim/plugin/tmux_navigator.vim https://raw.githubusercontent.com/christoomey/vim-tmux-navigator/master/plugin/tmux_navigator.vim

unset -f download-file

# Plugin system
if [ -d ~/.vim/bundle/vim-pathogen ]; then
  git -C ~/.vim/bundle/vim-pathogen pull
else
  git clone --depth 1 https://github.com/tpope/vim-pathogen ~/.vim/bundle/vim-pathogen
fi

# File browser
if [ -d ~/.vim/bundle/nerdtree ]; then
  git -C ~/.vim/bundle/nerdtree pull
else
  git clone --depth 1 https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
fi

# Ruby
if [ -d ~/.vim/bundle/vim-ruby ]; then
  git -C ~/.vim/bundle/vim-ruby pull
else
  git clone --depth 1 https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
fi

# Terraform
if [ -d ~/.vim/bundle/vim-terraform ]; then
  git -C ~/.vim/bundle/vim-terraform pull
else
  git clone --depth 1 https://github.com/hashivim/vim-terraform.git ~/.vim/bundle/vim-terraform
fi

echo "(done)"
echo

echo "Linking Configuration"
echo "- - -"

symbolic-link ./editor/vimrc ~/.vim/vimrc
symbolic-link ./editor/keyboard_shortcuts.vim ~/.vim/keyboard_shortcuts.vim
symbolic-link ./editor/file_types.vim ~/.vim/file_types.vim

if [ ! -s ~/.vim/vimrc.local ]; then
  cp -v ./editor/vimrc.local.default ~/.vim/vimrc.local
fi

echo "(done)"
echo

echo "Configuring GEdit"
echo "- - -"

mkdir -p ~/.local/share/gedit/plugins
git -C ~/.local/share/gedit/plugins clone --depth 1 https://github.com/hardpixel/gedit-strip-whitespace

echo "(done)"
echo "- - -"
