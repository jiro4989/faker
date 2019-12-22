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
- [x] faker.provider.address
- [ ] faker.provider.automotive
- [ ] faker.provider.bank
- [ ] faker.provider.barcode
- [ ] faker.provider.color
- [ ] faker.provider.company
- [ ] faker.provider.credit_card
- [ ] faker.provider.currency
- [ ] faker.provider.date_time
- [ ] faker.provider.file
- [ ] faker.provider.geo
- [ ] faker.provider.internet
- [ ] faker.provider.isbn
- [ ] faker.provider.job
- [ ] faker.provider.lorem
- [ ] faker.provider.misc
- [ ] faker.provider.person
- [ ] faker.provider.phone_number
- [ ] faker.provider.profile
- [ ] faker.provider.python
- [ ] faker.provider.ssn
- [ ] faker.provider.user_agent
