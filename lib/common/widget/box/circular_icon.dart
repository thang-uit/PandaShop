import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class CircularIcon extends BaseStatelessWidget {
  const CircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = ConstantSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ??
            (isDarkMode
                ? ConstantColors.black.withOpacity(0.9)
                : ConstantColors.white.withOpacity(0.9)),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
