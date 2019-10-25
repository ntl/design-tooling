#!/usr/bin/env bash

set -eu

echo
echo "Configuring Shell"
echo "= = ="
echo

configureBash() {
	mkdir -p ~/.bash

  ln -svf $PWD/shell/bashrc ~/.bashrc

	ln -svf $PWD/shell/completion ~/.bash

  theme_file=~/.bash/color_theme.bash

	curl -o $theme_file -z $theme_file https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow-night.sh
}

configureInputRC() {
  ln -svf $PWD/inputrc ~/.inputrc
}

configureBash
configureInputRC
