#!/usr/bin/env bash

source ./init.bash

echo
echo "Configuring Git"
echo "= = ="
echo

git config --replace-all --global user.name "Nathan Ladd"
git config --replace-all --global user.email "nathanladd@gmail.com"
git config --replace-all --global user.signingkey "nathanladd@gmail.com"
git config --replace-all --global commit.gpgsign "true"
git config --replace-all --global pull.ff only

git config --replace-all --global core.pager 'less -F'

git config --replace-all --global alias.s status
git config --replace-all --global alias.sh show HEAD
git config --replace-all --global alias.d diff
git config --replace-all --global alias.dc 'diff --cached'
git config --replace-all --global alias.dw 'diff --word-diff=color'
git config --replace-all --global alias.dcw 'diff --cached --word-diff=color'
git config --replace-all --global alias.c 'commit'
git config --replace-all --global alias.ca 'commit --amend'
git config --replace-all --global alias.lg 'log --oneline --decorate --graph'
git config --replace-all --global alias.r 'rebase --preserve-merges --allow-empty-message'
git config --replace-all --global alias.ri 'rebase --interactive --rebase-merges --keep-empty --allow-empty-message'
git config --replace-all --global alias.rc 'rebase --continue'
git config --replace-all --global alias.rs 'rebase --preserve-merges --keep-empty --allow-empty-message'
git config --replace-all --global alias.fb 'filter-branch --tag-name-filter cat'
git config --replace-all --global alias.list-remote-tags 'ls-remote --tags origin'
git config --replace-all --global alias.empty-commit 'commit --allow-empty --allow-empty-message -m ""'

print_git_ref=~/.local/bin/print-git-ref

mkdir -p $(dirname $print_git_ref)

symbolic-link ./git/print-git-ref.bash $print_git_ref
echo

echo "(done)"
echo
