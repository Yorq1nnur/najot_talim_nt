import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/data/repository/repository.dart';
import 'package:najot_talim_nt/screens/products/products_screen.dart';
import 'package:najot_talim_nt/utils/size/size_utils.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class ProductDataScreen extends StatefulWidget {
  const ProductDataScreen({super.key, required this.id, required this.name});

  final int id;
  final String name;

  @override
  State<ProductDataScreen> createState() => _ProductDataScreenState();
}

class _ProductDataScreenState extends State<ProductDataScreen> {
  ProductRepository productRepository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.name,
            style: AppTextStyle.interSemiBold.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: productRepository.getProductDataById(widget.id),
        builder: (
          BuildContext context,
          AsyncSnapshot<NetworkResponse> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            NetworkResponse data = snapshot.data as NetworkResponse;
            List<ProductModel> products = data.data as List<ProductModel>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: List.generate(
                      products.length,
                      (index) {
                        ProductModel productModel = products[index];
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 24.w,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 8.h,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              15.r,
                            ),
                            border: Border.all(
                              color: AppColors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.c_2A3256,
                                spreadRadius: 5.r,
                                blurRadius: 2.r,
                                offset: Offset(3.r, 2.r),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.network(
                                  productModel.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Id : ${productModel.id}",
                                        style:
                                            AppTextStyle.interSemiBold.copyWith(
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "Name : ${productModel.name}",
                                        style:
                                            AppTextStyle.interSemiBold.copyWith(
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        "Prise : ${productModel.price}",
                                        style:
                                            AppTextStyle.interSemiBold.copyWith(
                                          color: AppColors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Ink(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.transparent,
                    borderRadius: BorderRadius.circular(
                      14.r,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(
                      14.r,
                    ),
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProductsScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(
                          color: AppColors.c_5B1CAE,
                        ),
                        borderRadius: BorderRadius.circular(
                          14.r,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "See All Product ",
                          style: AppTextStyle.interSemiBold.copyWith(
                            color: AppColors.c_5B1CAE,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
