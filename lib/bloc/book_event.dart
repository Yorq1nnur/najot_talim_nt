import 'package:equatable/equatable.dart';

import '../data/model/book_model.dart';
import '../data/model/category_model.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();
}

class CategoryBooks extends BookEvent {
  const CategoryBooks({required this.categoryModel, required this.books});

  final CategoryModel categoryModel;
  final List<BookModel> books;

  @override
  List<Object?> get props => [books];
}

class SearchBooks extends BookEvent {
  const SearchBooks({required this.searchBooks, required this.value});

  final String value;
  final List<BookModel> searchBooks;

  @override
  List<Object?> get props => [searchBooks];
}

class DownLoad extends BookEvent {
  const DownLoad({required this.bookModel});

  final BookModel bookModel;

  @override
  List<Object?> get props => [bookModel];
}
