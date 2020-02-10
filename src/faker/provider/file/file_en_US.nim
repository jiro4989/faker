include interfaces

proc fileExtension*(f: Faker, category=""): string = discard
proc fileName*(f: Faker, category="", extension=""): string = discard
proc filePath*(f: Faker, depth=1, category="", extension=""): string = discard
proc mimeType*(f: Faker, category=""): string = discard
proc unixDevice*(f: Faker, prefix=""): string = discard
proc unixPartition*(f: Faker, prefix=""): string = discard
