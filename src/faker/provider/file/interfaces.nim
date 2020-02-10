# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random
import ../../base
export base

proc fileExtension*(f: Faker, category=""): string
proc fileName*(f: Faker, category="", extension=""): string
proc filePath*(f: Faker, depth=1, category="", extension=""): string
proc mimeType*(f: Faker, category=""): string
proc unixDevice*(f: Faker, prefix=""): string
proc unixPartition*(f: Faker, prefix=""): string
