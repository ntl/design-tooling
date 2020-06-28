#!/usr/bin/env bash

set -eu

echo
echo "Configuring Cryptography"
echo "= = ="
echo

configureGPG() {
	mkdir -p ~/.gnupg

	ln -svf $PWD/cryptography/gpg-agent.conf ~/.gnupg/gpg-agent.conf

	gpg-connect-agent reloadagent /bye
}

configureGNOMEKeyring() {
	cp -v /etc/xdg/autostart/gnome-keyring-ssh.desktop ~/.config/autostart/gnome-keyring-ssh.desktop

	echo "Hidden=true" >> ~/.config/autostart/gnome-keyring-ssh.desktop
}

configureGPG
configureGNOMEKeyring
