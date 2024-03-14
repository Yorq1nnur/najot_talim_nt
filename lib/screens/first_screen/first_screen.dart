// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/repositories/first_repo.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

final FirstRepo firstRepo = FirstRepo();

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: FutureBuilder<MyResponse>(
          future: firstRepo.getAllData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              List<FirstModel> cyprus =
                  (snapshot.data as MyResponse).data as List<FirstModel>;
              return ListView(
                children: [
                  ...List.generate(
                    cyprus.length,
                    (index) {
                      var cyp = cyprus[index];
                      return ListTile(
                        title: Text(cyp.region,
                            style: Theme.of(context).textTheme.titleMedium),
                        subtitle: Text(
                          cyp.subregion,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        trailing: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  16.r,
                                ),
                                border: Border.all(
                                  color: AppColors.black,
                                  width: 1.w,
                                )),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16.r,
                                ),
                                child: Image.network(
                                  cyp.flags["png"],
                                  height: 50.h,
                                  width: 100.w,
                                  fit: BoxFit.cover,
                                ))),
                      );
                    },
                  ),
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
