import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/blocs/books_bloc.dart';
import 'package:najot_talim_nt/blocs/books_event.dart';
import 'package:najot_talim_nt/data/models/book/book_model.dart';
import 'package:najot_talim_nt/screens/global_screen/widgets/category_button.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../data/book_item_info/add_book_titles/add_book_titles.dart';
import '../../data/book_item_info/categories_list/categories_list.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({
    super.key,
  });

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

List<String> newBook = [
  "",
  "",
  "",
  "",
  "",
  "",
];

String categoryName = '';
bool selectCategory = false;

const List<TextInputType> textInputTypesData = [
  bookNameType,
  authorType,
  descriptionType,
  imageUrlType,
  priceType,
  rateType,
];
int activeIndex = -1;
bool isValid = false;
const TextInputType bookNameType = TextInputType.text;
const TextInputType authorType = TextInputType.text;
const TextInputType descriptionType = TextInputType.text;
const TextInputType imageUrlType = TextInputType.text;
const TextInputType priceType = TextInputType.number;
const TextInputType rateType = TextInputType.number;

class _AddBookScreenState extends State<AddBookScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              AppImages.back,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 2.w,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          activeIndex = -1;
                          selectCategory = false;
                          categoryName = '';
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 20.w,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                      ),
                      Text(
                        "Add book",
                        style: AppTextStyle.interBold.copyWith(
                          color: AppColors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        ...List.generate(
                          titles.length,
                          (index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10.h,
                                horizontal: 20.w,
                              ),
                              child: TextField(
                                textInputAction: index == 5
                                    ? TextInputAction.done
                                    : TextInputAction.next,
                                maxLines: 1,
                                onChanged: (value) {
                                  newBook[index] = value;
                                },
                                onSubmitted: (v) {
                                  newBook[index] = v;
                                  if (kDebugMode) {
                                    print("Current: ${newBook[index]}");
                                  }
                                },
                                keyboardType: textInputTypesData[index],
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(16),
                                  hintText: titles[index],
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
                        Center(
                          child: selectCategory != true
                              ? Text(
                                  'ILTIMOS, CATEGORIYANI TANLANG!!!',
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.black,
                                  ),
                                )
                              : Text(
                                  'TANLANGAN CATEGORIYA: $categoryName',
                                  style: AppTextStyle.interBold.copyWith(
                                    color: Colors.blue,
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ...List.generate(
                                addCategoriesList.length,
                                (index) => CategoryButton(
                                  title: addCategoriesList[index],
                                  onTap: () {
                                    activeIndex = index;
                                    selectCategory = true;
                                    setState(() {});
                                    categoryName = addCategoriesList[index];
                                  },
                                  isActive: activeIndex == index,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ZoomTapAnimation(
                    onTap: () async {
                      Future.delayed(
                        const Duration(
                          seconds: 3,
                        ),
                      );
                      for (int i = 0; i < titles.length; i++) {
                        if (newBook[i].isEmpty || categoryName == '') {
                          isValid = false;
                        } else {
                          isValid = true;
                        }
                        if (kDebugMode) {
                          print(
                            "==================================${newBook[i]}\n",
                          );
                        }
                      }

                      if (isValid == true) {
                        BookModel book = BookModel(
                          bookName: newBook[0],
                          author: newBook[1],
                          categoryName: categoryName,
                          description: newBook[2],
                          imageUrl: newBook[3],
                          price: newBook[4],
                          rate: newBook[5],
                        );
                        context.read<BooksBloc>().add(
                              AddBookEvent(
                                bookModel: book,
                              ),
                            );
                        Navigator.pop(context);
                        context.read<BooksBloc>().add(
                              GetBooksEvent(),
                            );
                        selectCategory = false;
                        categoryName = '';
                        activeIndex = -1;
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
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "You didn't fill in some line!!!",
                              style: AppTextStyle.interBold.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        );
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
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
