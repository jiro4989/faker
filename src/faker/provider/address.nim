import util, ../base, address/[address_en_US, address_ja_JP]
export base

genProc address,
  [
    address,
    buildingNumber,
    city,
    cityPrefix,
    citySuffix,
    country,
    #countryCode,
    militaryApo,
    militaryDpo,
    militaryShip,
    militaryState,
    postalcode,
    #postalcodeInState,
    postalcodePlus4,
    postcode,
    secondaryAddress,
    state,
    #stateAbbr,
    streetAddress,
    streetName,
    streetSuffix,
    zipcode,
    #zipcodeInState,
    zipcodePlus4,
  ],
  [
    en_US,
    ja_JP,
  ]
