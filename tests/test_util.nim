discard """
  exitCode: 0
  output: ""
"""

import std/unittest
import std/random
import std/times

import faker/provider/util

block:
  checkpoint "proc formatNumbers"
  let now = times.getTime()
  var r = initRand(convert(Seconds, Nanoseconds, now.toUnix) + now.nanosecond)
  let tests = [
    ("#####", 5),
    ("###-###", 7),
    ("###-###x###.####", 16),
    ("+1-###-###", 10),
    ]
  for tt in tests:
    for i in 1..100:
      let (format, want) = tt
      let got = r.formatNumbers(format)
      check got.len == want
