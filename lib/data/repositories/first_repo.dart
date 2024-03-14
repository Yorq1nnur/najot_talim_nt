
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class FirstRepo {
  Future<List<FirstModel>> getAllData() => ApiProvider.getAllData();
}
