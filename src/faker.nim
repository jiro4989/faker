## faker is a Nim package that generates fake data for you.
##
## Usage
## -----
##
runnableExamples:
  import faker

  let fake = newFaker()
  echo fake.address()

import faker/[base, provider]
export base, provider
