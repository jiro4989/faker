include interfaces

proc areaNumber(f: Faker): int =
  var areaNumber = f.rand.rand(001..899)
  if areaNumber == 666:
    (if f.rand.rand(0..1) == 1: inc(areaNumber) else: dec(areaNumber))
  return areaNumber

proc groupNumber(f: Faker): int =
  return f.rand.rand(01..99)

proc serialNumber(f: Faker): int =
  return f.rand.rand(0000..9999)

proc ssn*(f: Faker): string =
  return [ $areaNumber(f), $groupNumber(f), $serialNumber(f) ].join("-")

