class ModelTwo {
  final int id;
  final String name;

  ModelTwo({
    required this.id,
    required this.name,
  });

  factory ModelTwo.fromJson(Map<String, dynamic> json) {
    return ModelTwo(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? "",
    );
  }
}
