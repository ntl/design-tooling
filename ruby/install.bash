#!/usr/bin/env bash

set -eu

echo
echo "Installing Ruby"
echo "= = ="
echo

installationRoot=$PWD/ruby/installation

mkdir -p $installationRoot

installChruby() {
	version=0.3.9

	tarball=$installationRoot/chruby-$version.tar.gz

	curl -L -o $tarball -z $tarball https://github.com/postmodern/chruby/archive/v$version.tar.gz

	tar -C $installationRoot -x -z -f $tarball

	pushd $installationRoot/chruby-$version

  make install PREFIX=~/.local
}

installRubyInstall() {
  version=0.7.0

	tarball=$installationRoot/ruby-install-$version.tar.gz

	curl -L -o $tarball -z $tarball https://github.com/postmodern/ruby-install/archive/v$version.tar.gz

	tar -C $installationRoot -x -z -f $tarball

	pushd $installationRoot/ruby-install-$version

  make install PREFIX=~/.local
}

installChruby
installRubyInstall
