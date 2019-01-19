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

  mkdir -p ~/bin

  ln -svf $PWD/terminal/kitty/kitty.app/bin/kitty ~/bin
}

configureKitty() {
  mkdir -p ~/.config/kitty

  ln -svf $PWD/terminal/kitty.conf ~/.config/kitty
}

installKitty
configureKitty
