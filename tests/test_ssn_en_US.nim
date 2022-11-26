import std/unittest
import faker
import std/strscans
import strutils

test "SSN":
  block:
      checkpoint "it generates a valid ssn"
      let fake = newFaker()
      let ssn = fake.ssn()
      let ssnArr = ssn.split("-")

      let aNum = ssnArr[0]
      let gNum = ssnArr[1]
      let sNum = ssnArr[2]

      check len(aNum) == 3
      check len(gNum) == 2
      check len(sNum) == 4
      check len(ssn) == 11