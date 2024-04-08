import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:najot_talim_nt/blocs/books_state.dart';
import 'package:najot_talim_nt/data/models/book/book_model.dart';
import 'package:najot_talim_nt/data/repositories/books_repository.dart';
import '../data/api_provider/api_provider.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepository, this.bookModel})
      : super(BooksInitialState()) {
    on<GetBooksEvent>(_getBooks);
    on<AddBookEvent>(_addBooks);
    on<DeleteBookEvent>(_deleteBooks);
    on<UpdateBookEvent>(_updateBooks);
  }

  BookModel? bookModel;
  final BooksRepository booksRepository;
}

Future<void> _getBooks(
  GetBooksEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());
  await Future.delayed(const Duration(seconds: 1));
  var response = await _booksRepository.getBooks();
  if (response.errorText.isNotEmpty) {
    emit(BooksErrorState(response.errorText));
  } else {
    if (event.categoryName == 'Hammasi' || event.categoryName == '') {
      emit(BooksSuccessState(books: response.data as List<BookModel>));
    } else {
      emit(
        BooksSuccessState(
            books: response.data
                .where(
                  (element) => element.categoryName == event.categoryName,
                )
                .toList() as List<BookModel>),
      );
    }
  }
}

Future<void> _addBooks(
  AddBookEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    var response = await _booksRepository.addNewBooks(event.bookModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _updateBooks(
  UpdateBookEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());

  try {
    var response = await _booksRepository.updateNewBooks(event.bookModel);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

Future<void> _deleteBooks(
  DeleteBookEvent event,
  Emitter<BooksState> emit,
) async {
  try {
    var response = await _booksRepository.deleteBooks(event.uuid);

    if (response.errorText.isNotEmpty) {
      emit(BooksErrorState(response.errorText));
    }
  } catch (error) {
    emit(BooksErrorState(error.toString()));
  }
}

ApiProvider _apiProvider = ApiProvider();

BooksRepository _booksRepository = BooksRepository(
  apiProvider: _apiProvider,
);
