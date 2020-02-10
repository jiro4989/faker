# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc currency*(f: Faker): (string, string)
proc currencyCode*(f: Faker): string
proc currencyName*(f: Faker): string
proc currencySymbol*(f: Faker): string
proc cryptocurrency*(f: Faker): (string, string)
proc cryptocurrencyCode*(f: Faker): string
proc cryptocurrencyName*(f: Faker): string
