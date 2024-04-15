import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/data/queries/country.dart';
import '../../blocs/countries_bloc.dart';
import '../../utils/colors/app_colors.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("EUROPE COUNTRIES"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              vertical: 10.h,
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
                  (index) => Ink(
                    height: 20.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(
                        16.r,
                      ),
                    ),
                    child: InkWell(
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
                        vertical: 20.h,
                      ),
                      children: [
                        ...List.generate(
                          state.countries.length,
                          (index) => ListTile(
                            title: Text(state.countries[index].name),
                            trailing: Text(state.countries[index].emoji),
                            subtitle: Text(
                                "${state.countries[index].capital}\n${state.countries[index].continentName}"),
                          ),
                        ),
                      ]);
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
