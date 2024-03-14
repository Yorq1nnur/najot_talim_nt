
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class SecondRepo {
  Future<List<SecondModel>> getAllUserData() => ApiProvider.getAllUserData();
}
