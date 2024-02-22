import 'package:najot_talim_nt/data/models/categories/category_model.dart';

class CategoriesModel {
  final CategoryModel categoryModel;

  CategoriesModel({required this.categoryModel});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      categoryModel: CategoryModel.fromJson(json["data"] as Map<String, dynamic>),
    );
  }
}
