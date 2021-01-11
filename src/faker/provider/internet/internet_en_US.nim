include interfaces
import strutils
import ../person

const
  safeDomainNames = @["example.org", "example.com", "example.net"]
  freeDomainNames = @["gmail.com", "yahoo.co.jp", "hotmail.com"]
  topLevelDomains = @["com", "biz", "info", "net", "org"]

proc safeDomainName*(f: Faker): string =
  f.rand.sample(safeDomainNames)

proc freeDomainName*(f: Faker): string =
  f.rand.sample(freeDomainNames)

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

proc topLevelDomain*(f: Faker): string =
  f.rand.sample(topLevelDomains)
