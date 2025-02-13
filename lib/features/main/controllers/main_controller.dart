import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_viewmodel.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';

class MainController extends BaseViewModel {
  static MainController get instance => Get.find();

  final RxInt currentPageIndex = 0.obs;

  void handleDeeplinkBruh(String id) {
    SnackBarUtil.show(id);
  }
}
