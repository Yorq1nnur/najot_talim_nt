// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/data/repositories/second_repo.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

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
        body: FutureBuilder<MyResponse>(
          future: secondRepo.getAllUserData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.hasData) {
              List<SecondModel> users =
                  (snapshot.data as MyResponse).data as List<SecondModel>;
              return ListView(
                children: [
                  ...List.generate(
                    users.length,
                    (index) {
                      var user = users[index];
                      return ListTile(
                        title: Text(user.name,
                            style: Theme.of(context).textTheme.titleMedium),
                        subtitle: Text(
                          user.state,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        trailing: ClipRRect(borderRadius: BorderRadius.circular(16.r,),child: Image.network(user.avatarUrl, height: 50.h, width: 50.w, fit: BoxFit.cover,)),
                        leading: Text(user.id.toString()),
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
