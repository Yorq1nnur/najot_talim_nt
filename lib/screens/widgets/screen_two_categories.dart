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
        "https://p7.hiclipart.com/preview/909/529/160/organic-food-juice-vegetable-fruit-basket-vegetable-png-photos.jpg",
    title: "Vegetables",
    color: Colors.lightBlue.shade500,
  ),
  CategoriesImg(
    imgPath:
        "https://w7.pngwing.com/pngs/642/551/png-transparent-variety-of-fruits-fruit-dietary-fiber-vegetable-food-health-fresh-fruits-natural-foods-orange-nutrition-thumbnail.png",
    title: "Fruit",
    color: Colors.lightBlue.shade500,
  ),
  CategoriesImg(
    imgPath:
        "https://cdn.imgbin.com/16/23/25/imgbin-spices-p5cB1jhPHdRKKHEu7mh37bhvK.jpg",
    title: "Spice",
    color: Colors.lightBlue.shade500,
  ),
  const CategoriesImg(
    imgPath:
        "https://w7.pngwing.com/pngs/556/719/png-transparent-assorted-vegetables-diet-food-nutrition-mediterranean-cuisine-eating-kitchen-ingredients-miscellaneous-natural-foods-food.png",
    title: "Ingredients",
    color: Colors.white,
  ),
  CategoriesImg(
    imgPath:
        "https://w7.pngwing.com/pngs/79/224/png-transparent-vegetarian-cuisine-side-dish-food-recipe-rice-pute-food-recipe-quality.png",
    title: "Side Dishes",
    color: Colors.lightBlue.shade500,
  ),
];

final List<String> imagesPath = [
  "https://e7.pngegg.com/pngimages/575/463/png-clipart-fried-rice-with-carrots-and-green-peas-hyderabadi-biryani-fried-rice-raita-vegetable-vegetable-food-recipe.png",
  "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L21vdGFybzdfZ3JhcGhpY19vZl9mcnVpdHNpc29sYXRlZF9vbl93aGl0ZV9kN2U1OWI1My1kNjYwLTQ3MzYtOGFiYi0xYmQxOTlkNDBiMjYucG5n.png",
  "https://i.pinimg.com/736x/43/9a/82/439a82a6fcebc9944b838696a21eb60a.jpg",
  "https://images.rawpixel.com/image_png_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlMV92YWRvdXZhbl9jdXJyeV9zcGljZV9pc29sYXRlZF9vbl93aGl0ZV9iYWNrZ3JvdV81YWNkNWQ0OC01YWMwLTRhY2UtYjViNC0wZjU4N2Y0ZTcyOGMucG5n.png",
  "https://www.pngitem.com/pimgs/m/68-688962_side-dish-hd-png-download.png",
  "https://w7.pngwing.com/pngs/556/719/png-transparent-assorted-vegetables-diet-food-nutrition-mediterranean-cuisine-eating-kitchen-ingredients-miscellaneous-natural-foods-food.png",
  "https://upload.wikimedia.org/wikipedia/commons/6/6e/Fruits.png",
  "https://i.pinimg.com/originals/ce/f7/da/cef7da2e95340f436ee1e05a07d74f38.png",
  "https://images.creativefabrica.com/products/previews/2023/09/04/IWU7JOpyt/2ar7snrBsiQR3pGuVNQ5T5EUIEP-mobile.jpg",
  "https://www.pngall.com/wp-content/uploads/8/Ingredient-PNG-Clipart.png",
];
