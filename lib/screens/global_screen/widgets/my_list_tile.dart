import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingText,
  });

  final String title;
  final String subtitle;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: ListTile(
        title: Text(title),
        trailing: Text(trailingText),
        subtitle: Text(
          subtitle,
        ),
      ),
    );
  }
}
