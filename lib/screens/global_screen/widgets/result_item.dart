import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot_talim_nt/view_models/calculator_view_model.dart';
import 'package:provider/provider.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CalculatorViewModel>(
      builder: (
        context,
        calculatorViewModel,
        _,
      ) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          child: Text(
            calculatorViewModel.displayValue.contains(".0")
                ? (double.parse(calculatorViewModel.displayValue).toInt(),)
                    .toString()
                : calculatorViewModel.displayValue,
            style: TextStyle(
              fontSize: 35.sp,
            ),
            maxLines: 5,
            overflow: TextOverflow.fade,
            textAlign: TextAlign.right,
            // softWrap: true,
          ),
        );
      },
    );
  }
}
