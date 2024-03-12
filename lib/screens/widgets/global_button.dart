import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../size/app_size.dart';

class GlobalButton extends StatefulWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.activeIndex,
    required this.price,
  });

  final VoidCallback onTap;
  final bool activeIndex;
  final int price;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.getW()),
          color: widget.activeIndex ? Colors.blue : Colors.white,
        ),
        padding:
            EdgeInsets.symmetric(horizontal: 10.getW(), vertical: 8.getH()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10.getW(),
              height: 10.getH(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.activeIndex == true
                    ? Colors.white
                    : const Color(0xFF7F8192),
              ),
            ),
            SizedBox(width: 8.getW()),
            Text(
              "Payments | \$ ${widget.price}",
              style: TextStyle(
                color:
                    widget.activeIndex ? Colors.white : const Color(0xFF7F8192),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
