import 'package:get/get.dart';
import 'package:panda_shop_app/features/authentication/controllers/create_acc_success_controller.dart';

class SuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessController());
  }
}
