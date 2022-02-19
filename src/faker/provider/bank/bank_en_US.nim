include interfaces

from std/strformat import `&`

const
  countryCode = "GB"
  bbanFormat = "????#############"

proc bankCountry*(f: Faker): string =
  countryCode

proc bban*(f: Faker): string =
  var r = f.rand
  result = r.formatUpperAscii(bbanFormat)
  result = r.formatNumbers(result)

proc iban*(f: Faker): string =
  let bban = f.bban()
  let checkInt = 98 - (f.rand.rand(1..100) mod 97)
  let check = &"{checkInt:>02}"
  result = countryCode & check & bban
