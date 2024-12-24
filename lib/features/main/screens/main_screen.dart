import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_screen.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/features/main/controllers/main_controller.dart';
import 'package:panda_shop_app/features/shop/screens/home/home.dart';
import 'package:panda_shop_app/features/shop/screens/store/store.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class MainScreen extends BaseScreen<MainController> {
  const MainScreen({super.key});

  @override
  Widget buildScreen(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: isDarkMode
              ? ConstantColors.backgroundDark2
              : ConstantColors.softGrey,
          indicatorColor: isDarkMode
              ? ConstantColors.white.withOpacity(0.1)
              : ConstantColors.black.withOpacity(0.1),
          elevation: 0,
          selectedIndex: vm.currentPageIndex.value,
          onDestinationSelected: (index) => vm.currentPageIndex.value = index,
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
      body: Obx(() => vm.listScreen[vm.currentPageIndex.value]),
    );
  }
}
