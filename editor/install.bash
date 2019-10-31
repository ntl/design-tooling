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
	curl -o ~/.vim/plugin/matchit.vim https://raw.githubusercontent.com/tmhedberg/matchit/master/plugin/matchit.vim

	# Themes
	curl -o ~/.vim/colors/base16-tomorrow.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-tomorrow.vim
	curl -o ~/.vim/colors/base16-tomorrow-night.vim https://raw.githubusercontent.com/chriskempson/base16-vim/master/colors/base16-tomorrow-night.vim

	# Rename
	curl -o ~/.vim/plugin/rename.vim https://raw.githubusercontent.com/danro/rename.vim/master/plugin/rename.vim

	# Tmux Navigator
	curl -o ~/.vim/plugin/tmux_navigator.vim https://raw.githubusercontent.com/christoomey/vim-tmux-navigator/master/plugin/tmux_navigator.vim

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
	ln -svf $PWD/editor/keyboard_shortcuts.vim ~/.vim/keyboard_shortcuts.vim
	ln -svf $PWD/editor/file_types.vim ~/.vim/file_types.vim

  if [ ! -s ~/.vim/vimrc.local ]; then
    cp -v $PWD/editor/vimrc.local.default ~/.vim/vimrc.local
  fi
}

installPlugins
configureVim
