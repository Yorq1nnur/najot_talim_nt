// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/home_screen/home_screen.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/my_cards_screen.dart';
import 'package:najot_talim_nt/screens/trans_actions_screen/trans_actions_screen.dart';
import 'package:najot_talim_nt/screens/transfer_screen/transfer_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';

class ThirdBottomBar extends StatefulWidget {
  const ThirdBottomBar({super.key});

  @override
  State<ThirdBottomBar> createState() => _ThirdBottomBarState();
}

class _ThirdBottomBarState extends State<ThirdBottomBar> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: AppColors.c8D8D8D,
        selectedItemColor: AppColors.white,
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.home,
              width: 26.w,
              height: 26.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.secondHome,
              width: 26.w,
              height: 26.h,
              fit: BoxFit.cover,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AppImages.secondCards,
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
              AppImages.secondTransActions,
              width: 33.w,
              height: 25.h,
              fit: BoxFit.cover,
            ),
            icon: SvgPicture.asset(
              AppImages.transActions,
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
              colorFilter: ColorFilter.mode(
                AppColors.cF9F9F9,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(
              AppImages.bottomProfile,
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
