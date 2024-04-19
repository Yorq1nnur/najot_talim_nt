import 'package:flutter/services.dart';
import 'package:najot_talim_nt/utils/app_colors.dart';

class StatusBarItems extends SystemUiOverlayStyle{

  static SystemUiOverlayStyle systemUiOverlayStyle (){
    return const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
  }
}