import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/onboarding_controller.dart';

class OnBoardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnBoardingController());
  }
}
