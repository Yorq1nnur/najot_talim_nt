
class Continent {
  String code;
  String name;

  Continent({
    required this.code,
    required this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json) {
    return Continent(
      code: json['code']as String? ?? '',
      name: json['name']as String? ?? '',
    );
  }
}

class Country {
  String code;
  String name;
  String phone;
  Continent continent;
  String capital;
  String currency;
  String emoji;

  Country({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      code: json['code'] as String? ?? '',
      name: json['name']as String? ?? '',
      phone: json['phone']as String? ?? '',
      continent: Continent.fromJson(json['continent']),
      capital: json['capital']as String? ?? '',
      currency: json['currency']as String? ?? '',
      emoji: json['emoji']as String? ?? '',
    );
  }
}

