import 'package:flutter/material.dart';
import '../../size/app_size.dart';

class CategoriesImg extends StatelessWidget {
  const CategoriesImg(
      {super.key,
      required this.color,
      required this.imgPath,
      required this.title});

  final Color color;
  final String imgPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: color,
            ),
            width: 55.getW(),
            height: 55.getH(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imgPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 3.getH()),
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.getW(),
            ),
          ),
        ],
      ),
    );
  }
}
