import random
from strutils import join, align
from math import `^`

const
  asciiUpperCase = {'A'..'Z'}

proc formatNumbers*(r: var Rand, format: string): string =
  ## Replace '#' to random number.
  proc alignFmt(r: var Rand, buf: string): string =
    let max = 10 ^ buf.len - 1
    let num = $r.rand(1..max)
    result = num.align(buf.len, '0')

  var buf: string
  for ch in format:
    if ch == '#':
      buf.add(ch)
      continue
    if 0 < buf.len:
      result.add(alignFmt(r, buf))
      buf = ""
    result.add(ch)
  if 0 < buf.len:
    result.add(alignFmt(r, buf))

proc formatUpperAscii*(r: var Rand, format: string): string =
  ## Replace '?' to random upper ascii character.
  for ch in format:
    if ch == '?':
      result.add(r.sample(asciiUpperCase))
      continue
    result.add(ch)
