import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/blocs/books_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:najot_talim_nt/blocs/books_state.dart';
import 'package:najot_talim_nt/data/models/book/book_model.dart';
import 'package:najot_talim_nt/screens/detail/detail_screen.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/book_item.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/styles/app_text_style.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: AppColors.transparent),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'BOOKS',
              style: AppTextStyle.interBold,
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  BookModel bookModel = BookModel(
                    bookName: 'OQSHOM ERTAKLARI',
                    author: 'YUSUF BOBO',
                    categoryName: 'ERTAKLAR',
                    description: 'BU AJOYIB ERTAK',
                    imageUrl:
                        'https://kitoblardunyosi.uz/image/cache/catalog/001-Kitoblar/003_boshqalar/003_bolalar/2023/oqshom-ertaklari5-web-550x550h.jpg',
                    price: '25000',
                    rate: '4.5',
                  );
                  context.read<BooksBloc>().add(
                        AddBookEvent(
                          bookModel: bookModel,
                        ),
                      );
                  context.read<BooksBloc>().add(
                        GetBooksEvent(),
                      );
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 20.w,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
            ],
          ),
          body: BlocConsumer<BooksBloc, BooksState>(
              builder: (context, state) {
                if (state is BooksLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is BooksErrorState) {
                  return Center(
                    child: Text(state.errorText),
                  );
                }

                if (state is BooksSuccessState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      return Future<void>.delayed(
                        const Duration(
                          seconds: 2,
                        ),
                        () {
                          context.read<BooksBloc>().add(
                                GetBooksEvent(),
                              );
                        },
                      );
                    },
                    child: GridView.count(
                      physics: const BouncingScrollPhysics(),
                      primary: false,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 20.h,
                      ),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 0.45,
                      children: List.generate(state.books.length, (index) {
                        BookModel book = state.books[index];
                        return BookItem(
                          onLongTap: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: AppColors.white,
                                  title: const Text("Ishonchingiz komilmi?"),
                                  titleTextStyle:
                                      AppTextStyle.interBold.copyWith(
                                    color: AppColors.black,
                                    fontSize: 20.sp,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        context.read<BooksBloc>().add(
                                              DeleteBookEvent(
                                                uuid: book.uuid!,
                                              ),
                                            );
                                        Navigator.pop(context);
                                        context.read<BooksBloc>().add(
                                              GetBooksEvent(),
                                            );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                            content: Text(
                                              textAlign: TextAlign.center,
                                              'BOOK DELETED SUCCESSFULLY!!!',
                                              style: AppTextStyle.interBold
                                                  .copyWith(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Yes',
                                        style: AppTextStyle.interBold.copyWith(
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'No',
                                        style: AppTextStyle.interBold
                                            .copyWith(color: AppColors.black),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          linkPicture: book.imageUrl,
                          bookName: book.bookName,
                          author: book.author,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  bookModel: book,
                                ),
                              ),
                            );
                          },
                          categoryName: book.categoryName,
                          rate: book.rate,
                          price: book.price,
                        );
                      }),
                    ),
                  );
                }
                return const Center(child: Text("INITIAL"));
              },
              listener: (context, state) {})),
    );
  }
}
