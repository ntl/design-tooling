set -eu

AUR_DIR=${AUR_DIR:-~/aur}
MAKEFLAGS=${MAKEFLAGS:--j$(nproc)}
PROJECTS_HOME=${PROJECTS_HOME:-$(dirname $PWD)}
ARCHIVED_PROJECTS_HOME=${ARCHIVED_PROJECTS_HOME:-$PROJECTS_HOME/archive}

download-file() {
  localPath=$1
  remotePath=$2

  if [ -f $localPath ]; then
    timeCond="--time-cond $localPath"
  else
    timeCond=""
  fi

  echo "$localPath"
  curl $timeCond -o $localPath $remotePath
  echo
}
