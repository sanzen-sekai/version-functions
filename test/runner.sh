#!/bin/bash

if [ ! -x ./test/runner.sh ]; then
  echo run at ./version-functions
  exit 1
fi
if [ ! -f ./bin/version-functions.sh ]; then
  echo run at ./version-functions
  exit 1
fi

PATH=$(pwd)/bin:$PATH

for testcase in test/test_*; do
  if [ -x "$testcase" ]; then
    echo $testcase
    $testcase
  fi
done
