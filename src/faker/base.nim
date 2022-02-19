import std/os
import std/random
import std/strutils
import std/times

export random

type
  Faker* = ref object
    locale*: string
    rand*: Rand

proc newFaker*(locale = "", seed = 0): Faker =
  new result
  # seed値で乱数を初期化。seedが0以下なら現在時刻をseed値とする
  result.rand =
    if 0 < seed: initRand(seed)
    else: 
      let now = times.getTime()
      initRand(convert(Seconds, Nanoseconds, now.toUnix) + now.nanosecond)
  # 言語をセット
  if locale != "":
    result.locale = locale
  else:
    result.locale = getEnv("LANG", "en_US.UTF-8").split(".")[0]
    if result.locale == "":
      result.locale = "en_US"

