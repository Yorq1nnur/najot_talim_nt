import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (context, calculatorProvider, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 16.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 5.w,
          ),
          alignment: Alignment.bottomRight,
          child: Text(
            calculatorProvider.displayValue,
            style: TextStyle(
              fontSize: 48.sp,
            ),
          ),
        );
      },
    );
  }
}
