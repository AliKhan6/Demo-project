import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import '../../../core/constants/strings.dart';
import '../../../core/models/other_models/onboarding.dart';
import '../../../core/others/base_view_model.dart';

class OnboardingViewModel extends BaseViewModel {
  final Logger log = Logger();
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;
  List<Onboarding> onboardingList = [
    Onboarding(
      title: "Lorem Ipsum Dolar",
      body:
          "Lectus in ut fames hac placerat. Viverra arcu sed mauris, pulvinar ut. Odio nibh urna proin a.",
      imgUrl: "$dynamicAssets/onboarding_image_01.png",
    ),
    Onboarding(
      title: "Lorem Ipsum Dolar 02",
      body:
          "Lectus in ut fames hac placerat. Viverra arcu sed mauris, pulvinar ut. Odio nibh urna proin a.",
      imgUrl: "$dynamicAssets/onboarding_image_02.png",
    ),
    Onboarding(
      title: "Lorem Ipsum Dolar 03",
      body:
          "Lectus in ut fames hac placerat. Viverra arcu sed mauris, pulvinar ut. Odio nibh urna proin a.",
      imgUrl: "$dynamicAssets/onboarding_image_03.png",
    ),
  ];
  // final _localStorageService = locator<LocalStorageService>();
  // late CarouselController controller = CarouselController();
  // OnboardingViewModel() {}

  // OnboardingViewModel(this.currentPageIndex, this.onboardingList);

  updatePage(index) {
    log.d('@updateOnboarding page with index: $index');
    currentPageIndex = index;
    // _localStorageService.onBoardingPageCount = index;
    notifyListeners();
  }

  updatePageFromButton() {
    // pageController.page
    currentPageIndex++;
    pageController.animateToPage(
      currentPageIndex,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
    // _localStorageService.onBoardingPageCount = index;
    notifyListeners();
  }
}
