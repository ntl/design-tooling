#!/usr/bin/env bash

set -eu

echo
echo "Installing Packages"
echo "= = ="
echo

installArchBasePackages() {
  echo "Installing Arch base packages"
  echo "- - -"
  echo

  sudo pacman --sync --needed --refresh --ignore gdm --ignore libgdm --ignore epiphany $(cat $PWD/packages/arch-base-packages)

  echo "(done)"
  echo
}

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

	ln -svf /usr/share/applications/dropbox.desktop ~/.config/autostart/dropbox.desktop
}

installArchBasePackages
installArchPackages
installArchAURPackages

echo "Configuring scanner"
echo "- - -"
echo

hostname=$(lpstat -s | grep MFC-L2700DW | sed -E -n 's|^.*lpd://(.*)/.*$|\1|p')
echo "Hostname: $hostname"

cmd="sudo brsaneconfig4 -a name=MFC-L2700DW model=MFC-L2700DW nodename=$hostname"
echo "Command: $cmd"

eval "$cmd"

echo "(done)"
echo
