import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/style/shadows.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class RoundedContainer extends BaseStatelessWidget {
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius = ConstantSizes.cardRadiusLg,
    this.child,
    this.isShowBorder = false,
    this.borderColor = ConstantColors.borderPrimary,
    this.backgroundColor = ConstantColors.white,
    this.padding,
    this.margin,
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool isShowBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: isShowBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
