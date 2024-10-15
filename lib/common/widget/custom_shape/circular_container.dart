import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class CircularContainer extends BaseStatelessWidget {
  const CircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 500,
      this.padding = 0,
      this.margin,
      this.child,
      this.backgroundColor = ConstantColors.white});

  final double? width;
  final double? height;
  final double? radius;
  final double? padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color? backgroundColor;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 500),
        color: backgroundColor,
      ),
      child: child ?? Container(),
    );
  }
}
