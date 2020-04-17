include interfaces

proc boolean*(f: Faker, chanceOfGettingTrue = 50): bool =
  f.rand.rand(100) <= chanceOfGettingTrue
