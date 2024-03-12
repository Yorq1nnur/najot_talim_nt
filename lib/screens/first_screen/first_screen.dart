import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:najot_talim_nt/screens/widgets/categories_.dart';
import 'package:najot_talim_nt/screens/widgets/global_button.dart';
import 'package:najot_talim_nt/screens/widgets/global_category.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../size/app_size.dart';
import '../widgets/global_text.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final ScrollController scrollController = ScrollController();
  int activeIndexButton = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.98),
          body: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6FA,),
                    borderRadius: BorderRadius.circular(16,),
                  ),
                  margin: EdgeInsets.symmetric(
                      horizontal: 18.getW(), vertical: 0.getW(),),
                  padding: EdgeInsets.symmetric(
                      horizontal: 18.getW(), vertical: 18.getH(),),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.getH(),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ZoomTapAnimation(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 47.getH(),
                              width: 47.getW(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12,),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child:
                                    Icon(Icons.arrow_back, color: Colors.black,),
                              ),
                            ),
                          ),
                          ZoomTapAnimation(
                            onTap: () {},
                            child: Container(
                              height: 47.getH(),
                              width: 47.getW(),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12,),
                                color: Colors.white,
                              ),
                              child: const Center(
                                child:
                                    Icon(Icons.more_horiz, color: Colors.black,),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.getH()),
                      Text(
                        "Balances",
                        style: TextStyle(
                          color: const Color(0xFF151940),
                          fontSize: 44.getW(),
                        ),
                      ),
                      SizedBox(height: 40.getH()),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GlobalCategory(
                              iconPath: "assets/icons/euro.svg",
                              title: "EUR Balance",
                              moneyText: "585.00",
                            ),
                            GlobalCategory(
                              iconPath: "assets/icons/dollar.svg",
                              title: "USD Balance",
                              moneyText: "105.00",
                            ),
                            GlobalCategory(
                              iconPath: "assets/icons/euro.svg",
                              title: "EUR Balance",
                              moneyText: "698.00",
                            ),
                            GlobalCategory(
                              iconPath: "assets/icons/dollar.svg",
                              title: "USD Balance",
                              moneyText: "585.00",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 29.getH(),),
                      Center(
                        child: Text(
                          "See Balance Details",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18.getW(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: CategoriesView(
                  widget: Container(
                    color: Colors.white,
                    height: 80,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.getW()),
                        child: Row(
                          children: [
                            ...List.generate(
                              3,
                              (index) => GlobalButton(
                                onTap: () {
                                  activeIndexButton = index;
                                  setState(() {});
                                },
                                activeIndex:
                                    (activeIndexButton == index) ? true : false,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 42.getW()),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Today",
                            style: TextStyle(
                              color: const Color(0xFF020000),
                              fontSize: 26.getW(),
                            ),
                          ),
                          SizedBox(height: 14.getH()),
                          ...List.generate(
                            money.length,
                            (index) => money[index],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
