import unittest

import faker

suite "basic usage":
  test "generate random values":
    let fake = newFaker()
    echo fake.address()
    echo fake.phoneNumber()
    echo fake.job()
  test "generate random values by loop":
    let locales = ["en_US", "ja_JP"]
    for locale in locales:
      let fake = newFaker(locale)
      for i in 1..10:
        echo fake.address()
        echo fake.phoneNumber()
        echo fake.job()
        echo fake.name()
        echo fake.company()
        echo "-----"
