import random
export random

type
  Faker* = ref object
    locale*: string
    rand*: Rand
