class CountryModel {
  final String code;
  final String name;
  final String phone;
  final Map<String, String> continent;
  final String capital;
  final String currency;
  final String emoji;

  CountryModel({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    required this.capital,
    required this.currency,
    required this.emoji,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      code: json['code'],
      name: json['name'],
      phone: json['phone'],
      continent: Map<String, String>.from(json['continent']),
      capital: json['capital'],
      currency: json['currency'],
      emoji: json['emoji'],
    );
  }
}