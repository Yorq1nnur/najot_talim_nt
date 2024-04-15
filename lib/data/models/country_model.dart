class CountryModel {
  final String code;
  final String name;
  final String emoji;
  final String capital;
  final String phone;
  final List<String> languages;
  final String continent;

  CountryModel({
    required this.code,
    required this.name,
    required this.emoji,
    required this.capital,
    required this.phone,
    required this.languages,
    required this.continent,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> languagesList = json['languages'] ?? [];
    List<String> languages =
    languagesList.map((lang) => lang['name'] as String).toList();

    return CountryModel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      emoji: json['emoji'] ?? '',
      capital: json['capital'] ?? '',
      phone: json['phone'] ?? '',
      languages: languages,
      continent: json['continent']['name'] ?? '',
    );
  }
}