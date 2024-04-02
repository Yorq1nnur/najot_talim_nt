import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../cubits/currency/countries_cubit.dart';
import '../../cubits/currency/countries_state.dart';
import '../../data/models/forms_status.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          title: Text(
            "COUNTRIES",
            style: AppTextStyle.interBold.copyWith(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: BlocBuilder<CountriesCubit, CountriesState>(
          builder: (context, state) {
            if (state.formsStatus == FormsStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.formsStatus == FormsStatus.error) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.statusText),
                ],
              );
            }
            return ListView(
              children: List.generate(
                state.country.length,
                (index) {
                  CountryModel countryModel = state.country[index];
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                      horizontal: 10.w,
                    ),
                    margin: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 10.w,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.w,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.yellow.withOpacity(
                            0.5,
                          ),
                          spreadRadius: 5.r,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 166.h,
                          padding: EdgeInsets.symmetric(
                            horizontal: 2.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.w,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'NAME:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'CAPITAL:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'COUNTRY CODE:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'PHONE CODE:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'FLAG:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'CURRENCY:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'CONTINENT:',
                                style: AppTextStyle.interBold.copyWith(
                                  color: Colors.black54,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        SizedBox(
                          width: 140.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 2.w,
                              vertical: 2.h,
                            ),
                            height: 166.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                16.r,
                              ),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.w,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  countryModel.name,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  countryModel.capital,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  countryModel.code,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  countryModel.phone,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  countryModel.emoji,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  countryModel.currency,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  '${countryModel.continent.code} ${countryModel.continent.name}',
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
