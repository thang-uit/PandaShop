import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
