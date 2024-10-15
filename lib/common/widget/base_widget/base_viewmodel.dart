import 'package:get/get.dart';

abstract class BaseViewModel extends GetxController {
  final isLoading = false.obs;

  void routeBack() {
    Get.back();
  }
}