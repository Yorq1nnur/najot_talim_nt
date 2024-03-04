// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/my_response.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/data/repositories/product_repo.dart';
import 'package:najot_talim_nt/screens/description_screen/description_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  final ProductRepo productRepo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.cFFFFFF,
          title: Text(
            "E-COMMERCE",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<MyResponse>(
          future: productRepo.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }
            if (snapshot.hasData) {
              List<ProductModel> products =
                  (snapshot.data as MyResponse).data as List<ProductModel>;
              return GridView.count(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 10.h,
                ),
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                children: [
                  ...List.generate(products.length, (index) {
                    var product = products[index];
                    int color = int.parse("0xFF${product.color}");
                    return ZoomTapAnimation(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DescriptionScreen(productModel: product,),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.c0001FC,
                            width: 2.w,
                          ),
                          color: Colors.blueGrey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(
                            16.r,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              product.imageUrl,
                              height: 100.h,
                              width: 200.w,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Name: ${product.productName}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                              child: Text(
                                "Price: ${product.price}",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Center(
                                child: Text(
                              "Made in: ${product.madeIn}",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                              ),
                            )),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Color:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Container(
                                  height: 20.h,
                                  width: 20.w,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      color,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ZoomTapAnimation(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                ZoomTapAnimation(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                            'WARNING!!!',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20.sp,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          content: Text(
                                            'Are you sure delete???',
                                            style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('Cancel'),
                                                ),
                                                TextButton(
                                                  onPressed: () async {
                                                    await productRepo
                                                        .deleteProduct(
                                                            product.uuid);
                                                    Navigator.of(context).pop();
                                                    setState(() {});
                                                  },
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
