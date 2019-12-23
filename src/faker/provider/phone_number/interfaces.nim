# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base, ../util
export base

proc phoneNumber*(f: Faker): string
proc msisdn*(f: Faker): string

proc formatNumbers(f: Faker, formats: openArray[string]): string =
  var r = f.rand
  let format = f.rand.sample(formats)
  r.formatNumbers(format)
