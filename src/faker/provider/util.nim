import random
from strutils import join, align
from math import `^`

proc formatNumbers*(r: var Rand, format: string): string =
  proc alignFmt(r: var Rand, buf: string): string =
    let max = 10 ^ buf.len - 1
    let num = $r.rand(1..max)
    result = num.align(buf.len, '0')

  var buf: string
  for s in format:
    if s == '#':
      buf.add(s)
      continue
    if 0 < buf.len:
      result.add(alignFmt(r, buf))
      buf = ""
    result.add(s)
  if 0 < buf.len:
    result.add(alignFmt(r, buf))
