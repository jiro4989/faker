# ----------------------------------------------- #
# This module was generated by 'generator' tool . #
# See 'tools/generator'.                          #
# ----------------------------------------------- #

import ../base
import phone_number/[phone_number_en_US, phone_number_ja_JP, phone_number_fa_IR]
export base

proc phoneNumber*(f: Faker): string =
  ## Generates random phoneNumber.
  runnableExamples:
    let f = newFaker()
    echo f.phoneNumber()

  case f.locale
  of "en_US": phone_number_en_US.phoneNumber(f)
  of "ja_JP": phone_number_ja_JP.phoneNumber(f)
  of "fa_IR": phone_number_fa_IR.phoneNumber(f)
  else: phone_number_en_US.phoneNumber(f)

proc msisdn*(f: Faker): string =
  ## Generates random msisdn.
  runnableExamples:
    let f = newFaker()
    echo f.msisdn()

  case f.locale
  of "en_US": phone_number_en_US.msisdn(f)
  of "ja_JP": phone_number_ja_JP.msisdn(f)
  of "fa_IR": phone_number_fa_IR.msisdn(f)
  else: phone_number_en_US.msisdn(f)
