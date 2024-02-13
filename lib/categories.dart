enum Category {
  all,
  computers,
  accessories,
  smartphones,
  smartObjects,
  speakers,
}

class ModelCategories{

  final String title;
  final String image;
  final int price;

  ModelCategories({required this.image, required this.title, required this.price});

}