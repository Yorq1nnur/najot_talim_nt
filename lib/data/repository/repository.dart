import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/network/api_provider.dart';

class ProductRepository{
  Future<NetworkResponse> getProductDataById(int id) => ApiProvider.singleProductFetchData(id);
  Future<NetworkResponse> getProducts()=> ApiProvider.productsFetch();
}

class CategoryRepository{
  Future<NetworkResponse> getCategories()=>ApiProvider.fetchCategories();
}