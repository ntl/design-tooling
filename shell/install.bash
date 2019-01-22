#!/usr/bin/env bash

set -eu

echo
echo "Configuring Shell"
echo "= = ="
echo

configureBash() {
	mkdir -p ~/.bash

  ln -svf $PWD/shell/bashrc ~/.bashrc

	ln -svf $PWD/shell/completion ~/.bash

  theme_file=~/.bash/color_theme.bash

	curl -o $theme_file -z $theme_file https://raw.githubusercontent.com/chriskempson/base16-shell/master/scripts/base16-tomorrow-night.sh

  git_completion=~/.bash/completion/git.bash

  curl -o $git_completion -z $git_completion https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
}

configureBash
