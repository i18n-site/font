#!/usr/bin/env bash

DIR=$(realpath ${0%/*})
cd $DIR
set -ex

./source-han-sans.sh

rm -rf lib
build

direnv exec . ./gen.coffee
./download.xsh FiraCode.css c
rsync -av woff2/ tmp

cd $DIR
bun x webpack --mode production
rm -rf lib/main.js
direnv exec . ./splitCss.coffee
