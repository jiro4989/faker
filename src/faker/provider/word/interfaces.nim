# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc word*(f: Faker): string
