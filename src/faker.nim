type
  Faker* = object

proc newFaker*(locale: varargs[string]): Faker =
  echo locale
  result = Faker()

proc name*(faker: Faker): string =
  discard

proc address*(faker: Faker): string =
  discard

proc text*(faker: Faker): string =
  discard
