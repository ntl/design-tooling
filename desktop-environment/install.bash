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
  desktop-file-validate $PWD/desktop-environment/firefox-user.desktop

  mkdir -p ~/.local/share-applications

  ln -svf $PWD/desktop-environment/firefox-user.desktop ~/.local/share/applications
}

configureLauncher
configureGNOME
