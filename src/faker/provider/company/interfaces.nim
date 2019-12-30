# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random, strutils
import ../../base
export base

proc bs*(f: Faker): string
proc catchPhrase*(f: Faker): string
proc company*(f: Faker): string
proc companySuffix*(f: Faker): string
