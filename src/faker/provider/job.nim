# ----------------------------------------------- #
# This module was generated by 'generator' tool . #
# See 'tools/generator'.                          #
# ----------------------------------------------- #

import ../base
import job/job_en_US
import job/job_fa_IR
import job/job_ja_JP
export base

proc job*(f: Faker): string =
  ## Generates random job.
  runnableExamples:
    let f = newFaker()
    echo f.job()

  case f.locale
  of "en_US": job_en_US.job(f)
  of "fa_IR": job_fa_IR.job(f)
  of "ja_JP": job_ja_JP.job(f)
  else: job_en_US.job(f)
