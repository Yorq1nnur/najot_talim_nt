import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../models/company_models.dart';
import '../utils/colors/app_colors.dart';
import 'first_next_screen.dart';
import 'package:http/http.dart' as http;

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
                          color: AppColors.cF2954D,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...List.generate(
                          8,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FirstNextScreen(
                                      dataModels: dataModels!,
                                      logos: logos,
                                      index: dataModels!.data[index].id,
                                    ),
                                  ),
                                );
                              },
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 20.h),
                              title: Text(dataModels!.data[index].carModel),
                              trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.asset(
                                  logos[index],
                                  height: 40.h,
                                  width: 40.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
