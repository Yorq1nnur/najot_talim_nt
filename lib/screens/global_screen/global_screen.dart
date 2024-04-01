import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';

import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import '../../data/models/forms_status.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocBuilder<CurrenciesCubit, CurrencyState>(
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
            children: List.generate(state.currencies.length, (index) {
              Country currencyModel = state.currencies[index];
              return ListTile(
                title: Text(currencyModel.name),
                subtitle: Text(currencyModel.capital),
              );
            }),
          );
        },
      ),
    );
  }
}
