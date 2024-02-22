class ProductModel {
  final int id;
  final int categoryId;
  final String name;
  final int price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.categoryId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
      price: json["price"] as int? ?? 0,
      categoryId: json["category_id"] as int? ?? 0,
    );
  }
}
