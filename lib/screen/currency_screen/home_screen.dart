import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:najot_talim_nt/screen/bloc/currency_bloc.dart';
import 'package:najot_talim_nt/screen/bloc/currency_event.dart';
import 'package:najot_talim_nt/screen/bloc/currency_state.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CurrencyBloc, CurrencyState>(
        builder: (BuildContext context, CurrencyState state) {
          if (state is CurrencyInitialState) {
            return const Center(
              child: SizedBox(),
            );
          }
          if (state is CurrencySuccessState) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                      border: Border.all(
                        color: Colors.yellow,
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo.withOpacity(
                              0.7,
                            ),
                            blurRadius: 5)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.data[index].title,
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            state.data[index].date,
                            style: TextStyle(
                              color: Colors.red.withOpacity(
                                0.7,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            state.data[index].code,
                            style: TextStyle(
                              color: Colors.red.withOpacity(
                                0.5,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.data[index].cbPrice.isNotEmpty
                                ? state.data[index].cbPrice
                                : "NO DATA",
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            state.data[index].nbuBuyPrice.isNotEmpty
                                ? state.data[index].nbuBuyPrice
                                : "NO DATA",
                            style: TextStyle(
                              color: Colors.red.withOpacity(
                                0.7,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            state.data[index].nbuCellPrice.isNotEmpty
                                ? state.data[index].nbuCellPrice
                                : "NO DATA",
                            style: TextStyle(
                              color: Colors.red.withOpacity(
                                0.5,
                              ),
                              fontSize: 20,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
          if (state is CurrencyNetworkState) {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<CurrencyBloc>().add(GetNetworkCurrencyEvent());
                },
                child: const Text('Refresh'),
              ),
            );
          }
          return Center(
            child: Lottie.asset('assets/lottie/lottie.json'),
          );
        },
        listener: (BuildContext context, CurrencyState state) {
          debugPrint("___________________________state $state");
          if (state is CurrencyNetworkState) {
            if (state.isLocal) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('No internet connection'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Ok'),
                        ),
                      ],
                    );
                  });
            } else {
              context.read<CurrencyBloc>().add(GetLocalCurrencyEvent());
            }
          }
        },
      ),
    );
  }
}
