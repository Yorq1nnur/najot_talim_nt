import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import '../../cubits/currency/countries_cubit.dart';
import '../../cubits/currency/countries_state.dart';
import '../../data/models/forms_status.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state.formsStatus == FormsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
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
            children: List.generate(state.country.length, (index) {
              CountryModel countryModel = state.country[index];
              return ListTile(
                title: Text(countryModel.name),
                subtitle: Text(countryModel.capital),
              );
            }),
          );
        },
      ),
    );
  }
}
