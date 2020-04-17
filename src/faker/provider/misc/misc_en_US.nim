include interfaces

proc boolean*(f: Faker, chanceOfGettingTrue = 50): bool =
  f.rand.rand(100) <= chanceOfGettingTrue

proc binary*(f: Faker, length = 1048576): seq[byte] =
  result = newSeq[byte](length)
  for i in 0..<length:
    result[i] = f.rand.sample(byteSeq)
