#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Shell"
echo "= = ="
echo

mkdir -p ~/.bash

symbolic-link ./shell/bashrc ~/.bashrc
symbolic-link ./shell/bash_profile ~/.bash_profile
symbolic-link ./shell/completion ~/.bash

download-file ~/.bash/base16-tomorrow.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow.sh
download-file ~/.bash/base16-tomorrow-night.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow-night.sh
download-file ~/.bash/base16-solarized-light.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-light.sh
download-file ~/.bash/base16-solarized-dark.sh https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-solarized-dark.sh

ln -svf base16-tomorrow-night.sh ~/.bash/dark.sh
ln -svf base16-solarized-light.sh ~/.bash/light.sh

if [ ! -s ~/.bash_profile.local ]; then
  cp -v ./shell/bash_profile.local.default ~/.bash_profile.local
fi

echo "(done)"
echo
