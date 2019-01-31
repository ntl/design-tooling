#!/usr/bin/env bash

set -eu

echo
echo "Configuring Git"
echo "= = ="
echo

configure() {
  git config --replace-all --global core.pager 'less -F'
  git config --replace-all --global alias.s status
  git config --replace-all --global alias.sh show HEAD
  git config --replace-all --global alias.d diff
  git config --replace-all --global alias.dc 'diff --cached'
  git config --replace-all --global alias.dw 'diff --word-diff=color'
  git config --replace-all --global alias.dcw 'diff --cached --word-diff=color'
  git config --replace-all --global alias.ca 'commit --amend'
  git config --replace-all --global alias.lg 'log --oneline --decorate --graph'
  git config --replace-all --global alias.r 'rebase --preserve-merges --allow-empty-message'
  git config --replace-all --global alias.ri 'rebase --interactive --preserve-merges --allow-empty-message'
  git config --replace-all --global alias.fb 'filter-branch --tag-name-filter cat'
  git config --replace-all --global alias.list-remote-tags 'ls-remote --tags origin'
  git config --replace-all --global alias.empty-commit 'commit --allow-empty --allow-empty-message -m ""'
}

installBashCompletion() {
  git_completion=~/.bash/completion/git.bash

  curl -o $git_completion -z $git_completion https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
}

installScripts() {
  mkdir -p ~/.local/bin

  for script in ./git/scripts/*.bash; do
    echo $script
    #ln -svf $PWD/git/scripts/$script ~/.local/bin
  done
}

configure
installBashCompletion
installScripts
