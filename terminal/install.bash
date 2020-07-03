#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Terminal Emulator (GNOME Terminal)"
echo "= = ="
echo

ln -svf ./terminal/inputrc ~/.inputrc

ln -svf ./terminal/tmux.conf ~/.tmux.conf

dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < ./terminal/terminal.dconf

echo "(done)"
echo
