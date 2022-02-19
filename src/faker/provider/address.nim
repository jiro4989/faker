# ----------------------------------------------- #
# This module was generated by 'generator' tool . #
# See 'tools/generator'.                          #
# ----------------------------------------------- #

import ../base
import address/address_en_US
import address/address_fa_IR
import address/address_ja_JP
export base

proc address*(f: Faker): string =
  ## Generates random address.
  runnableExamples:
    let f = newFaker()
    echo f.address()

  case f.locale
  of "en_US": address_en_US.address(f)
  of "fa_IR": address_fa_IR.address(f)
  of "ja_JP": address_ja_JP.address(f)
  else: address_en_US.address(f)

proc buildingNumber*(f: Faker): string =
  ## Generates random buildingNumber.
  runnableExamples:
    let f = newFaker()
    echo f.buildingNumber()

  case f.locale
  of "en_US": address_en_US.buildingNumber(f)
  of "fa_IR": address_fa_IR.buildingNumber(f)
  of "ja_JP": address_ja_JP.buildingNumber(f)
  else: address_en_US.buildingNumber(f)

proc city*(f: Faker): string =
  ## Generates random city.
  runnableExamples:
    let f = newFaker()
    echo f.city()

  case f.locale
  of "en_US": address_en_US.city(f)
  of "fa_IR": address_fa_IR.city(f)
  of "ja_JP": address_ja_JP.city(f)
  else: address_en_US.city(f)

proc cityPrefix*(f: Faker): string =
  ## Generates random cityPrefix.
  runnableExamples:
    let f = newFaker()
    echo f.cityPrefix()

  case f.locale
  of "en_US": address_en_US.cityPrefix(f)
  of "fa_IR": address_fa_IR.cityPrefix(f)
  of "ja_JP": address_ja_JP.cityPrefix(f)
  else: address_en_US.cityPrefix(f)

proc citySuffix*(f: Faker): string =
  ## Generates random citySuffix.
  runnableExamples:
    let f = newFaker()
    echo f.citySuffix()

  case f.locale
  of "en_US": address_en_US.citySuffix(f)
  of "fa_IR": address_fa_IR.citySuffix(f)
  of "ja_JP": address_ja_JP.citySuffix(f)
  else: address_en_US.citySuffix(f)

proc country*(f: Faker): string =
  ## Generates random country.
  runnableExamples:
    let f = newFaker()
    echo f.country()

  case f.locale
  of "en_US": address_en_US.country(f)
  of "fa_IR": address_fa_IR.country(f)
  of "ja_JP": address_ja_JP.country(f)
  else: address_en_US.country(f)

proc militaryApo*(f: Faker): string =
  ## Generates random militaryApo.
  runnableExamples:
    let f = newFaker()
    echo f.militaryApo()

  case f.locale
  of "en_US": address_en_US.militaryApo(f)
  of "fa_IR": address_fa_IR.militaryApo(f)
  of "ja_JP": address_ja_JP.militaryApo(f)
  else: address_en_US.militaryApo(f)

proc militaryDpo*(f: Faker): string =
  ## Generates random militaryDpo.
  runnableExamples:
    let f = newFaker()
    echo f.militaryDpo()

  case f.locale
  of "en_US": address_en_US.militaryDpo(f)
  of "fa_IR": address_fa_IR.militaryDpo(f)
  of "ja_JP": address_ja_JP.militaryDpo(f)
  else: address_en_US.militaryDpo(f)

proc militaryShip*(f: Faker): string =
  ## Generates random militaryShip.
  runnableExamples:
    let f = newFaker()
    echo f.militaryShip()

  case f.locale
  of "en_US": address_en_US.militaryShip(f)
  of "fa_IR": address_fa_IR.militaryShip(f)
  of "ja_JP": address_ja_JP.militaryShip(f)
  else: address_en_US.militaryShip(f)

proc militaryState*(f: Faker): string =
  ## Generates random militaryState.
  runnableExamples:
    let f = newFaker()
    echo f.militaryState()

  case f.locale
  of "en_US": address_en_US.militaryState(f)
  of "fa_IR": address_fa_IR.militaryState(f)
  of "ja_JP": address_ja_JP.militaryState(f)
  else: address_en_US.militaryState(f)

proc postalcode*(f: Faker): string =
  ## Generates random postalcode.
  runnableExamples:
    let f = newFaker()
    echo f.postalcode()

  case f.locale
  of "en_US": address_en_US.postalcode(f)
  of "fa_IR": address_fa_IR.postalcode(f)
  of "ja_JP": address_ja_JP.postalcode(f)
  else: address_en_US.postalcode(f)

proc postalcodePlus4*(f: Faker): string =
  ## Generates random postalcodePlus4.
  runnableExamples:
    let f = newFaker()
    echo f.postalcodePlus4()

  case f.locale
  of "en_US": address_en_US.postalcodePlus4(f)
  of "fa_IR": address_fa_IR.postalcodePlus4(f)
  of "ja_JP": address_ja_JP.postalcodePlus4(f)
  else: address_en_US.postalcodePlus4(f)

proc postcode*(f: Faker): string =
  ## Generates random postcode.
  runnableExamples:
    let f = newFaker()
    echo f.postcode()

  case f.locale
  of "en_US": address_en_US.postcode(f)
  of "fa_IR": address_fa_IR.postcode(f)
  of "ja_JP": address_ja_JP.postcode(f)
  else: address_en_US.postcode(f)

proc secondaryAddress*(f: Faker): string =
  ## Generates random secondaryAddress.
  runnableExamples:
    let f = newFaker()
    echo f.secondaryAddress()

  case f.locale
  of "en_US": address_en_US.secondaryAddress(f)
  of "fa_IR": address_fa_IR.secondaryAddress(f)
  of "ja_JP": address_ja_JP.secondaryAddress(f)
  else: address_en_US.secondaryAddress(f)

proc state*(f: Faker): string =
  ## Generates random state.
  runnableExamples:
    let f = newFaker()
    echo f.state()

  case f.locale
  of "en_US": address_en_US.state(f)
  of "fa_IR": address_fa_IR.state(f)
  of "ja_JP": address_ja_JP.state(f)
  else: address_en_US.state(f)

proc streetAddress*(f: Faker): string =
  ## Generates random streetAddress.
  runnableExamples:
    let f = newFaker()
    echo f.streetAddress()

  case f.locale
  of "en_US": address_en_US.streetAddress(f)
  of "fa_IR": address_fa_IR.streetAddress(f)
  of "ja_JP": address_ja_JP.streetAddress(f)
  else: address_en_US.streetAddress(f)

proc streetName*(f: Faker): string =
  ## Generates random streetName.
  runnableExamples:
    let f = newFaker()
    echo f.streetName()

  case f.locale
  of "en_US": address_en_US.streetName(f)
  of "fa_IR": address_fa_IR.streetName(f)
  of "ja_JP": address_ja_JP.streetName(f)
  else: address_en_US.streetName(f)

proc streetSuffix*(f: Faker): string =
  ## Generates random streetSuffix.
  runnableExamples:
    let f = newFaker()
    echo f.streetSuffix()

  case f.locale
  of "en_US": address_en_US.streetSuffix(f)
  of "fa_IR": address_fa_IR.streetSuffix(f)
  of "ja_JP": address_ja_JP.streetSuffix(f)
  else: address_en_US.streetSuffix(f)

proc zipcode*(f: Faker): string =
  ## Generates random zipcode.
  runnableExamples:
    let f = newFaker()
    echo f.zipcode()

  case f.locale
  of "en_US": address_en_US.zipcode(f)
  of "fa_IR": address_fa_IR.zipcode(f)
  of "ja_JP": address_ja_JP.zipcode(f)
  else: address_en_US.zipcode(f)

proc zipcodePlus4*(f: Faker): string =
  ## Generates random zipcodePlus4.
  runnableExamples:
    let f = newFaker()
    echo f.zipcodePlus4()

  case f.locale
  of "en_US": address_en_US.zipcodePlus4(f)
  of "fa_IR": address_fa_IR.zipcodePlus4(f)
  of "ja_JP": address_ja_JP.zipcodePlus4(f)
  else: address_en_US.zipcodePlus4(f)
