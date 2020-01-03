#####
faker
#####

|gh-actions| |nimble-install| |nimble-docs|

faker is a Nim package that generates fake data for you.
faker is heavily inspired by `Python Faker <https://github.com/joke2k/faker>`_.

**WIP**

.. contents:: Table of contents
   :depth: 3

************
Installation
************

.. code-block:: Bash

   nimble install faker

*****
Usage
*****

-------
Library
-------

.. code-block:: Nim

   import faker

   block:
     let fake = newFaker("ja_JP")
     echo fake.address()
     # -> 茨城県港区東三島31丁目3番16号

     echo fake.name()
     # -> 若松 香織

   block:
     # default locale is `LANG` environment variables

     let fake = newFaker()
     echo fake.address()
     # -> 94622 Cesar Camp Apt. 13 South Caitlyn, HI 35128

     echo fake.name()
     # -> Bruce Wagner DDS

----
CLI
----

.. code-block:: Bash

   $ faker address
   大阪府調布市湯宮27丁目24番12号

   # Set locale and run
   $ LANG=en_US.UTF-8 faker name
   Mr. Leonard Johns

****************
Supported locale
****************

I understand only English and Japanese.


======  ===========
Locale  Description
======  ===========
en_US   English
ja_JP   Japanese
======  ===========

*********
Providers
*********

TODO list.

- [ ] base
- [X] faker.provider.address
- [ ] faker.provider.automotive
- [ ] faker.provider.bank
- [ ] faker.provider.barcode
- [ ] faker.provider.color
- [X] faker.provider.company
- [ ] faker.provider.credit_card
- [ ] faker.provider.currency
- [ ] faker.provider.date_time
- [ ] faker.provider.file
- [ ] faker.provider.geo
- [ ] faker.provider.internet
- [ ] faker.provider.isbn
- [X] faker.provider.job
- [ ] faker.provider.lorem
- [ ] faker.provider.misc
- [X] faker.provider.person
- [X] faker.provider.phone_number
- [ ] faker.provider.profile
- [ ] faker.provider.python
- [ ] faker.provider.ssn
- [X] faker.provider.user_agent

************
API document
************

* https://jiro4989.github.io/faker/faker.html

***********
Development
***********

-----------------
Adding new module
-----------------

You can generate a new module with `nimble genMod` task.
Run below.

.. code-block:: Bash

   $ nimble genMod new_module

Please see other module implements, and edit a generated module.

--------------------
Update provider code
--------------------

You can update `src/faker/provider/*.nim` codes with `nimble genProvs` task.
Run below if you had edited a new module.

.. code-block:: Bash

   $ nimble genProvs

See `src/faker/provider/*.nim`.
A new provider will be generated.

.. code-block: Bash

   $ ls -1 src/faker/provider/*.nim
   src/faker/provider/address.nim
   src/faker/provider/job.nim
   src/faker/provider/person.nim
   src/faker/provider/phone_number.nim
   src/faker/provider/new_module.nim # <--- New provider.
   src/faker/provider/util.nim

************
Pull request
************

Welcome :heart:

*******
LICENSE
*******

MIT

.. |gh-actions| image:: https://github.com/jiro4989/faker/workflows/build/badge.svg
   :target: https://github.com/jiro4989/faker/actions
.. |nimble-install| image:: https://nimble.directory/ci/badges/faker/nimdevel/status.svg
   :target: https://nimble.directory/ci/badges/faker/nimdevel/output.html
.. |nimble-docs| image:: https://nimble.directory/ci/badges/faker/nimdevel/docstatus.svg
   :target: https://nimble.directory/ci/badges/faker/nimdevel/doc_build_output.html