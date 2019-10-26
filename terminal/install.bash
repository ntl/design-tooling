#!/usr/bin/env bash

set -eu

echo
echo "Configuring Terminal Emulator (Tilix)"
echo "= = ="
echo

configureTilix() {
  dconf reset -f /com/gexperts/Tilix

  dconf load /com/gexperts/Tilix/ < terminal/tilix.dconf

  mkdir -p ~/.config/tilix/schemes

  theme_file=~/.config/tilix/schemes/base16-tomorrow-night.json

  curl -o $theme_file -z $theme_file https://raw.githubusercontent.com/karlding/base16-tilix/master/tilix/base16-tomorrow-night.json
}

configureInputRC() {
  ln -svf $PWD/terminal/inputrc ~/.inputrc
}

configureTilix
configureInputRC
