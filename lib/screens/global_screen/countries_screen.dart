import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/queries/country.dart';
import 'package:najot_talim_nt/screens/detail/detail_screen.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../blocs/countries_bloc.dart';
import '../../utils/colors/app_colors.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  TextEditingController textEditingController = TextEditingController();
  String title = 'ALL';
  int activeIndex = 0;
  String searchText = '';

  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
              focusNode: focusNode,
              controller: textEditingController,
              onChanged: (v) {
                searchText = v;
                textEditingController.text = v;
                setState(() {});
              },
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 30.w,
                  color: AppColors.black,
                ),
                hintText: "Search...",
                suffixIcon: IconButton(
                  onPressed: () {
                    searchText = '';
                    textEditingController.clear();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.cancel_outlined,
                    size: 30.w,
                    color: AppColors.black,
                  ),
                ),
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                            ),
                            child: Text(
                              continents[index],
                              style: AppTextStyle.interBold,
                            ),
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
                                onTap: () {
                                  debugPrint(
                                      "COUNTRY IS LANGUAGES LENGTH: ${country.languages.length}");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (country) => DetailScreen(
                                        countryModel: state.countries[index],
                                      ),
                                    ),
                                  );
                                },
                                leading: Column(
                                  children: [
                                    Text(
                                      "${index+1}) ${country.code}",
                                      style: AppTextStyle.interBold,
                                    ),
                                    Text(
                                      country.phone.length > 3
                                          ? country.phone.substring(
                                              country.phone.length - 3)
                                          : country.phone,
                                      style: AppTextStyle.interBold.copyWith(
                                        color: AppColors.black.withOpacity(
                                          0.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                title: Text(
                                  country.name,
                                  style: AppTextStyle.interBold,
                                ),
                                trailing: Text(country.emoji, style: AppTextStyle.interBold.copyWith(
                                  fontSize: 30.w
                                ),),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      country.capital,
                                      style: AppTextStyle.interBold.copyWith(
                                        color: AppColors.black.withOpacity(
                                          0.8,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      country.name,
                                      style: AppTextStyle.interBold.copyWith(
                                        color: AppColors.black.withOpacity(
                                          0.6,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
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
