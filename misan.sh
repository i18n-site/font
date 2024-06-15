#!/usr/bin/env bash

DIR=$(realpath $0) && DIR=${DIR%/*}
cd $DIR
set -ex

if [ -f "./ttf/MiSansVF.ttf" ]; then
  exit 0
fi

mkdir -p tmp
cd tmp

if [ ! -d "nototools" ]; then
  git clone --depth=1 git@github.com:notofonts/nototools.git
  pip install -r nototools/requirements.txt
fi

if [ ! -d "misans" ]; then
  wget -c https://hyperos.mi.com/font-download/MiSans_Global_ALL.zip
  unzip -o MiSans_Global_ALL.zip

  mv MiSans\ Global\ _ALL misans
fi

cd misans
find . -type f -name "*.zip" | while read -r file; do
  filename="${file%.*}"
  if [ ! -d "$filename" ]; then
    unzip -o "$file"
  fi
done

rm -rf __MACOSX

cd $DIR
./misan.vf.py
cp -f tmp/misans/MiSans_VF.ttf ttf/misans.ttf
# https://github.com/KonghaYao/cn-font-split/issues/70
# cd $DIR
# export export PYTHONPATH=$PYTHONPATH:$DIR/tmp/nototools:$DIR/tmp/nototools/nototools
# ./misan.merge.py -d ./tmp/misans -o ttf/misans.ttf
