# ----------------------------------------------- #
# This module was generated by 'generator' tool . #
# See 'tools/generator'.                          #
# ----------------------------------------------- #

import ../base
import lorem/lorem_en_US
import lorem/lorem_fa_IR
import lorem/lorem_ja_JP
export base

proc word*(f: Faker): string =
  ## Generates random word.
  runnableExamples:
    let f = newFaker()
    echo f.word()

  case f.locale
  of "en_US": lorem_en_US.word(f)
  of "fa_IR": lorem_fa_IR.word(f)
  of "ja_JP": lorem_ja_JP.word(f)
  else: lorem_en_US.word(f)
