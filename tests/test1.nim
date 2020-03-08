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
        echo fake.userAgent()
        echo fake.chrome()
        echo fake.firefox()
        echo fake.opera()
        echo fake.safari()
        echo fake.internetExplorer()
        echo fake.bankCountry()
        echo fake.bban()
        echo fake.iban()
        echo fake.licensePlate()
        echo fake.fileExtension
        echo fake.fileName()
        echo fake.filePath()
        echo fake.mimeType()
        echo fake.unixDevice()
        echo fake.unixPartition()
        echo fake.isbn13()
        echo fake.isbn10()
        echo fake.isbn13("-")
        echo fake.isbn10("-")
        echo "-----"
