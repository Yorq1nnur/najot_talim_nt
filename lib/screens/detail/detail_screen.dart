import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model.dart';
import 'package:najot_talim_nt/screens/detail/widgets/global_text.dart';
import 'package:najot_talim_nt/screens/detail/widgets/helper_text.dart';
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
          actions: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 5.w,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Text(
                  countryModel.emoji,
                  style: AppTextStyle.interBold.copyWith(
                    fontSize: 20.w,
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w,),
          ],
          title: Text(
            "${countryModel.name.toUpperCase()} DETAILS",
            style: AppTextStyle.interBold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const GlobalText(title: "COUNTRY NAME"),
              HelperText(
                title: countryModel.name.toUpperCase(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GlobalText(title: "COUNTRY'S CODE"),
                  HelperText(
                    title: countryModel.code.toUpperCase(),
                  ),
                ],
              ),
              const GlobalText(title: "COUNTRY'S CAPITAL"),
              HelperText(
                title: countryModel.capital.toUpperCase(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GlobalText(
                    title: "COUNTRY'S FLAG",
                  ),
                  Text(
                    countryModel.emoji,
                    style: AppTextStyle.interBold.copyWith(
                      fontSize: 50.w,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GlobalText(title: "COUNTRY'S CURRENCY"),
                  HelperText(
                    title: countryModel.currency.toUpperCase(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const GlobalText(title: "COUNTRY'S PHONE CODE"),
                  HelperText(
                    title: countryModel.phone.toUpperCase(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
