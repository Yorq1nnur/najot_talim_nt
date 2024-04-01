import 'package:najot_talim_nt/data/models/user_model/user_model.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class UserRepo {
  Future<List<UserModel>> getAllUserData() => ApiProvider.getAllUserData();
}
