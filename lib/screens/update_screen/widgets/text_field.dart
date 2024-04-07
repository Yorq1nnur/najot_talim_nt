import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/book/book_model.dart';
import '../../../utils/colors/app_colors.dart';

class TextFieldItem extends StatefulWidget {
  const TextFieldItem({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.bookModel,
    required this.index,
  });

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final BookModel bookModel;
  final int index;

  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.h,
      ),
      child: TextField(
        // onTapAlwaysCalled: true,
        textInputAction: TextInputAction.next,
        controller: widget.controller,
        enabled: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              16.r,
            ),
            borderSide: const BorderSide(
              color: AppColors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.dispose();
  }
}
