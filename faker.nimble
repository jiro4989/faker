# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["faker/cli/faker"]
binDir        = "bin"



# Dependencies

requires "nim >= 1.0.4"

task docs, "Generate API documents":
  exec "nimble doc --index:on --project --out:docs --hints:off src/faker.nim"
