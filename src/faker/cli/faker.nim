import os

import ../../faker

proc main(args: seq[string]): int =
  if args.len < 1:
    stderr.writeLine "Need args"
    return 1

  let subcmd = args[0]
  let fake = newFaker()
  case subcmd
  of "address":
    echo fake.address()
  else:
    discard

when isMainModule:
  let args = commandLineParams()
  quit main(args)
