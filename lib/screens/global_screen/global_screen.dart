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
                  return ListTile(
                    title: Text(
                      countryModel.name,
                      style: AppTextStyle.interBold.copyWith(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    subtitle: Text(
                      countryModel.capital,
                      style: AppTextStyle.interBold.copyWith(
                        color: Colors.black.withOpacity(
                          0.5,
                        ),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
