#!/bin/bash

source ./init.bash

echo
echo "Configuring Operating System"
echo "= = ="
echo

echo "Kernel: $(uname -a)"
echo "Core Count: $(nproc)"
echo
echo "MAKEFLAGS: $MAKEFLAGS"
echo "AUR_DIR: $AUR_DIR"
echo "PROJECTS_HOME: $PROJECTS_HOME"
echo "ARCHIVED_PROJECTS_HOME: $ARCHIVED_PROJECTS_HOME"
echo

./desktop-environment/install.bash
./git/install.bash
./editor/install.bash
./shell/install.bash
./terminal/install.bash
./projects/install.bash
