# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc safeDomainName*(f: Faker): string
proc freeDomainName*(f: Faker): string
proc safeEmail*(f: Faker): string
proc freeEmail*(f: Faker): string
proc email*(f: Faker): string
proc topLevelDomain*(f: Faker): string

const
  safeDomainNames = @["example.org", "example.com", "example.net"]
  freeDomainNames = @["gmail.com", "yahoo.co.jp", "hotmail.com"]
  topLevelDomains = @["com", "biz", "info", "net", "org"]

proc safeDomainName*(f: Faker): string =
  f.rand.sample(safeDomainNames)

proc freeDomainName*(f: Faker): string =
  f.rand.sample(freeDomainNames)

proc topLevelDomain*(f: Faker): string =
  f.rand.sample(topLevelDomains)
