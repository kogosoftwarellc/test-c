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

download test-c
chmod +x test-c
download test-c.h
download README.md
download LICENSE

sessionfile=".bashrc"

if [[ ! -f "$HOME/.bashrc" ]]; then
  sessionfile=''

  if [[ -f "$HOME/.profile" ]]; then
    sessionfile=".profile"
  elif [[ -f "$HOME/.bash_aliases" ]]; then
    sessionfile=".bash_aliases"
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

  echo "test-c is ready to use!"
fi
