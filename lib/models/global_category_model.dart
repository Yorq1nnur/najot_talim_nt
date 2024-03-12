class GlobalCategoryModel {
  final String price;
  final String imagePath;
  final String title;

  GlobalCategoryModel({
    required this.price,
    required this.title,
    required this.imagePath,
  });
}


final List<GlobalCategoryModel> globalCategoryList = [
  GlobalCategoryModel(price: "469", title: "EURO Balance", imagePath: "assets/icons/euro.svg"),
  GlobalCategoryModel(price: "215", title: "USD Balance", imagePath: "assets/icons/dollar.svg"),
  GlobalCategoryModel(price: "154", title: "EURO Balance", imagePath: "assets/icons/euro.svg"),
  GlobalCategoryModel(price: "596", title: "USD Balance", imagePath: "assets/icons/dollar.svg"),
];
