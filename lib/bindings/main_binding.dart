import 'package:get/get.dart';
import 'package:panda_shop_app/features/main/controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());
  }
}
