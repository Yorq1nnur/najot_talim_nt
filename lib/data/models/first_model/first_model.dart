import 'dart:convert';

class CyprusModel {
  final Map<String, String> name;
  final List<String> tld;
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final Map<String, Map<String, String>> currencies;
  final Map<String, List<String>> idd;
  final List<String> capital;
  final List<String> altSpellings;
  final String region;
  final String subregion;
  final Map<String, String> languages;
  final Map<String, Map<String, String>> translations;
  final List<double> latlng;
  final bool landlocked;
  final double area;
  final Map<String, Map<String, String>> demonyms;
  final String flag;
  final Map<String, String> maps;
  final int population;
  final Map<String, double> gini;
  final String fifa;
  final Map<String, dynamic> car;
  final List<String> timezones;
  final List<String> continents;
  final Map<String, String> flags;
  final Map<String, String> coatOfArms;
  final String startOfWeek;
  final Map<String, List<double>> capitalInfo;
  final Map<String, dynamic> postalCode;

  CyprusModel({
    required this.name,
    required this.tld,
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subregion,
    required this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.gini,
    required this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CyprusModel.fromJson(Map<String, dynamic> json) {
    return CyprusModel(
      name: Map<String, String>.from(json['name']),
      tld: List<String>.from(json['tld']),
      cca2: json['cca2'],
      ccn3: json['ccn3'],
      cca3: json['cca3'],
      cioc: json['cioc'],
      independent: json['independent'],
      status: json['status'],
      unMember: json['unMember'],
      currencies: Map<String, Map<String, String>>.from(json['currencies']),
      idd: Map<String, List<String>>.from(json['idd']),
      capital: List<String>.from(json['capital']),
      altSpellings: List<String>.from(json['altSpellings']),
      region: json['region'],
      subregion: json['subregion'],
      languages: Map<String, String>.from(json['languages']),
      translations: Map<String, Map<String, String>>.from(json['translations']),
      latlng: List<double>.from(json['latlng']),
      landlocked: json['landlocked'],
      area: json['area'],
      demonyms: Map<String, Map<String, String>>.from(json['demonyms']),
      flag: json['flag'],
      maps: Map<String, String>.from(json['maps']),
      population: json['population'],
      gini: Map<String, double>.from(json['gini']),
      fifa: json['fifa'],
      car: Map<String, dynamic>.from(json['car']),
      timezones: List<String>.from(json['timezones']),
      continents: List<String>.from(json['continents']),
      flags: Map<String, String>.from(json['flags']),
      coatOfArms: Map<String, String>.from(json['coatOfArms']),
      startOfWeek: json['startOfWeek'],
      capitalInfo: Map<String, List<double>>.from(json['capitalInfo']),
      postalCode: Map<String, dynamic>.from(json['postalCode']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tld': tld,
      'cca2': cca2,
      'ccn3': ccn3,
      'cca3': cca3,
      'cioc': cioc,
      'independent': independent,
      'status': status,
      'unMember': unMember,
      'currencies': currencies,
      'idd': idd,
      'capital': capital,
      'altSpellings': altSpellings,
      'region': region,
      'subregion': subregion,
      'languages': languages,
      'translations': translations,
      'latlng': latlng,
      'landlocked': landlocked,
      'area': area,
      'demonyms': demonyms,
      'flag': flag,
      'maps': maps,
      'population': population,
      'gini': gini,
      'fifa': fifa,
      'car': car,
      'timezones': timezones,
      'continents': continents,
      'flags': flags,
      'coatOfArms': coatOfArms,
      'startOfWeek': startOfWeek,
      'capitalInfo': capitalInfo,
      'postalCode': postalCode,
    };
  }
}