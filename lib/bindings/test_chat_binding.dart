import 'package:get/get.dart';
import 'package:panda_shop_app/features/main/controllers/test_chat_controller.dart';

class TestChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestChatController());
  }
}
