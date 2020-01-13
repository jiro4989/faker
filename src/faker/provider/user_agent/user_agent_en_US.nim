include interfaces

const
  userAgents = @[
      "chrome", "firefox", "internet_explorer", "opera", "safari",
  ]

  windowsPlatformTokens = @[
      "Windows 95", "Windows 98", "Windows 98; Win 9x 4.90", "Windows CE",
      "Windows NT 4.0", "Windows NT 5.0", "Windows NT 5.01",
      "Windows NT 5.1", "Windows NT 5.2", "Windows NT 6.0", "Windows NT 6.1",
      "Windows NT 6.2",
  ]

  linuxProcessors = @["i686", "x86_64"]

  macProcessors = @["Intel", "PPC", "U; Intel", "U; PPC"]

  androidVersions = @[
      "1.0", "1.1", "1.5", "1.6", "2.0", "2.0.1", "2.1", "2.2", "2.2.1", "2.2.2", "2.2.3", "2.3", "2.3.1", "2.3.2",
      "2.3.3", "2.3.4", "2.3.5", "2.3.6", "2.3.7", "3.0", "3.1", "3.2", "3.2.1", "3.2.2", "3.2.3", "3.2.4", "3.2.5",
      "3.2.6", "4.0", "4.0.1", "4.0.2", "4.0.3", "4.0.4", "4.1", "4.1.1", "4.1.2", "4.2", "4.2.1", "4.2.2", "4.3",
      "4.3.1", "4.4", "4.4.1", "4.4.2", "4.4.3", "4.4.4", "5.0", "5.0.1", "5.0.2", "5.1", "5.1.1", "6.0", "6.0.1",
      "7.0", "7.1", "7.1.1", "7.1.2", "8.0.0", "8.1.0", "9",
  ]

  appleDevices = @["iPhone", "iPad"]

  iosVersions = @[
      "3.1.3", "4.2.1", "5.1.1", "6.1.6", "7.1.2", "9.3.5", "9.3.6", "10.3.3", "10.3.4", "12.4",
  ]

# === User agent ===

proc userAgent*(f: Faker): string =
  f.rand.sample(userAgents)

# === Browser ===

proc chrome*(f: Faker): string =
  const
    versionFrom = 13
    versionTo = 63
    buildFrom = 800
    buildTo = 899
  let
    saf = "$1.$2" % [$f.rand.rand(531..536), $f.rand.rand(0..2)]
    bld = f.rand.formatNumbers("##?###")
    tmplt = "($1) AppleWebKit/$2 (KHTML, like Gecko) Chrome/$3.0.$4.0 Safari/$5"
    tmpltIos = "($1) AppleWebKit/$2 (KHTML, like Gecko) CriOS/$3.0.$4.0 Mobile/$5 Safari/$2"
  proc platform(fmt, token, saf: string): string =
    fmt % [token, saf, $f.rand.rand(versionFrom..versionTo), $f.rand.rand(buildFrom..buildTo), saf]
  let
    platforms = [
      platform(tmplt, f.linuxPlatformToken, saf),
      platform(tmplt, f.windowsPlatformToken, saf),
      platform(tmplt, f.macPlatformToken, saf),
      platform(tmplt, "Linux; " & f.androidPlatformToken, saf),
      platform(tmpltIos, f.iosPlatformToken, bld),
    ]
  result = "Mozilla/5.0 " & f.rand.sample(platforms)

proc firefox*(f: Faker): string =
  let
    #ver = "" # TODO
    tmpltWin = "($1; $2; rv:1.9.$3.20) $4"
    tmpltLin = "($1; rv:1.9.$2.20) $3"
    tmpltMac = tmpltLin
    tmpltAnd = "($1; Mobile; rv:$2.0) Gecko/$2.0 Firefox/$2.0"
    tmpltIos = "($1) AppleWebKit/$2 (KHTML, like Gecko) FxiOS/$3.$4.0 Mobile/$5 Safari/$2"
    saf = "$1.$2" % [ $f.rand.rand(531..536), $f.rand.rand(0..2) ]
    bld = f.rand.formatNumbers("##?###")
    bld2 = f.rand.formatNumbers("#?####")
    platforms = [
      # tmpltWin % [f.windowsPlatformToken, f.locale.replace("_", "-"), $f.rand.rand(0..2), ver],
      # tmpltLin % [f.linuxPlatformToken, $f.rand.rand(5..7), ver],
      # tmpltMac % [f.macPlatformToken, $f.rand.rand(2..6), ver],
      tmpltAnd % [f.androidPlatformToken, $f.rand.rand(5..68)],
      tmpltIos % [f.iosPlatformToken, saf, $f.rand.rand(9..18), bld2, bld],
    ]
  result = "Mozilla/5.0 " & f.rand.sample(platforms)

proc opera*(f: Faker): string =
  let platform = "($1; $2) Presto/2.9.$3 Version/$4.00" % [
    f.linuxPlatformToken,
    f.locale.replace("_", "-"),
    $f.rand.rand(160..190),
    $f.rand.rand(10..12),
  ]
  result = "Opera/$1.$2.$3" % [
    $f.rand.rand(8..9),
    $f.rand.rand(10..99),
    platform,
  ]

proc safari*(f: Faker): string =
  let
    saf = "$1.$2.$3" % [$f.rand.rand(531..535), $f.rand.rand(1..50), $f.rand.rand(1..7)]
    ver = "$1.$2" % [$f.rand.rand(4..5), $f.rand.rand(0..1)]
    tmpltWin = "(Windows; U; $1) AppleWebKit/$2 (KHTML, like Gecko) Version/$3 Safari/$4"
    tmpltMac = "($1 rv:$2.0; $3) AppleWebKit/$4 (KHTML, like Gecko) Version/$5 Safari/$6"
    tmpltIpod = "(iPod; U; CPU iPhone OS $1_$2 like Mac OS X; $3) AppleWebKit/$4 (KHTML, like Gecko) Version/$5.0.5 Mobile/8B$6 Safari/6$7"
    locale = f.locale.replace("_", "-")
    platforms = [
      tmpltWin % [f.windowsPlatformToken, saf, ver, saf],
      tmpltMac % [f.macPlatformToken, $f.rand.rand(2..6), locale, saf, ver, saf],
      tmpltIpod % [$f.rand.rand(3..4), $f.rand.rand(0..3), locale, saf, $f.rand.rand(3..4), $f.rand.rand(111..119), saf],
    ]
  result = "Mozilla/5.0 " & f.rand.sample(platforms)

proc internetExplorer*(f: Faker): string =
  let tmplt = "Mozilla/5.0 (compatible; MSIE $1.0; $2; Trident/$3.$4)"
  result = tmplt % [
    $f.rand.rand(5..9),
    f.windowsPlatformToken,
    $f.rand.rand(3..5),
    $f.rand.rand(0..1)
  ]

# === Platform token ===

proc linuxPlatformToken*(f: Faker): string =
  let fmt = "X11; Linux $processor"
  fmt % @["processor", f.rand.sample(linuxProcessors)]

proc macPlatformToken*(f: Faker): string =
  let processor = f.rand.sample(macProcessors)
  result.add("Macintosh; ")
  result.add(processor)
  result.add(" Mac OS X 10_")
  result.add($f.rand.rand(5..12))
  result.add($f.rand.rand(0..9))

proc androidPlatformToken*(f: Faker): string =
  "Android " & f.rand.sample(androidVersions)

proc iosPlatformToken*(f: Faker): string =
  let fmt = "$device; CPU $device OS $version like Mac OS X"
  fmt % @[
    "device", f.rand.sample(appleDevices),
    "version", f.rand.sample(iosVersions).replace(".", "_")
  ]

proc windowsPlatformToken*(f: Faker): string =
  f.rand.sample(windowsPlatformTokens)

# === Processor ===

proc linuxProcessor*(f: Faker): string =
  f.rand.sample(linuxProcessors)

proc macProcessor*(f: Faker): string =
  f.rand.sample(macProcessors)
