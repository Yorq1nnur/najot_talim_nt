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
                  ...List.generate(cyprus.length, (index) {
                    var product = cyprus[index];
                    return ListTile(
                      title: Text(product.region,
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(
                        product.startOfWeek,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
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
