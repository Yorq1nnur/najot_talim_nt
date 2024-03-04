class ProductModel {
  String uuid;
  String color;
  String description;
  String imageUrl;
  String madeIn;
  int price;
  String productName;

  ProductModel({
    required this.uuid,
    required this.color,
    required this.description,
    required this.imageUrl,
    required this.madeIn,
    required this.price,
    required this.productName,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    uuid: json["_uuid"],
    color: json["color"],
    description: json["description"],
    imageUrl: json["image_url"],
    madeIn: json["made_in"],
    price: json["price"],
    productName: json["product_name"],
  );

  Map<String, dynamic> toJson() => {
    "_uuid": uuid,
    "color": color,
    "description": description,
    "image_url": imageUrl,
    "made_in": madeIn,
    "price": price,
    "product_name": productName,
  };

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "product_name": productName,
      "price": price,
      "description": description,
      "color": "FF0000",
      "image_url": imageUrl,
      "_uuid": uuid,
      "made_in":madeIn
    };
  }
}