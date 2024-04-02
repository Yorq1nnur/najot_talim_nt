import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import '../../data/models/trans_actions_model.dart';

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
                TransactionsModel currencyModel = state.currencies[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.indigo.withOpacity(0.4),
                        spreadRadius: 5
                      ),BoxShadow(
                          color: Colors.indigo.withOpacity(0.4),
                          offset: const Offset(5, 5)
                      )
                    ],
                    border: Border.all(
                      color: Colors.indigoAccent,
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('YOBORUVCHI NOMI:', style: AppTextStyle.interBold.copyWith(
                            color: Colors.yellow,
                            fontSize: 18
                          ),),
                          Text('YOBORUVCHI BRENDI:', style: AppTextStyle.interBold.copyWith(
                              color: Colors.yellow,
                              fontSize: 18
                          ),),
                          Text('YOBORUVCHI JOYLASHUVI:', style: AppTextStyle.interBold.copyWith(
                              color: Colors.yellow,
                              fontSize: 18
                          ),),
                        ],
                      )
                    ],
                  ),
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
