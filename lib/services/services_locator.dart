import 'package:get_it/get_it.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

import '../../../data/local/local_storage.dart';

final GetIt getIt = GetIt.instance;

void setUpDI(){
  getIt.registerSingleton<CurrencyController>(CurrencyController());
  getIt.registerSingleton<ApiProvider>(ApiProvider());
}