// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:najot_talim_nt/screens/home_screen/home_screen.dart';
import 'package:najot_talim_nt/screens/my_cards_screen/my_cards_screen.dart';
import 'package:najot_talim_nt/screens/transfer_actions_screen/trans_actions_screen.dart';
import 'package:najot_talim_nt/screens/transfer_screen/transfer_screen.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/images/app_images.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class FirstBottomBar extends StatefulWidget {
  const FirstBottomBar({super.key});

  @override
  State<FirstBottomBar> createState() => _FirstBottomBarState();
}

class _FirstBottomBarState extends State<FirstBottomBar> {
  List<Widget> _screens = [];
  int _activeIndex = 0;

  @override
  void initState() {
    _screens = [
      HomeScreen(),
      MyCardsScreen(),
      TransActionsScreen(),
      TransferScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_activeIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE.withOpacity(
              0.6,
            ),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        selectedLabelStyle: AppTextStyle.interMedium.copyWith(
            color: AppColors.cEEEEEE.withOpacity(
              0.6,
            ),
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        onTap: (newActiveIndex) {
          _activeIndex = newActiveIndex;
          setState(() {});
        },
        currentIndex: _activeIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 16,
        unselectedFontSize: 14,
        backgroundColor: AppColors.transparent,
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
