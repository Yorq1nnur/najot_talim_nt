import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import '../../data/models/currency_model.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<CurrencyRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
      ),
      body: BlocBuilder<CurrencyCubit, CurrencyState>(
        builder: (context, state) {
          if (state is CurrencyLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CurrencyErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorText),
              ],
            );
          } else if (state is CurrencySuccessState) {
            return ListView(
              children: List.generate(state.currencies.length, (index) {
                CurrencyModel currencyModel = state.currencies[index];
                return ListTile(
                  title:
                      Text("${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                  subtitle: Text("Qiymati: ${currencyModel.rate}"),
                );
              }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
