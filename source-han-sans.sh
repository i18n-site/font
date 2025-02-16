#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

NAME=SourceHanSans-VF.ttf

if [ -f "ttf/$NAME" ]; then
  exit 0
fi

cd tmp
wget -c https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSans-VF.zip

unzip -o SourceHanSans-VF.zip
cd ..
cp -f tmp/Variable/TTF/$NAME ttf
