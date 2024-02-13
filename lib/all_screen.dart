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


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
