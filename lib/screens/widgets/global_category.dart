import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../size/app_size.dart';

class GlobalCategory extends StatelessWidget {
  const GlobalCategory({
    super.key,
    required this.iconPath,
    required this.title,
    required this.moneyText,
  });

  final String iconPath;
  final String title;
  final String moneyText;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.getW()),
        color: Colors.white.withOpacity(0.4),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 18.getH(),
        horizontal: 18.getW(),
      ),
      margin: EdgeInsets.only(right: 14.getW()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 37.getW(),
            height: 37.getH(),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                height: 16.getH(),
              ),
            ),
          ),
          SizedBox(height: 14.getH()),
          Text(
            moneyText,
            style: TextStyle(
              color: const Color(0xFF151940),
              fontSize: 18.getW(),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color: const Color(0xFF898A8D),
              fontSize: 12.getW(),
            ),
          ),
        ],
      ),
    );
  }
}
