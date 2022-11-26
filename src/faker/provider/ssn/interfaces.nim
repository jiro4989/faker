# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import std/strutils
import ../../base
export base

proc ssn*(f: Faker): string
proc areaNumber(f: Faker): int
proc groupNumber(f: Faker): int
proc serialNumber(f: Faker): int
