# faker

Faker is a Nim package that generates fake data for you.

WIP

## Installation

```bash
nimble install https://github.com/jiro4989/faker
```

## Usage

### Library

```nim
import faker

block:
  let fake = newFaker("ja_JP")
  echo fake.address()

block:
  # default locale is `LANG` environment variables
  let fake = newFaker()
  echo fake.address()
```

### CLI

```bash
$ faker address
大阪府調布市湯宮27丁目24番12号
```

## Providers

- [ ] base
- [x] faker.providers.address
- [ ] faker.providers.automotive
- [ ] faker.providers.bank
- [ ] faker.providers.barcode
- [ ] faker.providers.color
- [ ] faker.providers.company
- [ ] faker.providers.credit_card
- [ ] faker.providers.currency
- [ ] faker.providers.date_time
- [ ] faker.providers.file
- [ ] faker.providers.geo
- [ ] faker.providers.internet
- [ ] faker.providers.isbn
- [ ] faker.providers.job
- [ ] faker.providers.lorem
- [ ] faker.providers.misc
- [ ] faker.providers.person
- [ ] faker.providers.phone_number
- [ ] faker.providers.profile
- [ ] faker.providers.python
- [ ] faker.providers.ssn
- [ ] faker.providers.user_agent
