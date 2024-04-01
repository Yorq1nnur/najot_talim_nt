// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'COUNTRY SCREEN',
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: FutureBuilder<List<Country>?>(
          future: ApiProvider.getCountries(),
          builder: (
            BuildContext context,
            AsyncSnapshot<List<Country>?> snapshot,
          ) {
            if (snapshot.data != null) {
              List<Country> users = snapshot.data as List<Country>;
              return ListView(
                children: List.generate(users.length, (index) {
                  Country userModel = users[index];
                  return ListTile(
                    onTap: () {},
                    title: Text(userModel.capital),
                    subtitle: Text(userModel.name),
                    trailing: Text(userModel.phone),
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
