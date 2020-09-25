#!/usr/bin/env bash

set -eu

sudo dnf install \
  dropbox \
  mozilla-fira-mono-fonts \
  mozilla-fira-sans-fonts \
  ruby \
  v4l-utils \
  vim-enhanced

sudo dnf groupinstall "Development Tools" "Development Libraries"

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude="PackageKit-gstreamer-plugin"
