#!/bin/bash

. version-functions.sh

assert_version(){
  if [ "$1" != "$version" ]; then
    echo "expect: '$1', got: '$version' -- $2"
    exit 1
  fi
}

test_build_next(){
  local version


  version_build_next major ''
  assert_version 1.0.0 "major ''"

  version_build_next minor ''
  assert_version 0.1.0 "minor ''"

  version_build_next patch ''
  assert_version 0.0.1 "patch ''"

  version_build_next beta ''
  assert_version 0.999.0 "beta ''"


  version_build_next major 1.0.0
  assert_version 2.0.0 "major 1.0.0"

  version_build_next minor 1.0.0
  assert_version 1.1.0  "minor 1.0.0"

  version_build_next patch 1.0.0
  assert_version 1.0.1 "patch 1.0.0"

  version_build_next beta 1.0.0
  assert_version 1.999.0 "beta 1.0.0"

  version_build_next beta 1.999.1
  assert_version 1.999.2 "beta 1.999.1"

  version_build_next minor 1.999.0
  assert_version 2.0.0 "minor 1.999.0"


  version_build_next major 1.0.0.tmp
  assert_version 2.0.0 "major 1.0.0.tmp"

  version_build_next minor 1.0.0.tmp
  assert_version 1.1.0 "minor 1.0.0.tmp"

  version_build_next patch 1.0.0.tmp
  assert_version 1.0.1.tmp "patch 1.0.0.tmp"

  version_build_next beta 1.0.0.tmp
  assert_version 1.999.0 "beta 1.0.0.tmp"
}

test_build_next
echo all green
