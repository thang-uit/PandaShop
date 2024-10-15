import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
