## راهنمای استفاده 
##

import ../util
include interfaces

const
  formats = @[
    # standard
    "09#########",
    "+989#########",
  ]
  msisdnFormats = @[
    "#############",
  ]

proc phoneNumber*(f: Faker): string =
  ## شماره موبایل ساده
  runnableExamples:
    let f = newFaker("fa_IR")
    echo f.phoneNumber()

  f.formatNumbers(formats)

proc msisdn*(f: Faker): string =
  ## ランダムにMSISDNを返す。
  runnableExamples:
    let f = newFaker("fa_IR")
    echo f.msisdn()

  f.formatNumbers(msisdnFormats)
