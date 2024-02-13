// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/accessories_screen.dart';
import 'package:najot_talim_nt/all_screen.dart';
import 'package:najot_talim_nt/bottom_row.dart';
import 'package:najot_talim_nt/buttons.dart';
import 'package:najot_talim_nt/computers_screen.dart';
import 'package:najot_talim_nt/get_categories_text.dart';
import 'package:najot_talim_nt/smart_objects_screen.dart';
import 'package:najot_talim_nt/smartphones_screen.dart';
import 'package:najot_talim_nt/speakers_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 30.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetCategoriesText(title: 'Categories', onTap: () {},),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButtons(
                              title: "All",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AllScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Computers",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ComputerScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Accessories",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AccessoriesScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Smartphones",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SmartPhonesScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Smart objects",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SmartObjectsScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            TextButtons(
                              title: "Speakers",
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return SpeakersScreen();
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              BottomRow(),
            ],
          ),
        ),
      ),
    );
  }
}
