import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/screens/accessories_screen.dart';
import 'package:najot_talim_nt/items/bottom_row.dart';
import 'package:najot_talim_nt/screens/smart_objects_screen.dart';
import 'package:najot_talim_nt/screens/smartphones_screen.dart';
import 'package:najot_talim_nt/screens/speakers_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import '../categories/get_categories_text.dart';
import '../items/buttons.dart';
import 'all_screen.dart';
import 'computers_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
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
              GetCategoriesText(
                title: 'Categories',
                onTap: () {},
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
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
                                      return const AllScreen();
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
                                      return const ComputerScreen();
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
                                      return const AccessoriesScreen();
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
                                      return const SmartPhonesScreen();
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
                                      return const SmartObjectsScreen();
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
                                      return const SpeakersScreen();
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
              const BottomRow(),
            ],
          ),
        ),
      ),
    );
  }
}
