// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:najot_talim_nt/data/models/user_model/user_model.dart';
import 'package:najot_talim_nt/data/repositories/country_repo.dart';
import 'package:najot_talim_nt/data/repositories/user_repo.dart';

class SecondViewModel extends ChangeNotifier {
  SecondViewModel({
    required this.userRepo,
  }){
    fetchUsersData();
  }

  final UserRepo userRepo;

  bool isLoading = false;
  List<UserModel> users = [];

  fetchUsersData() async {
    isLoading = true;
    notifyListeners();
    List<UserModel> user = await userRepo.getAllUserData();
    isLoading = false;
    notifyListeners();
      users = user;
      notifyListeners();
  }
}
