#!/usr/bin/env bash

set -eu

echo
echo "Configuring Desktop Environment"
echo "= = ="
echo

configureGNOME() {
	dconf load / < $PWD/desktop-environment/gnome.dconf
}

configureLauncher() {
  mkdir -p ~/.local/share-applications

  desktop-file-validate $PWD/desktop-environment/firefox.desktop
  ln -svf $PWD/desktop-environment/firefox.desktop ~/.local/share/applications/firefox.desktop
}

configureLauncher
configureGNOME
