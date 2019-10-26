#!/usr/bin/env bash

echo
echo "Updating Terminal Emulator Settings"
echo "= = ="
echo

dconf dump /com/gexperts/Tilix/ > terminal/tilix.dconf
