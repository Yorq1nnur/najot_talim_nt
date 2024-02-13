// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/all_categories.dart';
import 'package:najot_talim_nt/bottom_row.dart';
import 'package:najot_talim_nt/category_model.dart';
import 'package:najot_talim_nt/get_categories_text.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class AllScreen extends StatefulWidget {
  const AllScreen({super.key});

  @override
  State<AllScreen> createState() => _AllScreenState();
}

class _AllScreenState extends State<AllScreen> {
  
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return AnnotatedRegion(value: SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    ), child: Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30.h,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GetCategoriesText(title: "All", onTap: (){
              Navigator.pop(context);
            }),
            Expanded(
              child: GridView.count(
                physics: AlwaysScrollableScrollPhysics(),
                controller: scrollController,
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.all(25),
                mainAxisSpacing: 24,
                //vertically
                crossAxisSpacing: 15,
                //horizontally
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                //Axis.vertical=> childAspectRatio = width/height.
                //Axis.horizontal=> childAspectRatio = height/width.
                children: [
                  ...List.generate(allModels.length, (index) => CategoryModel(image: allModels[index].image, title: allModels[index].title, price: allModels[index].price,),),
                ],
              ),
            ),
          BottomRow(),
          ],
        ),
      ),
    ));
  }
}
