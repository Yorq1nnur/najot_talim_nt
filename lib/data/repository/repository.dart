import 'package:najot_talim_nt/data/models/network_response.dart';
import 'package:najot_talim_nt/data/network/api_prover.dart';

class ProductRepository{
  Future<NetworkResponse> getProductDataById(int id) => ApiProvider.fetchSingleProductData(id);
  Future<NetworkResponse> getProducts()=> ApiProvider.fetchProducts();
}

class CategoryRepository{
  Future<NetworkResponse> getCategories()=>ApiProvider.fetchCategories();
}