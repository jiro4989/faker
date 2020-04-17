# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc coordinate*(f: Faker): string
proc latitude*(f: Faker): string
proc latlng*(f: Faker): string
proc localLatlng*(f: Faker): string
proc locationOnLand*(f: Faker): string
proc longitude*(f: Faker): string
