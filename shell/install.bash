#!/usr/bin/env bash

set -eu

echo
echo "Configuring Shell"
echo "= = ="
echo

configureBash() {
	mkdir -p ~/.bash

  ln -svf $PWD/shell/bashrc ~/.bashrc

	ln -svf $PWD/shell/completion ~/.bash
}

configureBash
