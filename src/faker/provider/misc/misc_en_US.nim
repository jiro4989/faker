include interfaces

proc boolean*(f: Faker, chanceOfGettingTrue = 50): bool =
  result = f.rand.rand(100) <= chanceOfGettingTrue

proc binary*(f: Faker, length = 1048576): seq[byte] =
  result = newSeq[byte](length)
  for i in 0..<length:
    result[i] = f.rand.sample(byteSeq)

proc md5*(f: Faker): string =
  var s: string
  for b in f.binary(256):
    s.add(b.char)
  result = s.getMD5()
