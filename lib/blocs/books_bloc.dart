import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:najot_talim_nt/blocs/books_state.dart';
import 'package:najot_talim_nt/data/repositories/books_repository.dart';
import 'package:najot_talim_nt/data/response/my_response.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.booksRepository})
      : super(BooksInitialState()) {
    on<GetBooksEvent>((event, emit) async {
      emit(BooksLoadingState());
      MyResponse myResponse = await booksRepository.getBooks();
      if (myResponse.errorText != '') {
        emit(BooksErrorState("Something went wrong"));
      } else {
        emit(
          BooksSuccessState(
            myResponse: myResponse.data,
          ),
        );
      }
    });
  }

  final BooksRepository booksRepository;
}
