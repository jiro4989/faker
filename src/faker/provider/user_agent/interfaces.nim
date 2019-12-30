# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random, strutils
import ../../base
export base

# === User agent ===

proc userAgent*(f: Faker): string

# === Browser ===

proc chrome*(f: Faker): string
#proc chrome*(version_from=13, version_to=63, build_from=800, build_to=899)
proc firefox*(f: Faker): string
proc opera*(f: Faker): string
proc safari*(f: Faker): string
proc internetExplorer*(f: Faker): string

# === Platform token ===

proc linuxPlatformToken*(f: Faker): string
proc macPlatformToken*(f: Faker): string
proc androidPlatformToken*(f: Faker): string
proc iosPlatformToken*(f: Faker): string
proc windowsPlatformToken*(f: Faker): string

# === Processor ===

proc linuxProcessor*(f: Faker): string
proc macProcessor*(f: Faker): string
