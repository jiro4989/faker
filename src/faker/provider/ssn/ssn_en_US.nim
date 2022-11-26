include interfaces

proc areaNumber(f: Faker): string =
  var aNum = f.rand.rand(1..899)
  if aNum == 666:
    (if f.rand.rand(0..1) == 1: inc(aNum) else: dec(aNum))
  return fmt"{aNum:>03}"

proc groupNumber(f: Faker): string =
  var gNum = f.rand.rand(1..99)
  return fmt"{gNum:>02}"


proc serialNumber(f: Faker): string =
  let sNum = f.rand.rand(0..9999)
  return fmt"{sNum:>04}"

proc ssn*(f: Faker): string =
  return [ $areaNumber(f), $groupNumber(f), $serialNumber(f) ].join("-")

