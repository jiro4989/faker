## https://ja.wikipedia.org/wiki/ISBN

import strutils, sequtils, tables

include interfaces

let
  # concat(toSeq(0..5), toSeq(600..622), @[65, 7], toSeq(80..94), toSeq(950..989), toSeq(9920..9989), toSeq(99901..99981)),
  groups = {
    "978": @["0", "1", "2", "3", "4", "5", "600", "601", "602", "603", "604", "605", "606", "607", "608", "609", "610", "611", "612", "613", "614", "615", "616", "617", "618", "619", "620", "621", "622", "65", "7", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "950", "951", "952", "953", "954", "955", "956", "957", "958", "959", "960", "961", "962", "963", "964", "965", "966", "967", "968", "969", "970", "971", "972", "973", "974", "975", "976", "977", "978", "979", "980", "981", "982", "983", "984", "985", "986", "987", "988", "989", "9920", "9921", "9922", "9923", "9924", "9925", "9926", "9927", "9928", "9929", "9930", "9931", "9932", "9933", "9934", "9935", "9936", "9937", "9938", "9939", "9940", "9941", "9942", "9943", "9944", "9945", "9946", "9947", "9948", "9949", "9950", "9951", "9952", "9953", "9954", "9955", "9956", "9957", "9958", "9959", "9960", "9961", "9962", "9963", "9964", "9965", "9966", "9967", "9968", "9969", "9970", "9971", "9972", "9973", "9974", "9975", "9976", "9977", "9978", "9979", "9980", "9981", "9982", "9983", "9984", "9985", "9986", "9987", "9988", "9989", "99901", "99902", "99903", "99904", "99905", "99906", "99907", "99908", "99909", "99910", "99911", "99912", "99913", "99914", "99915", "99916", "99917", "99918", "99919", "99920", "99921", "99922", "99923", "99924", "99925", "99926", "99927", "99928", "99929", "99930", "99931", "99932", "99933", "99934", "99935", "99936", "99937", "99938", "99939", "99940", "99941", "99942", "99943", "99944", "99945", "99946", "99947", "99948", "99949", "99950", "99951", "99952", "99953", "99954", "99955", "99956", "99957", "99958", "99959", "99960", "99961", "99962", "99963", "99964", "99965", "99966", "99967", "99968", "99969", "99970", "99971", "99972", "99973", "99974", "99975", "99976", "99977", "99978", "99979", "99980", "99981"],
    "979": @["10", "11", "12"],
  }.toTable

proc checkDigit13(s: string): int =
  var n: int
  for i in 0..<s.len:
    let d = parseInt($s[i])
    if i mod 2 == 0:
      n += d * 1
    else:
      n += d * 3
  result = 10 - (n mod 10)
  if ($result)[^1] == '0':
    result = 0

proc checkDigit10(s: string): string =
  var n: int
  for i in 0..<s.len:
    let d = parseInt($s[i])
    n += d * (10 - i)
  result = $(11 - (n mod 11))
  if result == "10":
    result = "X"
  elif result == "11":
    result = "0"

proc isbn13*(f: Faker, separator=""): string =
  ## Returns random job.
  runnableExamples:
    let f = newFaker("en_US")
    echo f.isbn13()

  const
    fmt = "ISBN$prefix-$group-$publisher-$title-$checkDigit"
  let
    prefix = f.rand.sample(toSeq(groups.keys))
    group = f.rand.sample(groups[prefix])
    publisher = $f.rand.rand(0 ..< parseInt("1" & "0".repeat(9 - (group).len - 1)))
    title = $f.rand.rand(0 ..< parseInt("1" & "0".repeat(9 - (group).len - (publisher).len)))
    checkDigit = $checkDigit13(prefix & group & publisher & title)
  result = ["ISBN" & prefix, group, publisher, title, checkDigit].join(separator)

proc isbn10*(f: Faker, separator=""): string =
  ## Returns random job.
  runnableExamples:
    let f = newFaker("en_US")
    echo f.isbn10()

  const
    fmt = "ISBN$group-$publisher-$title-$checkDigit"

  let
    group = f.rand.sample(concat(groups["978"], groups["979"]))
    publisher = $f.rand.rand(0 ..< parseInt("1" & "0".repeat(9 - (group).len - 1)))
    title = $f.rand.rand(0 ..< parseInt("1" & "0".repeat(9 - (group).len - (publisher).len)))
    checkDigit = $checkDigit10(group & publisher & title)

  result = ["ISBN" & group, publisher, title, checkDigit].join(separator)
