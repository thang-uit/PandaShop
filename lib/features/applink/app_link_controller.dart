import 'package:app_links/app_links.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_viewmodel.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';
import 'package:panda_shop_app/utils/logging/logger.dart';

class AppLinkController extends BaseViewModel {
  final AppLinks appLinks = AppLinks();

  @override
  void onInit() {
    super.onInit();

    LoggerMan.debug("onInit DeeplinkController");

    handleInitialAppLink(); // Xử lý link khi app khởi động từ deeplink
    handleIncomingLinks(); // Lắng nghe link khi app đã mở
  }

  Future<void> handleInitialAppLink() async {
    final Uri? initialLink = await appLinks.getInitialLink();
    if (initialLink != null) {
      LoggerMan.debug("From getInitialLink");
      processLink(initialLink);
    }
  }

  void handleIncomingLinks() {
    appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        LoggerMan.debug("From uriLinkStream");
        processLink(uri);
      }
    });
  }

  void processLink(Uri? uri) {
    if (uri == null) {
      // Trường hợp uri rỗng, dừng xử lý
      return;
    }

    final AppLinkType appLinkType;

    // Kiểm tra nguồn của link
    if (uri.scheme == 'https' && uri.host == 'page.altek.com.vn') {
      appLinkType = AppLinkType.dynamicLink;
    } else if (uri.scheme == 'pandashop.app') {
      appLinkType = AppLinkType.deeplink;
    } else {
      // Không phải từ nguồn hợp lệ, dừng xử lý
      return;
    }

    LoggerMan.debug("appLinkType: ${appLinkType.name}");

    LoggerMan.debug("uri: ${uri.toString()}");

    // Lấy các tham số từ URL
    final Map<String, String> params =
        uri.queryParameters.isNotEmpty ? uri.queryParameters : {};
    LoggerMan.debug("params: $params");

    // Kiểm tra nếu có 'screen' và 'id' trong tham số
    if (params.containsKey('screen')) {
      final String? screen = params['screen'];

      // Kiểm tra giá trị của 'screen' và điều hướng
      if ('resetPassword' == screen) {
        final String id = params['id'] ?? "";

        Get.toNamed(AppRoutes.resetPassword, arguments: {'id': id});
      } else {
        LoggerMan.debug('Screen not recognized: $screen');
      }
    }
  }
}
