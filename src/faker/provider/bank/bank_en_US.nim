include interfaces

import tables
from strutils import join, parseBiggestUInt
from strformat import `&`
from sequtils import mapIt

const
  countryCode = "GB"
  bbanFormat = "#############"
  asciiUpperCase = {'A'..'Z'}

let
  alpha = block:
    var tbl = initTable[char, string]()
    for ch in asciiUpperCase:
      tbl.add(ch, $(ch.ord mod 55))
    tbl

proc bankCountry*(f: Faker): string =
  countryCode

proc bban*(f: Faker): string =
  var r = f.rand
  for i in 0..3:
    result.add(r.sample(asciiUpperCase))
  result.add(r.formatNumbers(bbanFormat))

proc iban*(f: Faker): string =
  let bban = f.bban()
  let checkInt = 98 - (f.rand.rand(1..100) mod 97)
  let check = &"{checkInt:>02}"
  result = countryCode & check & bban
