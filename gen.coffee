#!/usr/bin/env coffee

> cn-font-split > fontSplit
  path > join
  zx/globals:
  @3-/uridir
  @3-/read
  @3-/write
  @3-/walk > walkRel
  fs > existsSync readFileSync
  # ./subset.coffee

$.verbose = true

ROOT = uridir(import.meta)

cd ROOT

fsplit = (font, outDir, fontFamily)=>
  console.log {
    font, outDir
    fontFamily
  }
  input = new Uint8Array(readFileSync(font).buffer)
  fontSplit {
    input
    outDir
    targetType: 'woff2'
    chunkSize: 1024*512
    testHTML: true
    reporter: true
    threads: {}
    autoChunk: true
    css: {
      fontFamily
      localFamily:false
    }
  }

TTF = join ROOT, 'ttf'
WOFF2 = join ROOT, 'woff2'

rename = (dst, to_name)=>
  css_fp = join dst,'result.css'
  css = read css_fp
  css = css.replaceAll(
    '"'+to_name+'"'
    to_name
  ).replaceAll(
    'local('+to_name+'),'
    ''
  )
  write(
    join dst, 'f.styl'
    css
  )
  return

gen = (font_file, fontFamily, fontWeight)=>
  # await fsplit(
  #   join TTF,'TungstenCompressed-Light.ttf'
  #   join WOFF2,'v'
  # )

  dst = join WOFF2, fontFamily
  console.log font_file
  await fsplit(
    join TTF, font_file
    dst
    fontFamily
    fontWeight
  )

  rename dst, fontFamily
  return

await gen('AlimamaFangYuanTiVF-Thin.ttf', 'h')
await gen('SourceHanSans-VF.ttf','s')
# await gen('misans.ttf', 'MiSans VF','s','1 999')

# sinter = join TTF, 'sinter'

# DIST = join WOFF2, 's'
#
# await $"mkdir -p #{DIST}"

# WEIGHT = {
#   ExtraLight: 200
#   Light: 300
#   Regular: 400
#   Normal: 400
#   Medium: 500
#   Bold: 700
#   Heavy: 800
# }

# for await rfp from walkRel sinter
#   if not rfp.endsWith '.otf'
#     continue
#   name = rfp.slice(0,-4)
#   if name == 'Normal'
#     # https://github.com/chiron-fonts/chiron-sans-hk/issues/13
#     continue
#   fp = join sinter, name+'.ttf'
#   if not existsSync fp
#     cd sinter
#     await $"bun x otf2ttf #{name}.otf"
#
#   weight_name = name.split('-').pop()
#   weight = WEIGHT[weight_name]+''
#
#   dst = join(DIST, weight)
#   await fsplit fp, dst
#   rename dst, 'Sinter '+weight_name, 's', weight

process.exit()
