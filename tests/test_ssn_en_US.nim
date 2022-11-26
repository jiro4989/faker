import std/unittest
import faker
import strscans

test "SSN":
  block:
      checkpoint "it generates a valid ssn"
      let fake = newFaker()
      let ssn = fake.ssn()
      let (success, aNum, gNum, sNum) = scanTuple(ssn, "$i-$i-$i")
      assert len($aNum) == 3
      assert len($gNum) == 2
      assert len($sNum) == 4