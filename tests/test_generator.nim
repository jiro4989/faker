import unittest

include ../tools/generator

const
  testDir = "tests"/"testdata"

suite "readLocalesFromDir":
  test "prov1":
    const want = @["en_US", "ja_JP"]
    check want == readLocalesFromDir(testDir/"prov1")

suite "parseProcName":
  test "normal":
    check "run" == "proc run*(f: Faker): string".parseProcName
  test "return type is int":
    check "run" == "proc run*(f: Faker): int".parseProcName
  test "2 args":
    check "run" == "proc run*(f: Faker, n: int): string".parseProcName

suite "parseArgsDef":
  test "normal":
    check "f: Faker" == "proc run*(f: Faker): string".parseArgsDef
  test "return type is int":
    check "f: Faker" == "proc run*(f: Faker): int".parseArgsDef
  test "2 args":
    check "f: Faker, n: int" == "proc run*(f: Faker, n: int): int".parseArgsDef
  test "named args":
    check "f: Faker, n = 1" == "proc run*(f: Faker, n = 1): int".parseArgsDef
  test "named args (2)":
    check "f: Faker, n = 1 * 1024" == "proc run*(f: Faker, n = 1 * 1024): int".parseArgsDef
  test "named args (3)":
    check "f: Faker, n = 1 * 1024, m = 2" == "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgsDef

suite "parseArgsExample":
  test "normal":
    check "" == "proc run*(f: Faker): string".parseArgsExample
  test "return type is int":
    check "" == "proc run*(f: Faker): int".parseArgsExample
  # test "2 args":
  #   check "n" == "proc run*(f: Faker, n: int): int".parseArgsExample
  test "named args":
    check "n = 1" == "proc run*(f: Faker, n = 1): int".parseArgsExample
  test "named args (2)":
    check "n = 1 * 1024" == "proc run*(f: Faker, n = 1 * 1024): int".parseArgsExample
  test "named args (3)":
    check "n = 1 * 1024, m = 2" == "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgsExample

suite "parseArgs":
  test "normal":
    check @["f"] == "proc run*(f: Faker): string".parseArgs
  test "return type is int":
    check @["f"] == "proc run*(f: Faker): int".parseArgs
  test "2 args":
    check @["f", "n"] == "proc run*(f: Faker, n: int): int".parseArgs
  test "named args":
    check @["f", "n"] == "proc run*(f: Faker, n = 1): int".parseArgs
  test "named args (2)":
    check @["f", "n"] == "proc run*(f: Faker, n = 1 * 1024): int".parseArgs
  test "named args (3)":
    check @["f", "n", "m"] == "proc run*(f: Faker, n = 1 * 1024, m = 2): int".parseArgs

suite "parseReturnType":
  test "normal":
    check "string" == "proc run*(f: Faker): string".parseReturnType
  test "return type is int":
    check "int" == "proc run*(f: Faker): int".parseReturnType
  test "tuple":
    check "(int, string)" == "proc run*(f: Faker, n = 1 * 1024, m = 2): (int, string)".parseReturnType

suite "parseProcDef":
  test "normal":
    const code = """
proc run*(f: Faker): string
proc run2(f: Faker): string
proc proc1*(f: Faker, n = 2): string
    """
    const want = @[
      ProcDef(name: "run",
              argsExample: "",
              args: @["f"],
              returnType: "string"),
      ProcDef(name: "proc1",
              argsExample: "n = 2",
              args: @["f", "n"],
              returnType: "string"),
      ]
    check want == parseProcDef(code)

suite "generateProcDef":
  test "normal":
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

  test "1 locale":
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
