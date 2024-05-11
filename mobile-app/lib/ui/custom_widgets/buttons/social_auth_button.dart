import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';

class SocialAuthButton extends StatelessWidget {
  final text;
  final onPressed;
  final icon;

  SocialAuthButton({this.onPressed, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: lightGreyColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // width: 50,
              child: Image.asset(
                icon,
                scale: 3,
              ),
            ),
            SizedBox(width: 20.w),
            Flexible(
              child: Text(
                "$text",
                style: bodyFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
