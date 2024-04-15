import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/queries/country.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../blocs/countries_bloc.dart';
import '../../utils/colors/app_colors.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String title = 'ALL';
  int activeIndex = 0;
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          "$title COUNTRIES",
          style: AppTextStyle.interBold,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
              horizontal: 20.w,
            ),
            child: TextField(
              onChanged: (v) {
                searchText = v;
                setState(() {});
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    16.r,
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.w,
                  ),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 5.h,
              horizontal: 10.w,
            ),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...List.generate(
                  continents.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Ink(
                      height: 30.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                        color: activeIndex == index
                            ? Colors.indigoAccent
                            : Colors.amberAccent,
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          context.read<CountriesBloc>().add(
                                FetchCountries(
                                  continentCodes[index],
                                ),
                              );
                          setState(() {
                            title = continents[index];
                            activeIndex = index;
                          });
                        },
                        borderRadius: BorderRadius.circular(
                          16.r,
                        ),
                        child: Center(
                          child: Text(
                            continents[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CountriesBloc, CountriesState>(
              builder: (context, state) {
                if (state is CountriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CountriesError) {
                  return Center(child: Text(state.errorMessage));
                }

                if (state is CountriesSuccess) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 10.h,
                    ),
                    children: [
                      ...List.generate(
                        state.countries.length,
                        (index) {
                          final country = state.countries[index];
                          if (country.name
                              .toLowerCase()
                              .contains(searchText.toLowerCase())) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: ListTile(
                                title: Text(country.name),
                                trailing: Text(country.emoji),
                                subtitle: Text(
                                    "${country.capital}\n${country.continentName}"),
                              ),
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
