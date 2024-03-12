// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/categories_view.dart';
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
      value: SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: const Color(
          0xFFEFEFEF,
        ),
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 20,
                  ),
                  onPressed: () {},
                  color: Colors.black,
                  icon: const Icon(
                    Icons.more_horiz,
                  ),
                ),
              ],
              leading: Container(
                padding: const EdgeInsets.all(
                  5,
                ),
                height: 50,
                child: IconButton(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        15,
                      ),
                    ),
                    backgroundColor: Colors.white,
                    elevation: 20,
                  ),
                  onPressed: () {},
                  color: Colors.black,
                  icon: const Icon(
                    Icons.category,
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    const SizedBox(
                      height: 70,
                    ),
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(
                            16,
                          ),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 32,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                  0.3,
                                ),
                                offset: const Offset(
                                  4,
                                  4,
                                ),
                                blurRadius: 10,
                                spreadRadius: 6,
                              )
                            ],
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Domhnall Gleeson",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  fontSize: 26,
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                "account ending with 1545",
                                style: AppTextStyle.interSemiBold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  10,
                                ),
                                color: Colors.grey.withOpacity(
                                  0.6,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.person,
                                  size: 50,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: CategoriesView(
                onTap: () {},
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ...List.generate(
                    100,
                    (index) => ListTile(
                      onTap: () {},
                      title: Text(
                        "Behance Project",
                        style: AppTextStyle.interSemiBold.copyWith(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
