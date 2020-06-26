#!/usr/bin/env bash

set -eu

echo
echo "Installing Packages"
echo "= = ="
echo

installArchPackages() {
  echo "Installing Arch packages"
  echo "- - -"
  echo

  sudo pacman --sync --needed --refresh $(cat $PWD/packages/arch-packages)

  echo "(done)"
  echo
}

installArchAURPackages() {
  for package_name in $(cat $PWD/packages/arch-aur-packages); do
    echo "Installing $package_name from AUR"
    echo "- - -"
    echo

    mkdir -p $PWD/packages/aur

    if [ ! -d $PWD/packages/aur/$package_name ]; then
      git -C $PWD/packages/aur \
        clone --depth 1 https://aur.archlinux.org/$package_name.git
    fi

    pushd $PWD/packages/aur/$package_name

    git fetch
    git reset --hard origin/master

    makepkg --syncdeps --install --skippgpcheck --needed

    popd

    echo '(done)'
    echo
  done
}

installArchPackages
installArchAURPackages
