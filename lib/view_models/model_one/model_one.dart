class ModelOne {
  final int id;
  final String name;

  ModelOne({
    required this.id,
    required this.name,
  });

  factory ModelOne.fromJson(Map<String, dynamic> json) {
    return ModelOne(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
    );
  }
}
