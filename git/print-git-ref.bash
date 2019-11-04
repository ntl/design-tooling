#!/usr/bin/env bash

set -eu

directory=${1:-.}

git -C $directory symbolic-ref --quiet --short HEAD 2>/dev/null \
  || echo "(none)"
