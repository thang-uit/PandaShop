import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/verify_email_controller.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyEmailController());
  }
}
