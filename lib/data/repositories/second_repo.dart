
import 'package:najot_talim_nt/data/network/api_provider.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';

class SecondRepo {
  Future<MyResponse> getAllUserData() => ApiProvider.getAllUserData();
}
