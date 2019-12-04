#!/bin/bash

# Clones a personal fork of a repo, checks out the develop branch
# sets upstream to a specified upstream_org (i.e. my employer)

args=("$@")

upstream_org="ctsit"

git clone "$1"
echo "\nRepo cloned!\n"

repo=$(echo ${1##*/}) # split by / and return final
repo_dir=$(echo "$repo" | cut -d . -f 1)

cd $repo_dir

echo "Tracking develop"
git checkout develop

echo "Setting upstream"
upstream_repo="git@github.com:${upstream_org}/${repo}"

git remote add upstream "$upstream_repo"
git remote -v
git fetch --all

