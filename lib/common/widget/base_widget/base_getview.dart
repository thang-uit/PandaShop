import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/helpers/helper_functions.dart';

abstract class BaseGetView<T> extends GetView<T> {
  const BaseGetView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = HelperFunctions.isDarkMode(context);
    Color colorThemeMode =
        isDarkMode ? ConstantColors.light : ConstantColors.dark;

    return buildGetWidget(context, isDarkMode, colorThemeMode);
  }

  @protected
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode);
}
