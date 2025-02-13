import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';

abstract class BaseScreen<T extends GetxController> extends BaseGetView<T> {
  const BaseScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    if (!vm.initialized) {
      initViewModel();
    }

    return buildScreen(context, isDarkMode, colorThemeMode);
  }

  @protected
  Widget buildScreen(
      BuildContext context, bool isDarkMode, Color colorThemeMode);

  @protected
  void initViewModel() {
    vm.initialized;
  }

  @protected
  T get vm => controller;
}
