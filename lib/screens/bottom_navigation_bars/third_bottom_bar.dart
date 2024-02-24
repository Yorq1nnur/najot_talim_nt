// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/home_screen/home_screen.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/my_cards_screen.dart';
import 'package:najot_talim_nt/screens/transfer_actions_screen/trans_actions_screen.dart';
import 'package:najot_talim_nt/screens/transfer_screen/transfer_screen.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class TabBox3 extends StatefulWidget {
  const TabBox3({super.key});

  @override
  State<TabBox3> createState() => _TabBox3State();
}

class _TabBox3State extends State<TabBox3> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
          switch (newActiveIndex) {
            case 1:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyCardsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 2:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransActionsScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
            case 3:
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return TransferScreen(
                        onTap: () {
                          setState(() {
                            _activeIndex = 0;
                          });
                        },
                      );
                    },
                  ),
                );
                break;
              }
          }
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.home,
              width: 26.w,
              height: 26.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.home,
              width: 26.w,
              height: 26.h,
              fit: BoxFit.cover,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.cards,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.cards,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            label: "Cards",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.cards,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.cards,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.bottomProfile,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.cards,
              width: 25.w,
              height: 30.h,
              fit: BoxFit.cover,
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
