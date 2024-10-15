import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/helpers/helper_functions.dart';

abstract class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = HelperFunctions.isDarkMode(context);
    Color colorThemeMode =
        isDarkMode ? ConstantColors.light : ConstantColors.dark;

    return buildWidget(context, isDarkMode, colorThemeMode);
  }

  @protected
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode);
}
