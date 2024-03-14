class CyprusModel {
  final String cca2;
  final String ccn3;
  final String cca3;
  final String cioc;
  final String status;
  final String region;
  final String subregion;
  final double area;
  final int population;
  final String fifa;
  final List<String> timezones;
  final List<String> continents;
  final String startOfWeek;

  CyprusModel({
    required this.cca2,
    required this.ccn3,
    required this.cca3,
    required this.cioc,
    required this.status,
    required this.region,
    required this.subregion,
    required this.area,
    required this.population,
    required this.fifa,
    required this.timezones,
    required this.continents,
    required this.startOfWeek,
  });

  factory CyprusModel.fromJson(Map<String, dynamic> json) {
    return CyprusModel(
      cca2: json['cca2'] as String? ?? "",
      ccn3: json['ccn3'] as String? ?? "",
      cca3: json['cca3'] as String? ?? "",
      cioc: json['cioc'] as String? ?? "",
      status: json['status'] as String? ?? "",
      region: json['region'] as String? ?? "",
      subregion: json['subregion'] as String? ?? "",
      area: json['area'].toDouble() as double? ?? 0.0,
      population: json['population'] as int? ?? 0,
      fifa: json['fifa'] as String? ?? "",
      timezones:
          (json["timezones"] as List?)?.map((e) => e.toString()).toList() ?? [],
      continents:
          (json["continents"] as List?)?.map((e) => e.toString()).toList() ??
              [],
      startOfWeek: json['startOfWeek'] as String? ?? "",
    );
  }
}
