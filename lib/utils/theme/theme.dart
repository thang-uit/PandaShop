import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/chip_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/text_theme.dart';
import 'package:panda_shop_app/utils/theme/custom_themes/textfield_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NotoSans',
    brightness: Brightness.light,
    primaryColor: ConstantColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevateButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    chipTheme: TChipTheme.lightChipTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'NotoSans',
    brightness: Brightness.dark,
    primaryColor: ConstantColors.primary,
    scaffoldBackgroundColor: ConstantColors.backgroundDark,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevateButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    chipTheme: TChipTheme.darkChipTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}
