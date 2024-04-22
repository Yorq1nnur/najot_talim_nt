import '../models/books_model.dart';
import '../models/my_response.dart';
import '../network/api_provider.dart';

class BookRepo {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addNewBook(BooksModel productModel) =>
      ApiProvider.addNewBook(productModel);

  Future<MyResponse> deleteBook(String productUUID) =>
      ApiProvider.deleteBook(productUUID);

  Future<MyResponse> updateBook(BooksModel booksModel) =>
      ApiProvider.updateBook(booksModel);
}
