#!/usr/bin/env bash

source ./init.bash

source ./projects/projects.bash

personalGitAuthority="git@github.com:ntl"
testBenchGitAuthority="git@github.com:test-bench"
eventideGitAuthority="git@github.com:eventide-project"

cloneProject() {
  project=$1
  authority=$2
  dir=${3:-$PROJECTS_HOME}

  if [ -d "$dir/$project" ]; then
    echo "Skipping $project; already cloned"
    echo
  else
    echo "Cloning $project into $dir"
    echo "- - -"
    echo

    git -C $dir clone "$authority/$project.git"

    echo
  fi
}

echo
echo "Downloading personal projects"
echo "= = ="
echo
echo "Projects Directory: $PROJECTS_HOME"
echo

mkdir -v -p $PROJECTS_HOME

for project in ${personal_projects[@]}; do
  cloneProject $project $personalGitAuthority
done

echo
echo "Downloading archived personal projects"
echo "= = ="
echo
echo "Projects Directory: $ARCHIVED_PROJECTS_HOME"
echo

mkdir -v -p $ARCHIVED_PROJECTS_HOME

for project in ${archived_personal_projects[@]}; do
  cloneProject $project $personalGitAuthority
done

echo
echo "Downloading TestBench projects"
echo "= = ="
echo
echo "Projects Directory: $PROJECTS_HOME"
echo

for project in ${test_bench_projects[@]}; do
  cloneProject $project $testBenchGitAuthority
done

echo
echo "Downloading Eventide projects"
echo "= = ="
echo
echo "Projects Directory: $PROJECTS_HOME"
echo

cloneProject contributor-assets $eventideGitAuthority

pushd $PROJECTS_HOME/contributor-assets

./get-projects.sh

popd
echo
