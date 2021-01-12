include interfaces
import strutils
import ../person

proc safeEmail*(f: Faker): string =
  f.firstName.toLower & "@" & f.safeDomainName

proc freeEmail*(f: Faker): string =
  f.firstName.toLower & "@" & f.freeDomainName

proc email*(f: Faker): string =
  let domain =
    if rand(1) == 0:
      f.freeDomainName
    else:
      f.safeDomainName
  f.firstName.toLower & "@" & domain
