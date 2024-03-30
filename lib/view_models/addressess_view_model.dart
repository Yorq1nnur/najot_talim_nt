import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:najot_talim_nt/data/local/address_repository.dart';
import 'package:najot_talim_nt/data/my_response.dart';

import '../data/models/place_model.dart';

class AddressesViewModel extends ChangeNotifier {
  AddressesViewModel() {
    myAddresses = []; //Read Addresses from Local Database or Firebase
  }

  List<MyResponse> myAddresses = [];

  Future<void> readAllAddresses() async{
    _notify(true);
    myAddresses = await AddressRepo.getAllAddress() as List<MyResponse>;
    _notify(false);
  }

  bool _isLoading = false;

  bool get getLoader => _isLoading;

  addNewAddress({required PlaceModel placeModel}) async {
    myAddresses.add(placeModel as MyResponse);
    notifyListeners();
    AddressRepo.addNewBook(placeModel);
    notifyListeners();
  }

  deleteAddress({required String id}){
    _notify(true);
    AddressRepo.deleteBook(id);
    _notify(false);
  }

  updateAddress({required PlaceModel placeModel}){
    _notify(true);
    AddressRepo.updateBook(placeModel);
    _notify(false);
  }






  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}
