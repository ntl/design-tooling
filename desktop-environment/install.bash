#!/usr/bin/env bash

set -eu

echo
echo "Configuring Desktop Environment"
echo "= = ="
echo

configureGNOME() {
	dconf load / < $PWD/desktop-environment/gnome.dconf
}

configureFirefox() {
  pushd $PWD/desktop-environment/

  curl -o firefox-nightly-assets.zip https://3u26hb1g25wn1xwo8g186fnd-wpengine.netdna-ssl.com/files/2019/10/Firefox-Browser-Nightly-Logo-Assets.zip
  unzip -u firefox-nightly-assets.zip -d ./firefox-nightly-assets/

  popd
}

configureGNOME
configureFirefox
