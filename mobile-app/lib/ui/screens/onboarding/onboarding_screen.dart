import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../custom_widgets/buttons/arrow_button.dart';
import '../../custom_widgets/custom_onboarding_card.dart';
import '../auth_signup/login/login_screen.dart';
import 'onboarding_view_model.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Scaffold(
        body: Consumer<OnboardingViewModel>(
          builder: (context, model, child) {
            return Stack(
              children: [
                ///
                /// Onboarding screen
                ///
                Container(
                  child: PageView.builder(
                    controller: model.pageController,
                    itemCount: model.onboardingList.length,
                    itemBuilder: (context, index) {
                      return CustomOnboardingCard(
                        onboarding: model.onboardingList[index],
                      );
                    },
                    onPageChanged: (value) {
                      model.updatePage(value);
                    },
                  ),
                ),

                ///
                /// Dots indicator and buttons
                ///
                Align(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            ///
                            /// dots
                            ///
                            DotsIndicator(
                              dotsCount: model.onboardingList.length,
                              position: model.currentPageIndex.toDouble(),
                              decorator: DotsDecorator(
                                color: Colors.grey,
                                activeColor: primaryColor,
                                size: Size(12.0, 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                activeSize: Size(12.0, 12.0),
                                activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            ///
                            /// bottom button and skip
                            ///
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(LoginScreen());
                                    },
                                    child: Text(
                                      "Skip",
                                      style: bodyFont.copyWith(
                                        // color: orangeColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  // ArrowButton(
                                  //   onPressed: () {
                                  //     if (model.currentPageIndex <
                                  //         model.onboardingList.length - 1) {
                                  //       model.updatePageFromButton();
                                  //     } else {
                                  //       Get.to(LoginScreen());
                                  //     }
                                  //   },
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
