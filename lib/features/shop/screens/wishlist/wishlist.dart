import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_screen.dart';
import 'package:panda_shop_app/common/widget/list/common_page_list.dart';
import 'package:panda_shop_app/common/widget/product/product_item_test.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/data/model/photo.dart';
import 'package:panda_shop_app/features/shop/controllers/wishlist_controller.dart';
import 'package:panda_shop_app/features/shop/screens/home/widgets/cart_counter.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';
import 'package:panda_shop_app/utils/logging/logger.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WishlistScreen extends BaseScreen<WishlistController> {
  const WishlistScreen({super.key});

  @override
  Widget buildScreen(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(
        title: Text(ConstantTexts.tabWishlist,
            style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          CartCounter(
            onPressed: () {},
            padding: EdgeInsets.only(right: 10.0),
          )
        ],
      ),
      body: CommonPagedList<Photo>(
          pagingController: vm.pagingController,
          itemBuilder: (context, item, index) => ProductItemCardTest(
                photo: item,
                onTap: () => {},
                onTapAdd: () async {
                  // SnackBarUtil.show(item.title, type: ToastType.info)

                  String deeplink =
                      "pandashop.app://data?screen=resetPassword&id=${item.id}";

                  if (await canLaunchUrlString(deeplink)) {
                    await launchUrlString(deeplink);
                  } else {
                    LoggerMan.debug("Could not launch deeplink");
                  }
                },
              )),
    );
  }
}
