import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/category_model.dart';
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/repository/repository.dart';
import 'package:najot_talim_nt/screens/product_data/product_data.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/size/size_utils.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../utils/colors/app_colors.dart';
import '../products/products_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  CategoryRepository categoryResponse = CategoryRepository();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light),
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            title: Center(
              child: Text(
                "All Products",
                style: AppTextStyle.interSemiBold.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.sp,
                ),
              ),
            ),
          ),
          body: FutureBuilder(
            future: categoryResponse.getCategories(),
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
                List<CategoryModel> categories =
                    data.data as List<CategoryModel>;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: List.generate(
                          categories.length,
                          (index) {
                            CategoryModel categoryModel = categories[index];
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ProductDataScreen(
                                        id: categoryModel.id,
                                        name: categoryModel.name,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  vertical: 20.h,
                                  horizontal: 20.w,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      categoryModel.name,
                                      style:
                                          AppTextStyle.interSemiBold.copyWith(
                                        color: AppColors.c_5B1CAE,
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    if (index == 1)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        child: Image.asset(
                                          AppImages.mobile,
                                          height: 50.h,
                                          width: 50.w,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    else if(index == 2)
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        child: Image.asset(
                                          AppImages.smartphones,
                                          height: 50.h,
                                          width: 50.w,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    else
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          16.r,
                                        ),
                                        child: Image.network(
                                          categoryModel.imageUrl,
                                          height: 50.h,
                                          width: 50.w,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Ink(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
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
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: AppColors.c_1A72DD,
                            border: Border.all(
                              color: AppColors.c_2A3256,
                            ),
                            borderRadius: BorderRadius.circular(
                              14.r,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "ALL PRODUCTS ",
                              style: AppTextStyle.interSemiBold.copyWith(
                                color: AppColors.white,
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
        ));
  }
}
