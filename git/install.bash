#!/usr/bin/env bash

set -eu

echo
echo "Configuring Git"
echo "= = ="
echo

git config --replace-all --global alias.s status
git config --replace-all --global alias.sh show HEAD
git config --replace-all --global alias.d diff
git config --replace-all --global alias.dc 'diff --cached'
git config --replace-all --global alias.ca 'commit --amend'
git config --replace-all --global alias.lg 'log --oneline --decorate --graph'
git config --replace-all --global alias.r 'rebase --preserve-merges --allow-empty-message'
git config --replace-all --global alias.ri 'rebase --interactive --preserve-merges --allow-empty-message'
git config --replace-all --global alias.fb 'filter-branch --tag-name-filter cat'
