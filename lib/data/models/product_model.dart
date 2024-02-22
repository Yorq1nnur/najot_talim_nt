class ProductModel{
  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.categoryId,
    required this.imageUrl,
    required this.description
  });
  factory ProductModel.fromJson(Map<String,dynamic> json){
    return ProductModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      price: json["price"] as int? ?? 0,
      categoryId: json["category_id"] as int? ?? 0,
      imageUrl: json["image_url"] as String? ?? "",
      description:json["description"] as String? ?? "",
    );
  }
  final int id;
  final int categoryId;
  final int price;
  final String name;
  final String imageUrl;
  final String description;
}
