import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
