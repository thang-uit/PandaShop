import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/forget_password_controller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}
