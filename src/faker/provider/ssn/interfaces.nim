# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import std/strutils
import strformat
import ../../base
export base

proc ssn*(f: Faker): string
proc areaNumber(f: Faker): string
proc groupNumber(f: Faker): string
proc serialNumber(f: Faker): string
