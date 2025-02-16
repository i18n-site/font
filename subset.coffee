#!/usr/bin/env coffee

> fontkit > openSync
  fs > existsSync
  path > join
  opentype.js > load
  ./top10000.js

ROOT = import.meta.dirname
TOP10000 = [...top10000].map (i)=> i.charCodeAt 0
IGNORE = new Set TOP10000
cmp = (a, b) => a - b

export default main = (ttf, cutnum)=>
  ttf = await load(ttf)
  exist = new Set
  same = new Map

  unicodes = new Set

  for [key, val] from Object.entries ttf.glyphs.glyphs
    u = val.unicodes
    u.sort(cmp)
    if u.length
      i = u.shift()
      if u.length
        same.set i, u

      if IGNORE.has i
        exist.add i
      else
        unicodes.add i

  for i from Object.values same
    for j from i
      exist.remove j

  unicodes = [...unicodes]

  unicodes.sort(cmp)

  li = []
  t = []
  for i from unicodes
    t.push i
    sli = same.get i
    if sli
      for j from sli
        t.push j
    if t.length >= cutnum
      t.sort(cmp)
      li.push t
      t = []

  if t.length
    if li.length
      end = li.at(-1)
      while end.length > t.length
        t.push(end.pop())
      t.sort(cmp)
    li.push t

  t = []
  for i from TOP10000
    if not exist.has i
      continue
    t.push i
    sli = same.get i
    if sli
      for j from sli
        t.push j
    if t.length >= cutnum
      t.sort(cmp)
      li.push t
      t = []

  if t.length
    if li.length
      end = li.at(-1)
      while end.length > t.length
        t.push(end.pop())
    t.sort(cmp)
    li.push t

  return li

# li = (await main(join(ROOT, 'ttf/SourceHanSans-VF.ttf'),860))
# console.log li.length
# main(join(ROOT, 'ttf/AlimamaFangYuanTiVF-Thin.ttf'))
