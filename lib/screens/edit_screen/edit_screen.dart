// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/screens/edit_screen/items/text_field_item.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/repositories/product_repo.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({
    super.key,
    required this.productModel, required this.onSet,
  });
  final VoidCallback onSet;
  final ProductModel productModel;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final ProductRepo productRepo = ProductRepo();
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController madeInController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: ZoomTapAnimation(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: AppColors.black,
                size: 20.sp,
              ),
            ),
          ),
          title: Text(
            "UPDATE PRODUCT",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w900,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Product name",
                        controller: productNameController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Price",
                        controller: priceController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Code's Color",
                        controller: colorController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Made in",
                        controller: madeInController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Description",
                        controller: descriptionController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 10.h,
                      ),
                      child: TextFieldItem(
                        hintText: "Image url",
                        controller: imageUrlController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              child: ZoomTapAnimation(
                onTap: () async {
                  ProductModel productModel = ProductModel(
                    color: colorController.text,
                    description: descriptionController.text,
                    productName: productNameController.text,
                    imageUrl: imageUrlController.text,
                    price: int.parse(priceController.text),
                    uuid: widget.productModel.uuid,
                    madeIn: madeInController.text,
                  );

                  await productRepo.updateProduct(productModel);
                  widget.onSet.call();
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                     Navigator.pop(context);
                    },
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(
                      24.r,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "UPDATE PRODUCT",
                      style: AppTextStyle.interBold.copyWith(
                        color: AppColors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
