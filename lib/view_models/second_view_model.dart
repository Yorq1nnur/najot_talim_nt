// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/models/second_model/second_model.dart';
import 'package:najot_talim_nt/data/repositories/first_repo.dart';
import 'package:najot_talim_nt/data/repositories/second_repo.dart';

class SecondViewModel extends ChangeNotifier {
  SecondViewModel({
    required this.secondRepo,
  }){
    fetchSecondData();
  }

  final SecondRepo secondRepo;

  bool isLoading = false;
  List<SecondModel> currencies = [];

  fetchSecondData() async {
    isLoading = true;
    notifyListeners();
    var cur = await secondRepo.getAllUserData();
    isLoading = false;
    notifyListeners();
      currencies = cur;
      notifyListeners();
  }
}
