include interfaces
import strutils
import ../person/person_ja_JP

proc safeEmail*(f: Faker): string =
  f.firstRomanizedName.toLower & "@" & f.safeDomainName

proc freeEmail*(f: Faker): string =
  f.firstRomanizedName.toLower & "@" & f.freeDomainName

proc email*(f: Faker): string =
  let domain =
    if rand(1) == 0:
      f.freeDomainName
    else:
      f.safeDomainName
  f.firstRomanizedName.toLower & "@" & domain
