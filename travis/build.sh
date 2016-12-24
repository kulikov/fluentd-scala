#!/bin/bash
set -e

if [[ "$TRAVIS_PULL_REQUEST" == "false" && "$TRAVIS_BRANCH" == "master" ]]; then
  echo "$oss_gpg_passphrase" | gpg --passphrase-fd 0 ./travis/gpg-public.asc.gpg
  echo "$oss_gpg_passphrase" | gpg --passphrase-fd 0 ./travis/gpg-private.asc.gpg

  sbt +test +publishSigned sonatypeReleaseAll
fi