import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../data/models/books_model.dart';
import '../data/models/my_response.dart';
import '../data/repositories/book_repo.dart';

class BookViewModel extends ChangeNotifier {
  List<BooksModel> allBooks = [];
  List<BooksModel> categoryBook = [];

  String statusText = "";

  bool isLoading = false;

  BookViewModel({required this.bookRepo}) {
    getAllBooks();
  }

  final BookRepo bookRepo;

  Future<void> getAllBooks() async {
    _notify(true);
    MyResponse myResponse = await bookRepo.getAllBooks();
    _notify(false);
    if (myResponse.errorText.isEmpty) {
      allBooks = myResponse.data as List<BooksModel>;
      categoryBook = allBooks;
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> addBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.addNewBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> updateBook(BooksModel bookModel) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.updateBook(bookModel);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> deleteBook({required String bookUUID}) async {
    _notify(true);
    MyResponse myResponse = await bookRepo.deleteBook(bookUUID);
    _notify(false);

    if (myResponse.errorText.isEmpty) {
      statusText = myResponse.data as String;
      getAllBooks();
    } else {
      statusText = myResponse.errorText;
    }
  }

  Future<void> getCategoriesBook({required String name}) async {
    if (name.isNotEmpty) {
      if (name != 'All') {
        categoryBook =
            allBooks.where((element) => element.categoryName == name).toList();
      } else {
        categoryBook = allBooks;
      }
      notifyListeners();
    }
  }

  _notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
