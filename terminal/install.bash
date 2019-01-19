#!/usr/bin/env bash

set -eu

echo
echo "Installing Terminal Emulator (Kitty)"
echo "= = ="
echo

installKitty() {
  installer=$PWD/terminal/kitty/installer.sh

  rm -rf ./terminal/kitty/kitty.app

  curl -o $installer -z $installer 'https://sw.kovidgoyal.net/kitty/installer.sh'

  /bin/sh $installer dest=./terminal/kitty launch=n

  mkdir -p ~/.local/bin

  ln -svf $PWD/terminal/kitty/kitty.app/bin/kitty ~/.local/bin
}

configureKitty() {
  mkdir -p ~/.config/kitty

  ln -svf $PWD/terminal/kitty.conf ~/.config/kitty
  ln -svf $PWD/terminal/color_scheme.conf ~/.config/kitty
  ln -svf $PWD/terminal/tab_bar.conf ~/.config/kitty
  ln -svf $PWD/terminal/typography.conf ~/.config/kitty
  ln -svf $PWD/terminal/keyboard_shortcuts.conf ~/.config/kitty

  mkdir -p ~/.local/share/applications

  cp -v $PWD/terminal/kitty/kitty.app/share/applications/kitty.desktop ~/.local/share/applications
}

installKitty
configureKitty
