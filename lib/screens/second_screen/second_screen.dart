// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/data/repositories/second_repo.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/screens/second_detail_screen/second_detail_screen.dart';
import 'package:najot_talim_nt/screens/second_detail_screen/widgets/second_view_widget.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:najot_talim_nt/view_models/first_view_model.dart';
import 'package:najot_talim_nt/view_models/second_view_model.dart';
import 'package:provider/provider.dart';

import '../../data/models/first_model/first_model.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

final SecondRepo secondRepo = SecondRepo();

class _SecondScreenState extends State<SecondScreen> {
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
        body: context.watch<SecondViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<SecondViewModel>().fetchSecondData();
                    },
                  );
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      context.watch<SecondViewModel>().currencies.length,
                      (index) {
                        SecondModel first =
                            context.watch<SecondViewModel>().currencies[index];
                        return SecondViewWidget(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    SecondDetailScreen(secondModel: first),
                              ),
                            );
                          },
                          title: first.name,
                          subTitle: first.username,
                          id: first.id,
                          imagePath: first.avatarUrl,
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
