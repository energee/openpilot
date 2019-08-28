#!/bin/bash
set -ev

if ! git diff --name-only $TRAVIS_COMMIT_RANGE | grep -qvE '(\.md$)'
then
  if [ "$TRAVIS_PULL_REQUEST" != "false" ]
  then
    echo "Only docs updated, exiting build."
    exit 0
  fi
fi

set +ev
