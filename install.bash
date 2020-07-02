#!/bin/bash

set -eu

ready=1

if [ "${PROJECTS_HOME:-}" = "" ]; then
  echo "ERROR: PROJECTS_HOME is not set"
  ready=0
fi

if [ "${ARCHIVED_PROJECTS_HOME:-}" = "" ]; then
  echo "ERROR: ARCHIVED_PROJECTS_HOME is not set"
  ready=0
fi

if [ "$ready" = "0" ]; then
  exit 1
fi

./packages/install.bash

./desktop-environment/install.bash
./git/install.bash
./editor/install.bash
./projects/install.bash
./shell/install.bash
./terminal/install.bash
