import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
    required this.countryModel,
  });

  final CountryModel countryModel;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Ink(
              height: 40.w,
              width: 40.w,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.w,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(
                  50.r,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8.w,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30.w,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: Text(
            "${countryModel.name.toUpperCase()} DETAILS",
            style: AppTextStyle.interBold,
          ),
        ),
      ),
    );
  }
}
