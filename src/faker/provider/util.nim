import macros, random
from strformat import `&`
from strutils import join, align
from math import `^`

macro genProc*(names, modules: untyped): untyped =
  ## プロシージャ定義を生成する。 `names` がプロシージャ名、 `modules` はプロシ
  ## ージャの属するモジュール名を表す。
  ##
  ## このマクロを次のように呼び出す。
  ##
  ## `genProc [address], [en_US, ja_JP]`
  ##
  ## このコードから、以下のプロシージャ定義を生成する。
  ##
  ## .. code-block:: Nim
  ##    proc address*(f: Faker): string =
  ##      ## Generates random address.
  ##      runnableExamples:
  ##        let f = newFaker()
  ##        echo f.address()
  ##      case f.locale
  ##      of "en_US": en_US.address()
  ##      of "ja_JP": ja_JP.address()
  ##      else: en_US.address()
  ##
  ## 第一引数を増やせば、増やした分だけ同様の構造のプロシージャ定義を生成する。
  ##
  ## 前提として、en_US, ja_JPモジュールのどちらにも、 `address` プロシージャが実
  ## 装されていないと、当然このマクロ実行時に失敗する点に留意する。
  var lines: seq[string]
  for name in names:
    lines.add(&"proc {name}*(f: Faker): string =")
    lines.add(&"  ## Generates random {name}.")
    lines.add(&"  runnableExamples:")
    lines.add(&"    let f = newFaker()")
    lines.add(&"    echo f.{repr(name)}()")
    lines.add(&"  case f.locale")
    for m in modules:
      lines.add(&"""  of "{repr(m)}": {repr(m)}.{repr(name)}(f)""")
    lines.add(&"  else: en_US.{repr(name)}(f)")
  parseStmt(lines.join("\n"))

proc formatNumbers*(r: var Rand, format: string): string =
  proc alignFmt(r: var Rand, buf: string): string =
    let max = 10 ^ buf.len - 1
    let num = $r.rand(1..max)
    result = num.align(buf.len, '0')

  var buf: string
  for s in format:
    if s == '#':
      buf.add(s)
      continue
    if 0 < buf.len:
      result.add(alignFmt(r, buf))
      buf = ""
    result.add(s)
  if 0 < buf.len:
    result.add(alignFmt(r, buf))
