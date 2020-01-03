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

proc chrome*(f: Faker): string = discard
proc firefox*(f: Faker): string = discard
proc opera*(f: Faker): string = discard
proc safari*(f: Faker): string = discard
proc internetExplorer*(f: Faker): string = discard

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
