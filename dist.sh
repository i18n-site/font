#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

mise exec -- dist.coffee $DIR
