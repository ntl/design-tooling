#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Terminal Emulator (GNOME Terminal)"
echo "= = ="
echo

symbolic-link ./terminal/inputrc ~/.inputrc
symbolic-link ./terminal/tmux.conf ~/.tmux.conf

dconf reset -f /org/gnome/terminal/
dconf load /org/gnome/terminal/ < ./terminal/terminal.dconf

echo "(done)"
echo
