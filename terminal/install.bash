#!/usr/bin/env bash

set -eu

echo
echo "Configuring Terminal Emulator (Tilix)"
echo "= = ="
echo

configureInputRC() {
  ln -svf $PWD/terminal/inputrc ~/.inputrc
}

configureInputRC
