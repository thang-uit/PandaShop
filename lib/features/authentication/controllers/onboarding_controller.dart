import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_viewmodel.dart';
import 'package:panda_shop_app/utils/constant/storage_keys.dart';
import 'package:panda_shop_app/utils/local_storage/storage_utility.dart';
import 'package:panda_shop_app/utils/logging/logger.dart';

class OnBoardingController extends BaseViewModel {
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;
  final LocalStorage localStorage = LocalStorage();

  @override
  void onInit() {
    super.onInit();

    checkIfOnboardingCompleted();
  }

  Future<void> checkIfOnboardingCompleted() async {
    try {
      final isOnboardingCompleted =
          await localStorage.getData<bool>(StorageKeys.keyShowOnboarding) ??
              false;
      if (isOnboardingCompleted) {
        goToLogin();
      }
    } catch (e) {
      LoggerMan.debug('Error reading onboarding status: $e');
    }
  }

  void updatePageIndicator(index) => currentPageIndex.value = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Future<void> nextPage() async {
    if (currentPageIndex.value >= 2) {
      await localStorage.saveData(StorageKeys.keyShowOnboarding, true);
      goToLogin();
    } else {
      currentPageIndex.value++;
      pageController.jumpToPage(currentPageIndex.value);
    }
  }

  Future<void> skipPage() async {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void goToLogin() {
    Get.offAllNamed(AppRoutes.login);
  }
}
