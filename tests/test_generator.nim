discard """
  exitCode: 0
  output: ""
"""

import std/unittest

include ../tools/generator

const
  testDir = "tests"/"testdata"

block:
  checkpoint "readLocalesFromDir"
  block:
    checkpoint "prov1"
    const want = @["en_US", "ja_JP"]
    check want == readLocalesFromDir(testDir/"prov1")

block:
  checkpoint "parseProcName"
  block:
    checkpoint "normal"
    check "run" == "proc run*(f: Faker): string".parseProcName
  block:
    checkpoint "return type is int"
    check "run" == "proc run*(f: Faker): int".parseProcName
  block:
    checkpoint "2 args"
    check "run" == "proc run*(f: Faker, n: int): string".parseProcName

block:
  checkpoint "parseArgsDef"
  block:
    checkpoint "normal"
    check "f: Faker" == "proc run*(f: Faker): string".parseArgsDef
  block:
    checkpoint "return type is int"
    check "f: Faker" == "proc run*(f: Faker): int".parseArgsDef
  block:
    checkpoint "2 args"
    check "f: Faker, n: int" == "proc run*(f: Faker, n: int): int".parseArgsDef
  block:
    checkpoint "named args"
    check "f: Faker, n = 1" == "proc run*(f: Faker, n = 1): int".parseArgsDef
  block:
    checkpoint "named args (2)"
    check "f: Faker, n = 1 * 1024" == "proc run*(f: Faker, n = 1 * 1024): int".parseArgsDef
  block:
    checkpoint "named args (3)"
    check "f: Faker, n = 1 * 1024, m = 2" ==
        "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgsDef

block:
  checkpoint "parseArgsExample"
  block:
    checkpoint "normal"
    check "" == "proc run*(f: Faker): string".parseArgsExample
  block:
    checkpoint "return type is int"
    check "" == "proc run*(f: Faker): int".parseArgsExample
  # block:
    checkpoint "2 args"
  #   check "n" == "proc run*(f: Faker, n: int): int".parseArgsExample
  block:
    checkpoint "named args"
    check "n = 1" == "proc run*(f: Faker, n = 1): int".parseArgsExample
  block:
    checkpoint "named args (2)"
    check "n = 1 * 1024" == "proc run*(f: Faker, n = 1 * 1024): int".parseArgsExample
  block:
    checkpoint "named args (3)"
    check "n = 1 * 1024, m = 2" == "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgsExample

block:
  checkpoint "parseArgs"
  block:
    checkpoint "normal"
    check @["f"] == "proc run*(f: Faker): string".parseArgs
  block:
    checkpoint "return type is int"
    check @["f"] == "proc run*(f: Faker): int".parseArgs
  block:
    checkpoint "2 args"
    check @["f", "n"] == "proc run*(f: Faker, n: int): int".parseArgs
  block:
    checkpoint "named args"
    check @["f", "n"] == "proc run*(f: Faker, n = 1): int".parseArgs
  block:
    checkpoint "named args (2)"
    check @["f", "n"] == "proc run*(f: Faker, n = 1 * 1024): int".parseArgs
  block:
    checkpoint "named args (3)"
    check @["f", "n", "m"] == "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgs

block:
  checkpoint "parseReturnType"
  block:
    checkpoint "normal"
    check "string" == "proc run*(f: Faker): string".parseReturnType
  block:
    checkpoint "return type is int"
    check "int" == "proc run*(f: Faker): int".parseReturnType
  block:
    checkpoint "tuple"
    check "(int, string)" == "proc run*(f: Faker, n = 1 * 1024, m = 2): (int, string)".parseReturnType

block:
  checkpoint "parseProcDef"
  block:
    checkpoint "normal"
    const code = """
proc run*(f: Faker): string
proc run2(f: Faker): string
proc proc1*(f: Faker, n = 2): string
    """
    const want = @[
      ProcDef(name: "run",
              argsDef: "f: Faker",
              argsExample: "",
              args: @["f"],
              returnType: "string"),
      ProcDef(name: "proc1",
              argsDef: "f: Faker, n = 2",
              argsExample: "n = 2",
              args: @["f", "n"],
              returnType: "string"),
      ]
    check want == parseProcDef(code)

block:
  checkpoint "generateProcDef"
  block:
    checkpoint "normal"
    const d =
      ProcDef(name: "run",
              argsDef: "f: Faker, n = 1024",
              argsExample: "n = 1024",
              args: @["f", "n"],
              returnType: "string")
    const want = """proc run*(f: Faker, n = 1024): string =
  ## Generates random run.
  runnableExamples:
    let f = newFaker()
    echo f.run(n = 1024)

  case f.locale
  of "en_US": sample_en_US.run(f, n)
  of "ja_JP": sample_ja_JP.run(f, n)
  else: sample_en_US.run(f, n)"""
    check want == generateProcDef("sample", d, @["en_US", "ja_JP"])

  block:
    checkpoint "1 locale"
    const d =
      ProcDef(name: "run",
              argsDef: "f: Faker",
              argsExample: "",
              args: @["f"],
              returnType: "string")
    const want = """proc run*(f: Faker): string =
  ## Generates random run.
  runnableExamples:
    let f = newFaker()
    echo f.run()

  case f.locale
  of "en_US": sample_en_US.run(f)
  else: sample_en_US.run(f)"""
    check want == generateProcDef("sample", d, @["en_US"])
