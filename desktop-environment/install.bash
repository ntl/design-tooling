#!/usr/bin/env bash

set -eu

echo
echo "Configuring Desktop Environment"
echo "= = ="
echo

configureGNOME() {
	dconf load / < $PWD/desktop-environment/gnome.dconf
}

configureGNOME


