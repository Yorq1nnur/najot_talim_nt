
import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class UserRepository {
  Future<NetworkResponse> getUserDataById(int id) =>
      ApiProvider.fetchSingleUserData(id);

  Future<NetworkResponse> getAllUsers() => ApiProvider.fetchUsers();

}
