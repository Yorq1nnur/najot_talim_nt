import 'package:flutter/material.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

import 'categories.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {

  final List<ModelCategories> allModels = [
    ModelCategories(image: AppImages.firstLaptop, title: "Surface laptop 3", price: 999,),
    ModelCategories(image: AppImages.secondLaptop, title: "XPS laptop 13", price: 899,),
    ModelCategories(image: AppImages.thirdLaptop, title: "LG Gram 17", price: 1399,),
    ModelCategories(image: AppImages.fourthLaptop, title: "Macbook pro 13", price: 1299,),
    ModelCategories(image: AppImages.fiveLaptop, title: "Samsung Galaxy Book", price: 799,),
    ModelCategories(image: AppImages.sixLaptop, title: "HP Ryzen 7", price: 699,),

    ModelCategories(image: AppImages.airTag, title: "AirTag", price: 49,),
    ModelCategories(image: AppImages.casePhone, title: "Case for phone", price: 11,),
    ModelCategories(image: AppImages.flashCard, title: "Flash card 32 gb", price: 22,),
    ModelCategories(image: AppImages.headPhone, title: "HeadPhone", price: 55,),
    ModelCategories(image: AppImages.magSafe, title: "Magsafe", price: 33,),
    ModelCategories(image: AppImages.powerBank, title: "Power bank 20000 mah", price: 44,),

    ModelCategories(image: AppImages.s24, title: "Samsung Galaxy S24", price: 1000,),
    ModelCategories(image: AppImages.s24Plus, title: "Samsung Galaxy S24 Plus", price: 1200,),
    ModelCategories(image: AppImages.s24Ultra, title: "Samsung Galaxy S24 Ultra", price: 1300,),
    ModelCategories(image: AppImages.iphone15, title: "Iphone 15", price: 1050,),
    ModelCategories(image: AppImages.iphone15Pro, title: "Iphone 15 Pro", price: 1150,),
    ModelCategories(image: AppImages.iphone15ProMax, title: "Iphone 15 Pro Max", price: 1300,),

    ModelCategories(image: AppImages.adobe, title: "Adobe Premiere Pro", price: 25,),
    ModelCategories(image: AppImages.capCut, title: "CapCut Pro", price: 11,),
    ModelCategories(image: AppImages.flutter, title: "Flutter Pro", price: 55,),
    ModelCategories(image: AppImages.illustrator, title: "Illustrator Pro", price: 44,),
    ModelCategories(image: AppImages.photoShop, title: "PhotoShop Pro", price: 22,),
    ModelCategories(image: AppImages.pyton, title: "Pyton Pro", price: 33,),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
