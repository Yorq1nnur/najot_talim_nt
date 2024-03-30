import 'package:najot_talim_nt/data/models/place_model.dart';

import '../api_provider/api_provider.dart';
import '../my_response.dart';

class BookRepo {
  Future<MyResponse> getAllAddress() => ApiProvider.getAllAddresses();

  Future<MyResponse> addNewBook(PlaceModel placeModel) =>
      ApiProvider.addNewAddress(placeModel);

  Future<MyResponse> deleteBook(String productUUID) =>
      ApiProvider.deleteAddress(productUUID);

  Future<MyResponse> updateBook(PlaceModel placeModel) =>
      ApiProvider.updateAddress(placeModel);
}
