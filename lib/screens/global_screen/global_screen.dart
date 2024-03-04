// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/my_response.dart';
import 'package:najot_talim_nt/data/models/product_model.dart';
import 'package:najot_talim_nt/data/repositories/product_repo.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

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
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              List<ProductModel> products =
              (snapshot.data as MyResponse).data as List<ProductModel>;
              return ListView(
                children: [
                  ...List.generate(products.length, (index) {
                    var product = products[index];
                    return ListTile(
                        title: Text(product.productName),
                        subtitle: Text(product.description),
                        leading: Image.network(
                          product.imageUrl,
                          width: 42,
                        ),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  ProductModel productModel = ProductModel(
                                    color: Colors.red,
                                    description: product.description,
                                    productName: "Macbook Pro M2",
                                    imageUrl: product.imageUrl,
                                    price: product.price,
                                    dateTime: DateTime.now(),
                                    productId: product.productId,
                                  );

                                  await productRepo.updateProduct(productModel);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.green,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await productRepo
                                      .deleteProduct(product.productId);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ));
                  })
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
