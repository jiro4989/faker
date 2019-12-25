# Package

version       = "0.1.0"
author        = "jiro4989"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["faker/cli/faker"]
binDir        = "bin"

from os import `/`, splitFile

# Dependencies

requires "nim >= 1.0.4"

task docs, "Generate API documents":
  exec "nimble doc --index:on --project --out:docs --hints:off src/faker.nim"

task genMod, "Generate module":
  let module = paramStr(paramCount())
  if module == "genMod":
    echo "Need 1 args"
    quit 1

  # Copy module dir
  let
    srcModule = "job"
    baseDir = "src" / "faker" / "provider"
    srcDir = baseDir / srcModule
    dstDir = baseDir / module
  rmDir dstDir
  cpDir srcDir, dstDir
  echo "Generated: " & module

  # Copy module index file
  let
    srcFile = srcDir & ".nim"
    dstFile = dstDir & ".nim"
  rmFile dstFile
  cpFile srcFile, dstFile
  echo "Generated: " & dstFile

  # Rename module name
  for path in listFiles(dstDir):
    let (dir, name, ext) = splitFile(path)
    if name == "interfaces":
      continue
    let newName = name.replace(srcModule, module)
    let newPath = dir / newName & ext
    mvFile path, newPath
    echo "Generated: " & newPath
