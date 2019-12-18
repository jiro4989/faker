import random, strutils
from strformat import `&`

include interfaces

const
  cityPrefixes = @["North", "East", "West", "South", "New", "Lake", "Port"]
  citySuffixes = @[
    "town",
    "ton",
    "land",
    "ville",
    "berg",
    "burgh",
    "borough",
    "bury",
    "view",
    "port",
    "mouth",
    "stad",
    "furt",
    "chester",
    "mouth",
    "fort",
    "haven",
    "side",
    "shire"]
  buildingNumberFormats = @["###", "####", "#####"]
  streetSuffixes = @[
    "Alley",
    "Avenue",
    "Branch",
    "Bridge",
    "Brook",
    "Brooks",
    "Burg",
    "Burgs",
    "Bypass",
    "Camp",
    "Canyon",
    "Cape",
    "Causeway",
    "Center",
    "Centers",
    "Circle",
    "Circles",
    "Cliff",
    "Cliffs",
    "Club",
    "Common",
    "Corner",
    "Corners",
    "Course",
    "Court",
    "Courts",
    "Cove",
    "Coves",
    "Creek",
    "Crescent",
    "Crest",
    "Crossing",
    "Crossroad",
    "Curve",
    "Dale",
    "Dam",
    "Divide",
    "Drive",
    "Drive",
    "Drives",
    "Estate",
    "Estates",
    "Expressway",
    "Extension",
    "Extensions",
    "Fall",
    "Falls",
    "Ferry",
    "Field",
    "Fields",
    "Flat",
    "Flats",
    "Ford",
    "Fords",
    "Forest",
    "Forge",
    "Forges",
    "Fork",
    "Forks",
    "Fort",
    "Freeway",
    "Garden",
    "Gardens",
    "Gateway",
    "Glen",
    "Glens",
    "Green",
    "Greens",
    "Grove",
    "Groves",
    "Harbor",
    "Harbors",
    "Haven",
    "Heights",
    "Highway",
    "Hill",
    "Hills",
    "Hollow",
    "Inlet",
    "Inlet",
    "Island",
    "Island",
    "Islands",
    "Islands",
    "Isle",
    "Isle",
    "Junction",
    "Junctions",
    "Key",
    "Keys",
    "Knoll",
    "Knolls",
    "Lake",
    "Lakes",
    "Land",
    "Landing",
    "Lane",
    "Light",
    "Lights",
    "Loaf",
    "Lock",
    "Locks",
    "Locks",
    "Lodge",
    "Lodge",
    "Loop",
    "Mall",
    "Manor",
    "Manors",
    "Meadow",
    "Meadows",
    "Mews",
    "Mill",
    "Mills",
    "Mission",
    "Mission",
    "Motorway",
    "Mount",
    "Mountain",
    "Mountain",
    "Mountains",
    "Mountains",
    "Neck",
    "Orchard",
    "Oval",
    "Overpass",
    "Park",
    "Parks",
    "Parkway",
    "Parkways",
    "Pass",
    "Passage",
    "Path",
    "Pike",
    "Pine",
    "Pines",
    "Place",
    "Plain",
    "Plains",
    "Plains",
    "Plaza",
    "Plaza",
    "Point",
    "Points",
    "Port",
    "Port",
    "Ports",
    "Ports",
    "Prairie",
    "Prairie",
    "Radial",
    "Ramp",
    "Ranch",
    "Rapid",
    "Rapids",
    "Rest",
    "Ridge",
    "Ridges",
    "River",
    "Road",
    "Road",
    "Roads",
    "Roads",
    "Route",
    "Row",
    "Rue",
    "Run",
    "Shoal",
    "Shoals",
    "Shore",
    "Shores",
    "Skyway",
    "Spring",
    "Springs",
    "Springs",
    "Spur",
    "Spurs",
    "Square",
    "Square",
    "Squares",
    "Squares",
    "Station",
    "Station",
    "Stravenue",
    "Stravenue",
    "Stream",
    "Stream",
    "Street",
    "Street",
    "Streets",
    "Summit",
    "Summit",
    "Terrace",
    "Throughway",
    "Trace",
    "Track",
    "Trafficway",
    "Trail",
    "Trail",
    "Tunnel",
    "Tunnel",
    "Turnpike",
    "Turnpike",
    "Underpass",
    "Union",
    "Unions",
    "Valley",
    "Valleys",
    "Via",
    "Viaduct",
    "View",
    "Views",
    "Village",
    "Village",
    "Villages",
    "Ville",
    "Vista",
    "Vista",
    "Walk",
    "Walks",
    "Wall",
    "Way",
    "Ways",
    "Well",
    "Wells"]

  postcodeFormats = @["#####", "#####-####"]

  states = @[
    "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado",
    "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho",
    "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
    "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
    "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
    "New Hampshire", "New Jersey", "New Mexico", "New York",
    "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon",
    "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota",
    "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington",
    "West Virginia", "Wisconsin", "Wyoming",
  ]

  statesAbbr = @[
    "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "DC", "FL", "GA", "HI",
    "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN",
    "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH",
    "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA",
    "WV", "WI", "WY",
  ]

  statesPostcode = {
    "AL": (35004, 36925), "AK": (99501, 99950), "AZ": (85001, 86556),
    "AR": (71601, 72959), "CA": (90001, 96162), "CO": (80001, 81658),
    "CT": (6001, 6389), "DE": (19701, 19980), "DC": (20001, 20039),
    "FL": (32004, 34997), "GA": (30001, 31999), "HI": (96701, 96898),
    "ID": (83201, 83876), "IL": (60001, 62999), "IN": (46001, 47997),
    "IA": (50001, 52809), "KS": (66002, 67954), "KY": (40003, 42788),
    "LA": (70001, 71232), "ME": (3901, 4992), "MD": (20331, 20331),
    "MA": (1001, 2791), "MI": (48001, 49971), "MN": (55001, 56763),
    "MS": (38601, 39776), "MO": (63001, 65899), "MT": (59001, 59937),
    "NE": (68001, 68118), "NV": (88901, 89883), "NH": (3031, 3897),
    "NJ": (7001, 8989), "NM": (87001, 88441), "NY": (10001, 14905),
    "NC": (27006, 28909), "ND": (58001, 58856), "OH": (43001, 45999),
    "OK": (73001, 73199), "OR": (97001, 97920), "PA": (15001, 19640),
    "RI": (2801, 2940), "SC": (29001, 29948), "SD": (57001, 57799),
    "TN": (37010, 38589), "TX": (73301, 73301), "UT": (84001, 84784),
    "VT": (5001, 5495), "VA": (20040, 20041), "WA": (98001, 99403),
    "WV": (24701, 26886), "WI": (53001, 54990), "WY": (82001, 83128),
  }

  territoriesAbbr = @[
    "AS", "FM", "GU", "MH", "MP", "PW", "PR", "VI",
  ]

  states_and_territories_abbr = states_abbr & territories_abbr

  military_state_abbr = @["AE", "AA", "AP"]

  military_ship_prefix = @["USS", "USNS", "USNV", "USCGC"]

  military_apo_format = @["PSC ####, Box ####"]

  military_dpo_format = @["Unit #### Box ####"]

  city_formats = @[
      "{{city_prefix}} {{first_name}}{{city_suffix}}",
      "{{city_prefix}} {{first_name}}",
      "{{first_name}}{{city_suffix}}",
      "{{last_name}}{{city_suffix}}",
  ]

  street_name_formats = @[
      "{{first_name}} {{street_suffix}}",
      "{{last_name}} {{street_suffix}}",
  ]

  street_address_formats = @[
      "{{building_number}} {{street_name}}",
      "{{building_number}} {{street_name}} {{secondary_address}}",
  ]

  address_formats = @[
      "{{street_address}}\n{{city}}, {{state_abbr}} {{postcode}}",
  ]

  # address_formats = OrderedDict((
  #     ("{{street_address}}\n{{city}}, {{state_abbr}} {{postcode}}", 25),
  #     #  military address formatting.
  #     ("{{military_apo}}\nAPO {{military_state}} {{postcode}}", 1),
  #     ("{{military_ship}} {{last_name}}\nFPO {{military_state}} {{postcode}}", 1),
  #     ("{{military_dpo}}\nDPO {{military_state}} {{postcode}}", 1),
  # ))

  secondary_address_formats = @["Apt. ###", "Suite ###"]

proc address*(f: Faker): string = "TODO"
proc buildingNumber*(f: Faker): string = "TODO"
proc city*(f: Faker): string = "TODO"
proc cityPrefix*(f: Faker): string = "TODO"
proc citySuffix*(f: Faker): string = "TODO"
proc country*(f: Faker): string = "TODO"
proc countryCode*(f: Faker, representation: string): string = "TODO"
proc militaryApo*(f: Faker): string = "TODO"
proc militaryDpo*(f: Faker): string = "TODO"
proc militaryShip*(f: Faker): string = "TODO"
proc militaryState*(f: Faker): string = "TODO"
proc postalcode*(f: Faker): string = "TODO"
proc postalcodeInState*(f: Faker, stateAbbr: string): string = "TODO"
proc postalcodePlus4*(f: Faker): string = "TODO"
proc postcode*(f: Faker): string = "TODO"
proc secondaryAddress*(f: Faker): string = "TODO"
proc state*(f: Faker): string = "TODO"
proc stateAbbr*(f: Faker, includeTerritories: string): string = "TODO"
proc streetAddress*(f: Faker): string = "TODO"
proc streetName*(f: Faker): string = "TODO"
proc streetSuffix*(f: Faker): string = "TODO"
proc zipcode*(f: Faker): string = "TODO"
proc zipcodeInState*(f: Faker, stateAbbr: string): string = "TODO"
proc zipcodePlus4*(f: Faker): string = "TODO"
