#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Desktop Environment"
echo "= = ="
echo

echo "GNOME dconf"
echo "- - - "
dconf load / < ./desktop-environment/gnome.dconf
echo

echo "Firefox"
echo "- - -"
desktop-file-validate ./desktop-environment/firefox.desktop
desktop-file-install --dir=$HOME/.local/share/applications ./desktop-environment/firefox.desktop
echo

echo "GEdit (Local)"
echo "- - -"
desktop-file-validate ./desktop-environment/gedit-local.desktop
desktop-file-install --dir=$HOME/.local/share/applications ./desktop-environment/gedit-local.desktop
echo

update-desktop-database ~/.local/share/applications

echo "(done)"
echo
