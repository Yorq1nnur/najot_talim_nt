import 'package:flutter/cupertino.dart';
import 'package:najot_talim_nt/data/models/country_model/country_model.dart';
import 'package:najot_talim_nt/data/repositories/country_repo.dart';

class CountryViewModel extends ChangeNotifier {
  CountryViewModel({
    required this.countryRepo,
  }){
    fetchFirstData();
  }

  final CountryRepo countryRepo;

  bool isLoading = false;
  List<CountryModel> countries = [];

  fetchFirstData() async {
    isLoading = true;
    notifyListeners();
    List<CountryModel> country = await countryRepo.getAllData();
    isLoading = false;
    notifyListeners();
      countries = country;
      notifyListeners();
  }
}
