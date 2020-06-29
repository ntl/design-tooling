#!/bin/bash

set -eu

./packages/install.bash

./desktop-environment/install.bash
./git/install.bash
./editor/install.bash
./projects/install.bash
./shell/install.bash
./terminal/install.bash
