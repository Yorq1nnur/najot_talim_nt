import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:najot_talim_nt/blocs/books_state.dart';
import 'package:najot_talim_nt/data/models/book/book_model.dart';
import 'package:najot_talim_nt/data/repositories/books_repository.dart';
import '../data/api_provider/api_provider.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepository}) : super(BooksInitialState()) {
    on<GetBooksEvent>(_getBooks);
  }

  final BooksRepository booksRepository;
}

Future<void> _getBooks(
  GetBooksEvent event,
  Emitter<BooksState> emit,
) async {
  emit(BooksLoadingState());
  await Future.delayed(const Duration(seconds: 3));
  ApiProvider apiProvider = ApiProvider();
  BooksRepository booksRepository = BooksRepository(
    apiProvider: apiProvider,
  );
  var response = await booksRepository.getBooks();
  if (response.errorText.isNotEmpty) {
    emit(BooksErrorState(response.errorText));
  } else {
    emit(BooksSuccessState(books: response.data as List<BookModel>));
  }
}
