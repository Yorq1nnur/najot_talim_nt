import 'package:flutter/material.dart';
import '../../size/app_size.dart';
import 'categories_img.dart';

class CategoriesViewScreenTwo extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.getW()),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Сategory",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20.getW(),
                ),
              ),
              Text(
                "Show All",
                style: TextStyle(
                  color: Colors.brown,
                  fontSize: 20.getW(),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.getH()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                categories.length,
                    (index) => categories[index],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

List<CategoriesImg> categories = [
  CategoriesImg(
    imgPath:
        "https://w7.pngwing.com/pngs/1004/169/png-transparent-lettuce-green-vegetables-food.png",
    title: "Vegetables",
    color: Colors.lightBlue.shade500,
  ),
  CategoriesImg(
    imgPath:
        "https://w7.pngwing.com/pngs/102/117/png-transparent-assorted-fruits-display-fruit-fruit-natural-foods-frutti-di-bosco-image-file-formats-thumbnail.png",
    title: "Fruit",
    color: Colors.lightBlue.shade500,
  ),
  CategoriesImg(
    imgPath:
        "https://e7.pngegg.com/pngimages/383/141/png-clipart-five-spice-powder-mixed-spice-herb-spice-mix-vegetable-dried-fruit-food-thumbnail.png",
    title: "Spice",
    color: Colors.lightBlue.shade500,
  ),
  const CategoriesImg(
    imgPath:
        "https://www.pngall.com/wp-content/uploads/8/Ingredient-Transparent.png",
    title: "Ingridients",
    color: Colors.white,
  ),
  CategoriesImg(
    imgPath:
        "https://img.lovepik.com/free-png/20211210/lovepik-hot-pot-side-dish-png-image_401464276_wh1200.png",
    title: "Side Dishes",
    color: Colors.lightBlue.shade500,
  ),
];
