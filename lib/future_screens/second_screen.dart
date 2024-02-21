import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/future_screens/second_next_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../models/company_models.dart';
import '../utils/colors/app_colors.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  DataModels? dataModels;

  bool isTrue = true;

  final List<String> logos = [
    AppImages.honda,
    AppImages.toyota,
    AppImages.rollsRoyce,
    AppImages.tesla,
    AppImages.honda,
    AppImages.toyota,
    AppImages.rollsRoyce,
    AppImages.tesla,
  ];

  Future<void> _fetchData() async {
    http.Response response = await http.get(
      Uri.parse("https://easyenglishuzb.free.mockoapp.net/companies"),
    );
    if (response.statusCode == 200) {
      dataModels = DataModels.fromJson(jsonDecode(response.body));
      setState(() {
        isTrue = !isTrue;
      });
    }
  }

  @override
  void initState() {
    _fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cF2954D,
      body: isTrue
          ? Center(
              child: SizedBox(
                height: 100.h,
                width: 100.h,
                child: const CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 40.h,
                    ),
                    child: Text(
                      "Select cars model",
                      style: AppTextStyle.interBold.copyWith(
                          color: AppColors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 10.h,
                    ),
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: [
                      ...List.generate(
                        8,
                        (index) => TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecondNextScreen(
                                  dataModels: dataModels!,
                                  logos: logos,
                                  index: dataModels!.data[index].id,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.cC4C4C4,
                              borderRadius: BorderRadius.circular(
                                16.r,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      logos[index],
                                      height: 130.h,
                                      width: 200.w,
                                      fit: BoxFit.cover,
                                    )),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  dataModels!.data[index].carModel,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: AppColors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
