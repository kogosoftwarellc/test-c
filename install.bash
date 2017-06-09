#!/bin/bash

set -e

testcdir="$HOME/.test-c"

mkdir -p "$testcdir"

cd "$testcdir"

function download() {
  curl -sk "https://raw.githubusercontent.com/kogosoftwarellc/test-c/master/$1" \
    | tee "$1" > /dev/null
}

function error() {
  echo "$1" >&2
}

shafile=current-sha
oldsha=''

if [[ -f "$shafile" ]]; then
  oldsha="`cat $shafile`"
fi

if [[ -n "$oldsha" ]]; then
  oldsha="${oldsha:0:7}"
fi

download test-c
chmod +x test-c
download test-c.h
download README.md
download LICENSE
curl -sk \
     -H 'Accept: application/vnd.github.VERSION.sha' \
     https://api.github.com/repos/kogosoftwarellc/test-c/commits/HEAD \
     | tee "$shafile" > /dev/null

newsha="`cat $shafile`"
newsha="${newsha:0:7}"

sessionfile=".bash_profile"

if [[ ! -f "$HOME/.bash_profile" ]]; then
  sessionfile=''

  if [[ -f "$HOME/.profile" ]]; then
    sessionfile=".profile"
  elif [[ -f "$HOME/.bash_aliases" ]]; then
    sessionfile=".bash_aliases"
  elif [[ -f "$HOME/.zshrc" ]]; then
    sessionfile=".zshrc"
  elif [[ -f "$HOME/.bashrc" ]]; then
    sessionfile=".bashrc"
  fi
fi

if [[ -z "$sessionfile" ]]; then
  error "No \\.(bash(rc|_aliases)|profile) file found!"
  error "You'll have to manually add $testcdir/test-c to your PATH."
else
  if [[ -z "`grep '/\.test-c:' $HOME/$sessionfile`" ]]; then
    cat >> "$HOME/$sessionfile" <<~

# Added by [test-c](https://github.com/kogosoftwarellc/test-c) `date`
export PATH="$testcdir:\$PATH"
~
  fi

  echo "test-c ($newsha) is ready to use!"

  if [[ -n "$oldsha" && "$oldsha" != "$newsha" ]]; then
    echo "... old sha was $oldsha"
  fi
fi
