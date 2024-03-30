import 'package:najot_talim_nt/data/models/place_model.dart';
import '../api_provider/api_provider.dart';
import '../my_response.dart';

class AddressRepo {
  static Future<MyResponse> getAllAddress() => ApiProvider.getAllAddresses();

  static Future<PlaceModel> addNewBook(PlaceModel placeModel) =>
      ApiProvider.addNewAddress(placeModel);

  static Future<MyResponse> deleteBook(String productUUID) =>
      ApiProvider.deleteAddress(productUUID);

  static Future<MyResponse> updateBook(PlaceModel placeModel) =>
      ApiProvider.updateAddress(placeModel);
}
