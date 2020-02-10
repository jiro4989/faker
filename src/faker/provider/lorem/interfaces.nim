# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc word*(f: Faker): string
# proc words*(f: Faker): string
# proc sentence*(f: Faker): string
# proc sentences*(f: Faker): string
# proc paragraph*(f: Faker): string
# proc paragraphs*(f: Faker): string
# proc text*(f: Faker): string
# proc texts*(f: Faker): string
