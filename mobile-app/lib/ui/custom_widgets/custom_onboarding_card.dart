import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/styles.dart';
import '../../core/models/other_models/onboarding.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class CustomOnboardingCard extends StatelessWidget {
  final Onboarding? onboarding;
  CustomOnboardingCard({this.onboarding});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.white10),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(flex: 2),
          Image.asset(
            onboarding!.imgUrl!,
            // width: MediaQuery.of(context).size.width,
            height: 300.h,
            scale: 3.5,
          ),
          // SizedBox(height: 20.h),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            child: Text(
              onboarding!.title!,
              style: headingFont,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            child: Text(
              onboarding!.body!,
              style: bodyFont,
              textAlign: TextAlign.center,
            ),
          ),
          Spacer(
            flex: 6,
          ),
        ],
      ),
    );
  }
}
