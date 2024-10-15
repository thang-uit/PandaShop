import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAllNamed(AppRoutes.login);
    } else {
      currentPageIndex.value = currentPageIndex.value + 1;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
