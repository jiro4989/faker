import macros
from strformat import `&`
from strutils import join
import ../base, address/[en_US, ja_JP]
export base

macro genProc*(names, modules: untyped): untyped =
  ## プロシージャ定義とその依存モジュールimport式を生成する。
  var lines: seq[string]
  for name in names:
    lines.add(&"proc {name}*(f: Faker): string =")
    lines.add(&"  ## Generates random {name}.")
    lines.add(&"  runnableExamples:")
    lines.add(&"    let f = newFaker()")
    lines.add(&"    echo f.{repr(name)}()")
    lines.add(&"  case f.locale")
    for m in modules:
      lines.add(&"""  of "{repr(m)}": {repr(m)}.{repr(name)}(f)""")
    lines.add(&"  else: en_US.{repr(name)}(f)")
  parseStmt(lines.join("\n"))

genProc [
  address,
  buildingNumber,
  city,
  cityPrefix,
  citySuffix,
  country,
  #countryCode,
  militaryApo,
  militaryDpo,
  militaryShip,
  militaryState,
  postalcode,
  #postalcodeInState,
  postalcodePlus4,
  postcode,
  secondaryAddress,
  state,
  #stateAbbr,
  streetAddress,
  streetName,
  streetSuffix,
  zipcode,
  #zipcodeInState,
  zipcodePlus4,
  ],
  [en_US, ja_JP]
