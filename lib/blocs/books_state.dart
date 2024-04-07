import 'package:najot_talim_nt/data/models/book/book_model.dart';

abstract class BooksState {}

class BooksSuccessState extends BooksState {
  final List<BookModel> books;

  BooksSuccessState({required this.books});
}

class BooksInitialState extends BooksState {}

class BooksLoadingState extends BooksState {}

class BooksErrorState extends BooksState {
  final String errorText;

  BooksErrorState(this.errorText);
}
