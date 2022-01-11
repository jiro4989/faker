include interfaces
import strutils
import ../person/person_fa_IR

proc pickFinglish(f: Faker): string =
  f.rand.sample(finglish) & f.rand.sample(finglish) & (
    if rand(1..5) < 5: $rand(1..9999)
    else: ""
  )

proc safeEmail*(f: Faker): string =
  f.pickFinglish.toLower & "@" & f.safeDomainName

proc freeEmail*(f: Faker): string =
  f.pickFinglish & "@" & f.freeDomainName

proc email*(f: Faker): string =
  let domain =
    if rand(1) == 0: f.freeDomainName
    else: f.safeDomainName
  
  f.pickFinglish & "@" & domain
