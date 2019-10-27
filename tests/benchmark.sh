#!/usr/bin/env bash

function show_help() {
  echo '
    benchmark.sh <perl|node|--all>
  '
}

function exec_times() {
  local target="$1"
  local times=$2
  time (
    for i in $(seq ${times}); do
      $target < ./testfile.js 1> /dev/null
    done
  )
}

case "$1" in
  perl)
    echo ''
    echo 'benchmark perl:'
    exec_times 'eval perl -ne "print unless /^[\t ]*\/*[\t ]*console\.log\(.TCL:/"' 100;;
  node)
    echo ''
    echo 'benchmark node:'
    exec_times 'node --startup-blob=snapshot_blob.bin ../index.js' 100;;
  cat)
    echo ''
    echo 'benchmark cat:'
    exec_times 'cat' 100;;
  --all)
    ./$0 cat;
    ./$0 perl;
    ./$0 node;;
  -h|--help) show_help;;
  *) show_help;;
esac
