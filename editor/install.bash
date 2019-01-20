#!/usr/bin/env bash

set -eu

echo
echo "Configuring Editor (Vim)"
echo "= = ="
echo

installPlugins() {
  local matchit theme

	mkdir -p ~/.vim/{bundle,plugin,colors}

	# Enable cross-brace completion via % key
	matchit=~/.vim/plugin/matchit.vim
	curl -o $matchit -z $matchit https://raw.githubusercontent.com/tmhedberg/matchit/master/plugin/matchit.vim

	# Theme
	theme=~/.vim/colors/base16-solarized-light.vim
	curl -o $theme -z $theme https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-solarized-light.vim

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

	# Ruby integration
	if [ -d ~/.vim/bundle/vim-ruby ]; then
		git -C ~/.vim/bundle/vim-ruby pull
	else
		git clone --depth 1 https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
	fi
}

configureVim() {
	mkdir -p ~/.vim

	ln -svf $PWD/editor/vimrc ~/.vim/vimrc
}

installPlugins
configureVim
