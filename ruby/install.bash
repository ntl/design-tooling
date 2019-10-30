#!/usr/bin/env bash

installRubyInstall() {
	version=0.7.0
	tarball=$PWD/ruby/ruby-install-$version.tar.gz
  url=https://github.com/postmodern/ruby-install/archive/v${version}.tar.gz

  wget -O $tarball $url

  installDir=$PWD/ruby/ruby-install-$version

	tar -C $PWD/ruby -z -x -f $tarball

  pushd $installDir

  sudo make install

  popd
}

installRubyInstall
