import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/blocs/books_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:provider/provider.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../data/models/book/book_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  List<String> changeData = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    const TextInputType bookNameType = TextInputType.text;
    const TextInputType authorType = TextInputType.text;
    const TextInputType categoryType = TextInputType.text;
    const TextInputType descriptionType = TextInputType.text;
    const TextInputType imageUrlType = TextInputType.text;
    const TextInputType priceType = TextInputType.number;
    const TextInputType rateType = TextInputType.number;
    List<String> oldBook = [
      widget.bookModel.bookName,
      widget.bookModel.author,
      widget.bookModel.categoryName,
      widget.bookModel.description,
      widget.bookModel.imageUrl,
      widget.bookModel.price.toString(),
      widget.bookModel.rate.toString(),
    ];
    const List<TextInputType> textInputTypesData = [
      bookNameType,
      authorType,
      categoryType,
      descriptionType,
      imageUrlType,
      priceType,
      rateType,
    ];

    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.white,
          title: Text(
            "Update book",
            style: AppTextStyle.interBold.copyWith(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(
                        oldBook.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                            ),
                            child: TextField(
                              textInputAction: index == 6
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              readOnly: false,
                              enabled: true,
                              maxLines: 1,
                              onChanged: (value) {
                                changeData[index] = value;
                              },
                              onSubmitted: (v) {
                                changeData[index] = v;
                                if (kDebugMode) {
                                  print("Current: ${oldBook[index]}");
                                }
                              },
                              keyboardType: textInputTypesData[index],
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(16),
                                hintText: oldBook[index],
                                hintStyle: AppTextStyle.interMedium,
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  ),
                                ),
                                disabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.blue,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ZoomTapAnimation(
                        onTap: () async {
                          BookModel book = BookModel(
                            bookName: changeData[0] == ''
                                ? widget.bookModel.bookName
                                : changeData[0],
                            author: changeData[1] == ''
                                ? widget.bookModel.author
                                : changeData[1],
                            categoryName: changeData[2] == ''
                                ? widget.bookModel.categoryName
                                : changeData[2],
                            description: changeData[3] == ''
                                ? widget.bookModel.description
                                : changeData[3],
                            imageUrl: changeData[4] == ''
                                ? widget.bookModel.imageUrl
                                : changeData[4],
                            price: changeData[5] == ''
                                ? widget.bookModel.price
                                : changeData[5],
                            rate: changeData[6] == ''
                                ? widget.bookModel.rate
                                : changeData[6],
                            uuid: widget.bookModel.uuid,
                          );
                          context
                              .read<BooksBloc>()
                              .add(AddBookEvent(bookModel: book));
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "SUCCESS",
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.lightBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }

                          if (context.mounted) {
                            context.read<BooksBloc>().add(
                                  GetBooksEvent(),
                                );
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(
                              16.r,
                            ),
                          ),
                          child: Text(
                            "SAQLASH",
                            style: AppTextStyle.interBold.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
