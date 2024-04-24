import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/bloc/book_bloc.dart';
import 'package:najot_talim_nt/bloc/book_event.dart';
import 'package:najot_talim_nt/bloc/book_state.dart';
import 'package:najot_talim_nt/data/local/local_variables.dart';
import 'package:najot_talim_nt/data/model/category_model.dart';
import 'package:najot_talim_nt/screens/book/widgets/book_item.dart';
import 'package:najot_talim_nt/screens/book/widgets/wrap_item.dart';
import 'package:najot_talim_nt/utils/colors/app_colors.dart';
import 'package:najot_talim_nt/utils/size/size_utils.dart';
import 'package:open_filex/open_filex.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({super.key});

  @override
  State<BookScreen> createState() => _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  String categoryString = "all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          debugPrint("CURRENT MB: ${state.progress}");
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.getH(),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 29.w),
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w, vertical: 5.h),
                child: Text(
                  "The World of books",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              22.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: TextField(
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textInputAction: TextInputAction.next,
                  onChanged: (v) {
                    context
                        .read<BookBloc>()
                        .add(SearchBooks(searchBooks: books, value: v));
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Icon(
                        Icons.search,
                        color: AppColors.c_29BB89,
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                ),
              ),
              15.getH(),
              //save
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 33.w),
                child: Text(
                  "Category",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              11.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.h),
                child: Wrap(
                  spacing: 11,
                  children: [
                    ...List.generate(
                      CategoryModel.values.length,
                      (index) => WrapItem(
                        title: CategoryModel.values[index].name,
                        onTap: () {
                          context.read<BookBloc>().add(
                                CategoryBooks(
                                  categoryModel: CategoryModel.values[index],
                                  books: books,
                                ),
                              );
                          categoryString = CategoryModel.values[index].name;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              30.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 29.w),
                child: Text(
                  "$categoryString books",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  child: GridView.count(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.symmetric(
                      horizontal: 25.w,
                      vertical: 25.h,
                    ),
                    mainAxisSpacing: 10.h,
                    crossAxisSpacing: 15.w,
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    children: [
                      ...List.generate(
                        context.read<BookBloc>().state.books.length,
                        (index) {
                          BookBloc fileManagerBloc = BookBloc();
                          return BookItem(
                            image: context
                                .read<BookBloc>()
                                .state
                                .books[index]
                                .imagePath,
                            bookName: context
                                .read<BookBloc>()
                                .state
                                .books[index]
                                .bookName,
                            newFileLocation: state.newFileLocation,
                            onTap: () async {
                              if (state.newFileLocation.isEmpty) {
                                fileManagerBloc.add(
                                  DownLoad(
                                    bookModel: context
                                        .read<BookBloc>()
                                        .state
                                        .books[index],
                                  ),
                                );
                              } else {
                                await OpenFilex.open(state.newFileLocation);
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// Column(
//   children: [
//     ...List.generate(
//       context.read<BookBloc>().state.searchBooks.length - 5,
//       (index) {
//         BookBloc fileManagerBloc = BookBloc();
//         return BookItem(
//           image: context
//               .read<BookBloc>()
//               .state
//               .searchBooks[index]
//               .imagePath,
//           bookName: context
//               .read<BookBloc>()
//               .state
//               .searchBooks[index]
//               .bookName,
//           newFileLocation: state.newFileLocation,
//           onTap: () async {
//             if (state.newFileLocation.isEmpty) {
//               fileManagerBloc.add(
//                 DownLoad(
//                   bookModel: context
//                       .read<BookBloc>()
//                       .state
//                       .searchBooks[index],
//                 ),
//               );
//             } else {
//               await OpenFilex.open(state.newFileLocation);
//             }
//           },
//         );
//       },
//     ),
//   ],
// ),
// 29.getH(),
