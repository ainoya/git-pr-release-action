#!/bin/sh

set -eu
git config remote.origin.url || true
git-pr-release
