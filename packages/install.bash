#!/usr/bin/env bash

source ./init.bash

echo
echo "Installing Packages"
echo "= = ="
echo

echo "Installing Arch base packages"
echo "- - -"
echo

sudo pacman \
  --sync \
  --needed \
  --color auto \
  --ignore gdm,libgdm,epiphany \
  $(cat ./packages/arch-base-packages)

echo "(done)"
echo

echo "Installing Arch packages"
echo "- - -"
echo

sudo pacman \
  --sync \
  --needed \
  --color auto \
  --noconfirm \
  $(cat ./packages/arch-packages)

echo "(done)"
echo

mkdir -p $AUR_DIR

echo "Installing Arch User Repository (AUR) packages"
echo "- - -"
echo

if [ ! -L ./packages/aur ]; then
  symbolic-link $AUR_DIR ./packages/aur
  echo
fi

for packageName in $(cat ./packages/arch-aur-packages); do
  echo "Package: $packageName"

  if pacman --query --quiet $packageName 2>&1 >/dev/null; then
    echo "(already installed; skipping)"
    echo
    continue
  fi

  if [ ! -d ./packages/aur/$packageName ]; then
    git -C ./packages/aur \
      clone --depth 1 https://aur.archlinux.org/$packageName.git
  fi

  pushd ./packages/aur/$packageName

  makepkg \
    --syncdeps \
    --install \
    --skippgpcheck \
    --needed \
    --noconfirm

  popd

  echo
done

echo "Configuring Dropbox"
echo "- - -"
systemctl --user enable dropbox
systemctl --user start dropbox
echo

echo "Configuring Scanner"
echo "- - -"
hostname=$(lpstat -s | grep MFC-L2700DW | sed -E -n 's|^.*lpd://(.*)/.*$|\1|p')
echo "Hostname: $hostname"
cmd="sudo brsaneconfig4 -a name=MFC-L2700DW model=MFC-L2700DW nodename=$hostname"
echo "Command: $cmd"
eval "$cmd"
echo

echo "(done)"
echo
