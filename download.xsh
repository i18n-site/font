#!/usr/bin/env xonsh

p"~/.xonshrc".exists() && source ~/.xonshrc

from fire import Fire
from os.path import dirname,abspath,join
import traceback
from pathlib import Path

ROOT = dirname(abspath(__file__))

@Fire
def main(cssFile,outName):
  cd @(ROOT)
  li = $(cat @(cssFile)|grep url)

  fontdir = cssFile[:-4]
  outdir = f"{ROOT}/woff2/{outName}"
  mkdir -p @(outdir)
  cd @(outdir)

  def line_url(i):
    i = i.strip()
    if not i:
      return i
    url = i.split("(")[1].split(")")[0]
    return url

  n = 0
  filemap = {}
  for i in li.split("\n"):
    url = line_url(i)
    if not url:
      continue

    download_url = url.strip('"\'')
    if download_url.startswith("//"):
      download_url = "https:"+download_url

    outname = str(n)+Path(download_url).suffix
    n+=1

    wget -c @(download_url) -O @(outname)

    filemap[url]=outname

  fontFamily = fontdir.replace("-"," ")
  outLi = []
  with open(join(ROOT,cssFile)) as f:
    for i in f:
      i = i.strip()
      if not i:
        continue
      if "url(" in i:
        url = line_url(i)
        i = i.replace(
            url,
            f"\"./{outName}/{filemap[url]}\"")
      if i.startswith("font-family"):
        i = f"font-family: {outName};"
      outLi.append(i)

  with open(join(ROOT,"tmp",outName+'.styl'),"w") as f:
    f.write("\n".join(outLi))
