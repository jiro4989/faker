# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import random, macros, strutils
from strformat import `&`
import ../../base
export base

proc firstName*(f: Faker): string
proc firstNameFemale*(f: Faker): string
proc firstNameMale*(f: Faker): string
proc lastName*(f: Faker): string
proc lastNameFemale*(f: Faker): string
proc lastNameMale*(f: Faker): string
proc name*(f: Faker): string
proc nameFemale*(f: Faker): string
proc nameMale*(f: Faker): string
proc prefix*(f: Faker): string
proc prefixFemale*(f: Faker): string
proc prefixMale*(f: Faker): string
proc suffix*(f: Faker): string
proc suffixFemale*(f: Faker): string
proc suffixMale*(f: Faker): string

macro genSampleProc(locale, items: untyped): untyped =
  var lines: seq[string]
  for item in items:
    let
      procName = item[0]
      format = item[1]
      documentComment = item[2]
    lines.add(&"proc {procName}*(f: Faker): string =")
    lines.add(&"  ## {documentComment}")
    lines.add(&"  runnableExamples:")
    lines.add(&"    let f = newFaker(\"{locale}\")")
    lines.add(&"    echo f.{procName}()")
    lines.add(&"  f.rand.sample({format})")
  parseStmt(lines.join("\n"))

macro genSampleFormatProc(locale, items: untyped): untyped =
  var lines: seq[string]
  for item in items:
    let
      procName = item[0]
      format = item[1]
      documentComment = item[2]
    lines.add(&"proc {procName}*(f: Faker): string =")
    lines.add(&"  ## {documentComment}")
    lines.add(&"  runnableExamples:")
    lines.add(&"    let f = newFaker(\"{locale}\")")
    lines.add(&"    echo f.{procName}()")
    lines.add(&"  f.format(f.rand.sample({format}))")
  parseStmt(lines.join("\n"))
