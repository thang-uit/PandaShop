import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/features/shop/screens/home/home.dart';
import 'package:panda_shop_app/features/shop/screens/store/store.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class MainScreen extends BaseStatelessWidget {
  const MainScreen({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    final controller = Get.put(NavigationController());

    return BaseScaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor:
              isDarkMode ? ConstantColors.backgroundDark2 : ConstantColors.softGrey,
          indicatorColor: isDarkMode
              ? ConstantColors.white.withOpacity(0.1)
              : ConstantColors.black.withOpacity(0.1),
          elevation: 0,
          selectedIndex: controller.currentPageIndex.value,
          onDestinationSelected: (index) =>
              controller.currentPageIndex.value = index,
          destinations: const [
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.house),
                label: ConstantTexts.tabHome),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.store),
                label: ConstantTexts.tabStore),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.solidHeart),
                label: ConstantTexts.tabWishlist),
            NavigationDestination(
                icon: FaIcon(FontAwesomeIcons.solidCircleUser),
                label: ConstantTexts.tabProfile)
          ],
        ),
      ),
      body: Obx(() => controller.listScreen[controller.currentPageIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt currentPageIndex = 0.obs;

  final listScreen = [
    HomeScreen(),
    StoreScreen(),
    Container(color: ConstantColors.white),
    Container(color: ConstantColors.white),
  ];
}
