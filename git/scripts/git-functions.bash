set -eu

git="git -C $PWD --git-dir=.git"

function dependency() {
  dependency=$1

  which git-verify-initial-commit || \
    source $(dirname $0)/$dependency
}

function export() {
  gitFunction=$1

  shift

  [[ $0 == ${BASH_SOURCE[1]} ]] \
    && $gitFunction $@ \
    || true
}
