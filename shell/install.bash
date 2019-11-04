#!/usr/bin/env bash

set -eu

echo
echo "Configuring Shell"
echo "= = ="
echo

configureBash() {
	mkdir -p ~/.bash

  ln -svf $PWD/shell/bashrc ~/.bashrc
  ln -svf $PWD/shell/bash_profile ~/.bash_profile

	ln -svf $PWD/shell/completion ~/.bash

	curl -o ~/.bash/base16-tomorrow.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow.sh
	curl -o ~/.bash/base16-tomorrow-night.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow-night.sh
	curl -o ~/.bash/base16-solarized-light.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-light.sh
	curl -o ~/.bash/base16-solarized-dark.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-dark.sh

  if [ ! -s ~/.bash_profile.local ]; then
    cp -v $PWD/shell/bash_profile.local.default ~/.bash_profile.local
  fi
}

configureBash
