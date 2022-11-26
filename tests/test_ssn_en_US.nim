import std/unittest
import faker
import strscans

test "SSN":
  block:
      checkpoint "it generates a valid ssn"
      let fake = newFaker()
      let ssn = fake.ssn()
      let (success, aNum, gNum, sNum) = scanTuple(ssn, "$i-$i-$i")
      check len($aNum) == 3
      check len($gNum) == 2
      check len($sNum) == 4
      check len(ssn) == 11