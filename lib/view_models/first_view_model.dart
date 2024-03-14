import 'package:flutter/cupertino.dart';
import 'package:najot_talim_nt/data/models/first_model/first_model.dart';
import 'package:najot_talim_nt/data/repositories/first_repo.dart';

class FirstViewModel extends ChangeNotifier {
  FirstViewModel({
    required this.firstRepo,
  }){
    fetchFirstData();
  }

  final FirstRepo firstRepo;

  bool isLoading = false;
  List<FirstModel> currencies = [];

  fetchFirstData() async {
    isLoading = true;
    notifyListeners();
    var cur = await firstRepo.getAllData();
    isLoading = false;
    notifyListeners();
      currencies = cur;
      notifyListeners();
  }
}
