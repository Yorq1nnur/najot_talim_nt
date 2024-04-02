import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';
import '../../cubits/currency/currency_cubit.dart';
import '../../cubits/currency/currency_state.dart';
import '../../data/models/trans_actions_model.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        child: Scaffold(
          backgroundColor: const Color(0xFF000000),
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
            backgroundColor: const Color(0xFF000000),
            centerTitle: true,
            elevation: 0,
            title: Text(
              "PAYMENT",
              style: AppTextStyle.interBold.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
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
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: ListTile(
                            title: Text(
                              currencyModel.data[0].sender.name,
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            subtitle: Text(
                              currencyModel.data[0].sender.location,
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl:
                                    currencyModel.data[0].sender.brandImage,
                                errorWidget: (context, url, error) =>
                                    CachedNetworkImage(
                                  imageUrl:
                                      'https://marketing.uz/uz/uploads/works/covers/c6c1569b46e710f6ffefdfb5d8f046d7.jpg',
                                ),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            trailing: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "-${currencyModel.data[0].amount} UZS\n",
                                    style: AppTextStyle.interBold
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: currencyModel.transferDate,
                                    style: AppTextStyle.interBold.copyWith(
                                      color: Colors.white.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: ListTile(
                            title: Text(
                              currencyModel.data[1].sender.name,
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            subtitle: Text(
                              currencyModel.data[0].sender.location,
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: CachedNetworkImage(
                                imageUrl:
                                    currencyModel.data[1].sender.brandImage,
                                errorWidget: (context, url, error) =>
                                    CachedNetworkImage(
                                  imageUrl:
                                      'https://marketing.uz/uz/uploads/works/covers/c6c1569b46e710f6ffefdfb5d8f046d7.jpg',
                                ),
                                height: 50,
                                width: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            trailing: RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        "-${currencyModel.data[1].amount} UZS\n",
                                    style: AppTextStyle.interBold
                                        .copyWith(color: Colors.white),
                                  ),
                                  TextSpan(
                                    text: currencyModel.transferDate,
                                    style: AppTextStyle.interBold.copyWith(
                                      color: Colors.white.withOpacity(
                                        0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
