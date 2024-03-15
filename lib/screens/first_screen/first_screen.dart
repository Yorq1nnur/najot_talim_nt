// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/repositories/country_repo.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/screens/first_detail_screen/first_detail_screen.dart';
import 'package:najot_talim_nt/screens/global_widgets/view_items.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';

import '../../view_models/first_view_model.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

final CountryRepo firstRepo = CountryRepo();

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
        body: context.watch<FirstViewModel>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: () {
                  return Future<void>.delayed(
                    const Duration(seconds: 2),
                    () {
                      context.read<FirstViewModel>().fetchFirstData();
                    },
                  );
                },
                child: ListView(
                  children: [
                    ...List.generate(
                      context.watch<FirstViewModel>().countries.length,
                      (index) {
                        CountryModel first =
                            context.watch<FirstViewModel>().countries[index];
                        return ViewItems(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FirstDetailScreen(
                                  countryModel: first,
                                ),
                              ),
                            );
                          },
                          title: first.name["common"],
                          subTitle: first.subregion,
                          imagePath: first.flags['png'],
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
