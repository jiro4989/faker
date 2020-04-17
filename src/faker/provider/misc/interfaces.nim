# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random, sequtils
import ../../base
export base

let
  byteSeq = toSeq(0..255).mapIt(it.byte)

proc boolean*(f: Faker, chanceOfGettingTrue=50): bool

# 1048576 == 1 * 1024 * 1024
proc binary*(f: Faker, length = 1048576): seq[byte]
