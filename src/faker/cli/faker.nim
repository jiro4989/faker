import os

import ../../faker

proc main(args: seq[string]): int =
  if args.len < 1:
    stderr.writeLine "Need args"
    return 1

  let subcmd = args[0]
  let fake = newFaker()
  case subcmd
  of "address": echo fake.address()
  of "phoneNumber": echo fake.phoneNumber()
  of "phone_number": echo fake.phoneNumber()
  of "job": echo fake.job()
  else:
    discard

when isMainModule:
  let args = commandLineParams()
  quit main(args)
