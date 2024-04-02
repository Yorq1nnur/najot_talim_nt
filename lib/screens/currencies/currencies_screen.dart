import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import '../../data/models/trans_actions_model.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: Text("PAYMENT", style: AppTextStyle.interBold,),
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
              physics: const BouncingScrollPhysics(),
              children: List.generate(state.currencies.length, (index) {
                TransactionsModel currencyModel = state.currencies[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.indigo.withOpacity(
                            0.4,
                          ),
                          spreadRadius: 5,
                        ),
                        BoxShadow(
                          color: Colors.indigo.withOpacity(
                            0.4,
                          ),
                          offset: const Offset(
                            5,
                            5,
                          ),
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
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(
                                  0.5,
                                ),
                                spreadRadius: 5,
                              ),
                            ],
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'YOBORUVCHI:',
                                style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54, fontSize: 18),
                              ),
                              Text(
                                'BRENDI:',
                                style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54, fontSize: 18),
                              ),
                              Text(
                                'JOYLASHUVI:',
                                style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54, fontSize: 18),
                              ),
                              Text(
                                'SANASI:',
                                style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54, fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withOpacity(
                                  0.5,
                                ),
                                spreadRadius: 5,
                              ),
                            ],
                            color: Colors.amberAccent,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: SizedBox(
                            width: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currencyModel.data[0].sender.name,
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black54.withOpacity(
                                      0.5,
                                    ),
                                    fontSize: 18,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    16,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    currencyModel.data[0].sender.brandImage,
                                    errorWidget: (context, url, error) =>
                                        Image.network(
                                          'https://marketing.uz/uz/uploads/works/covers/c6c1569b46e710f6ffefdfb5d8f046d7.jpg',
                                        ),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    currencyModel.data[0].sender.location,
                                    style: AppTextStyle.interBold.copyWith(
                                      color: Colors.black54.withOpacity(
                                        0.5,
                                      ),
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Text(
                                    currencyModel.data[0].date,
                                    style: AppTextStyle.interBold.copyWith(
                                      color: Colors.black54.withOpacity(
                                        0.5,
                                      ),
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          }
          return const SizedBox();
        },
      ),
    ), value: SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
