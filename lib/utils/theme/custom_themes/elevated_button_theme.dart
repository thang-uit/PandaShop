import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class TElevateButtonTheme {
  TElevateButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 2,
    foregroundColor: ConstantColors.white,
    backgroundColor: ConstantColors.primary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: ConstantColors.primary),
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: const TextStyle(
        fontSize: 16,
        color: ConstantColors.textPrimary,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 2,
    foregroundColor: ConstantColors.white,
    backgroundColor: ConstantColors.primary,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: ConstantColors.primary),
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: const TextStyle(
        fontSize: 16,
        color: ConstantColors.textPrimary,
        fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ));
}
