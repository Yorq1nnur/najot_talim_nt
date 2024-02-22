import 'package:najot_talim_nt/data/models/products/product_model.dart';

class ProductsModel {
  final ProductModel productModel;

  ProductsModel({required this.productModel});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      productModel: ProductModel.fromJson(
        json["data"] as Map<String, dynamic>,
      ),
    );
  }
}
