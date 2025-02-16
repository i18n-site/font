#!/usr/bin/env coffee

> @3-/read
  @3-/extract
  @3-/write

ROOT = import.meta.dirname

CSS = {}

for i from read(ROOT+'/lib/_.css').split('}')
  i = i.trim()
  if not i
    continue

  name = extract('font-family:',';',i)
  CSS[name] = (CSS[name] or '')+i+'}'

for [k,v] from Object.entries CSS
  write(ROOT+'/lib/'+k+'.css',v)

