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

	curl -o ~/.bash/base16-tomorrow.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow.sh
	curl -o ~/.bash/base16-tomorrow-night.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow-night.sh
	curl -o ~/.bash/base16-solarized-light.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-light.sh
	curl -o ~/.bash/base16-solarized-dark.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-dark.sh

  if [ ! -s ~/.bashrc.local ]; then
    cp -v $PWD/shell/bashrc.local.default ~/.bashrc.local
  fi
}

configureBash
