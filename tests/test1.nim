import unittest

import faker

suite "basic usage":
  test "generate random value":
    let fake = newFaker()
    echo fake.address()
  test "generate random values by loop":
    let fake = newFaker()
    for i in 1..10:
      echo fake.address()
  # test "case adding provider":
  #   var fake = newFaker()
  #   fake.addProvider(address)
  #   echo fake.address()
  test "localization":
    let fake = newFaker("en_US")
    echo fake.address()