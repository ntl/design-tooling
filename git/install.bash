#!/usr/bin/env bash

set -eu

echo
echo "Configuring Git"
echo "= = ="
echo

configure() {
	if ! git config --global user.name; then
		git config --replace-all --global user.name "Nathan Ladd"
	fi

	if ! git config --global user.email; then
		git config --replace-all --global user.email "nathanladd@gmail.com"
	fi

	if ! git config --global user.signingkey; then
		git config --replace-all --global user.signingkey "nathanladd@gmail.com"
	fi

	git config --replace-all --global core.pager 'less -F'

	git config --replace-all --global alias.s status
	git config --replace-all --global alias.sh show HEAD
	git config --replace-all --global alias.d diff
	git config --replace-all --global alias.dc 'diff --cached'
	git config --replace-all --global alias.dw 'diff --word-diff=color'
	git config --replace-all --global alias.dcw 'diff --cached --word-diff=color'
	git config --replace-all --global alias.c 'commit --gpg-sign'
	git config --replace-all --global alias.ca 'commit --amend --gpg-sign'
	git config --replace-all --global alias.lg 'log --oneline --decorate --graph'
	git config --replace-all --global alias.r 'rebase --preserve-merges --allow-empty-message'
	git config --replace-all --global alias.ri 'rebase --interactive --rebase-merges --keep-empty --allow-empty-message'
	git config --replace-all --global alias.rc 'rebase --continue'
	git config --replace-all --global alias.rs 'rebase --preserve-merges --keep-empty --allow-empty-message'
	git config --replace-all --global alias.fb 'filter-branch --tag-name-filter cat'
	git config --replace-all --global alias.list-remote-tags 'ls-remote --tags origin'
	git config --replace-all --global alias.empty-commit 'commit --allow-empty --allow-empty-message -m ""'
}

installBashCompletion() {
	git_completion=~/.bash/completion/git.bash

	curl -o $git_completion -z $git_completion https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
}

installPrintGitBranch() {
	print_git_ref=~/.local/bin/print-git-ref

  mkdir -p $(dirname $print_git_ref)

  ln -svf $PWD/git/print-git-ref.bash $print_git_ref
}

configure
installBashCompletion
installPrintGitBranch
