import 'package:najot_talim_nt/data/models/book/book_model.dart';

abstract class BooksEvent {}

class GetBooksEvent extends BooksEvent {
  String categoryName;
  GetBooksEvent({ this.categoryName = ''});
}

class AddBookEvent extends BooksEvent {
  final BookModel bookModel;

  AddBookEvent({required this.bookModel});
}

class UpdateBookEvent extends BooksEvent {
  final BookModel bookModel;

  UpdateBookEvent({required this.bookModel});
}

class DeleteBookEvent extends BooksEvent {
  final String uuid;

  DeleteBookEvent({
    required this.uuid,
  });
}
