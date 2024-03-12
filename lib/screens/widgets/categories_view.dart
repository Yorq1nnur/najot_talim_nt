import 'package:flutter/material.dart';
import 'package:najot_talim_nt/size/app_size.dart';

class CategoriesView extends SliverPersistentHeaderDelegate {
  CategoriesView({
    required this.widget,
  });

  final Widget widget;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return widget;
  }

  @override
  double get maxExtent => 80.getH();

  @override
  double get minExtent => 80.getH();

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
