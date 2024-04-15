const String countriesQuery = '''query {
  countries {
    code
    name
    emoji
    capital
    continent{
      name
    }
  }
}''';

String getCountryQueryByContinent(String query) {
  return '''query CountriesByContinent {
  countries(filter: { continent: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
}

String getCountryByName(String query) {
  return '''query CountriesByContinent {
  countries(filter: { name: { in: ["$query"] } }) {
    code
    name
    capital
    emoji
    phone
    continent{
      name
    }
  }
}''';
}

List<String> continentCodes = [
  "ALL",
  "EU",
  "AS",
  "AF",
  "NA",
  "SA",
  "AN",
  "OC",
];
List<String> continents = [
  "ALL",
  "EUROPE",
  "ASIA",
  "AFRICA",
  "NORTH AMERICA",
  "SOUTH AMERICA",
  "ANTARCTICA",
  "AUSTRALIA/OCEANIA"
];
