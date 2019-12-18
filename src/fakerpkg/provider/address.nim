import ../base, address/[en_US, ja_JP]

proc address*(f: Faker): string =
  debugEcho f[]
  case f.locale
  of "en_US": en_US.address(f)
  of "ja_JP": ja_JP.address(f)
  else: en_US.address(f)
