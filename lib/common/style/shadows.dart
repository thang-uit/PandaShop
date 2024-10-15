import 'package:flutter/cupertino.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class ShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: ConstantColors.darkGrey.withOpacity(0.2),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: ConstantColors.darkGrey.withOpacity(0.2),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
