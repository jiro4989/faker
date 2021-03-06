# ----------------------------------------------- #
# This module was generated by 'generator' tool . #
# See 'tools/generator'.                          #
# ----------------------------------------------- #

import ../base
import internet/[internet_en_US, internet_ja_JP]
export base

proc safeDomainName*(f: Faker): string =
  ## Generates random safeDomainName.
  runnableExamples:
    let f = newFaker()
    echo f.safeDomainName()

  case f.locale
  of "en_US": internet_en_US.safeDomainName(f)
  of "ja_JP": internet_ja_JP.safeDomainName(f)
  else: internet_en_US.safeDomainName(f)

proc freeDomainName*(f: Faker): string =
  ## Generates random freeDomainName.
  runnableExamples:
    let f = newFaker()
    echo f.freeDomainName()

  case f.locale
  of "en_US": internet_en_US.freeDomainName(f)
  of "ja_JP": internet_ja_JP.freeDomainName(f)
  else: internet_en_US.freeDomainName(f)

proc topLevelDomain*(f: Faker): string =
  ## Generates random topLevelDomain.
  runnableExamples:
    let f = newFaker()
    echo f.topLevelDomain()

  case f.locale
  of "en_US": internet_en_US.topLevelDomain(f)
  of "ja_JP": internet_ja_JP.topLevelDomain(f)
  else: internet_en_US.topLevelDomain(f)

proc safeEmail*(f: Faker): string =
  ## Generates random safeEmail.
  runnableExamples:
    let f = newFaker()
    echo f.safeEmail()

  case f.locale
  of "en_US": internet_en_US.safeEmail(f)
  of "ja_JP": internet_ja_JP.safeEmail(f)
  else: internet_en_US.safeEmail(f)

proc freeEmail*(f: Faker): string =
  ## Generates random freeEmail.
  runnableExamples:
    let f = newFaker()
    echo f.freeEmail()

  case f.locale
  of "en_US": internet_en_US.freeEmail(f)
  of "ja_JP": internet_ja_JP.freeEmail(f)
  else: internet_en_US.freeEmail(f)

proc email*(f: Faker): string =
  ## Generates random email.
  runnableExamples:
    let f = newFaker()
    echo f.email()

  case f.locale
  of "en_US": internet_en_US.email(f)
  of "ja_JP": internet_ja_JP.email(f)
  else: internet_en_US.email(f)
