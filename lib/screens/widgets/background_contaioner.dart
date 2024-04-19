import 'package:flutter/material.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';

class BackGroundContainer extends StatelessWidget {
  const BackGroundContainer({
    super.key,
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          tileMode: TileMode.repeated,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.c001973,
            AppColors.c00E0FF,
            AppColors.c00AAB8,
            AppColors.c423FC3,
          ],
        ),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}
