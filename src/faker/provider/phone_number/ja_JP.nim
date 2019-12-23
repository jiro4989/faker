## ja_JP は日本語用のランダム電話番号生成モジュールです。
##
## 使用例
## ------
##

import ../util
include interfaces

const
  formats = @[
    "070-####-####",
    "080-####-####",
    "090-####-####",
    "##-####-####",
  ]
  msisdnFormats = @[
    "#############",
  ]

proc phoneNumber*(f: Faker): string =
  ## ランダムに電話番号を返す。
  runnableExamples:
    let f = newFaker("ja_JP")
    echo f.phoneNumber()

  f.formatNumbers(formats)

proc msisdn*(f: Faker): string =
  ## ランダムにMSISDNを返す。
  runnableExamples:
    let f = newFaker("ja_JP")
    echo f.msisdn()

  f.formatNumbers(msisdnFormats)
