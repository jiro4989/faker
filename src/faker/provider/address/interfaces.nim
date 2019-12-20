# interfaces はプロシージャの定義のみをまとめたモジュール。
# C言語でいうヘッダファイルのように使用する。
#
# このモジュールをincludeしたモジュールは、このモジュールに定義しているプロシー
# ジャを全て実装しないと、コンパイルが通らない。

import ../../base

proc address*(f: Faker): string
proc buildingNumber*(f: Faker): string
proc city*(f: Faker): string
proc cityPrefix*(f: Faker): string
proc citySuffix*(f: Faker): string
proc country*(f: Faker): string
proc countryCode*(f: Faker, representation: string): string
proc militaryApo*(f: Faker): string
proc militaryDpo*(f: Faker): string
proc militaryShip*(f: Faker): string
proc militaryState*(f: Faker): string
proc postalcode*(f: Faker): string
proc postalcodeInState*(f: Faker, stateAbbr: string): string
proc postalcodePlus4*(f: Faker): string
proc postcode*(f: Faker): string
proc secondaryAddress*(f: Faker): string
proc state*(f: Faker): string
proc stateAbbr*(f: Faker, includeTerritories: bool): string
proc streetAddress*(f: Faker): string
proc streetName*(f: Faker): string
proc streetSuffix*(f: Faker): string
proc zipcode*(f: Faker): string
proc zipcodeInState*(f: Faker, stateAbbr: string): string
proc zipcodePlus4*(f: Faker): string
