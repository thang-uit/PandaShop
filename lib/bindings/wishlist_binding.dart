import 'package:get/get.dart';
import 'package:panda_shop_app/features/shop/controllers/wishlist_controller.dart';

class WishListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WishlistController());
  }
}
