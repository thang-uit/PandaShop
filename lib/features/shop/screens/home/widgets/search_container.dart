import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:flutter/material.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

class SearchContainer extends BaseStatelessWidget {
  const SearchContainer(
      {super.key,
      this.text,
      this.icon = Icons.search_rounded,
      this.isShowBackground = true,
      this.isShowBorder = true,
      this.padding =
          const EdgeInsets.symmetric(horizontal: ConstantSizes.defaultSpace)});

  final String? text;
  final IconData? icon;
  final bool isShowBackground;
  final bool isShowBorder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: ConstantSizes.defaultSpace),
      child: Container(
        width: DeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(ConstantSizes.md),
        decoration: BoxDecoration(
            color: isShowBackground
                ? isDarkMode
                    ? ConstantColors.dark
                    : ConstantColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(ConstantSizes.cardRadiusLg),
            border:
                isShowBorder ? Border.all(color: ConstantColors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: ConstantColors.darkGrey,
            ),
            const SizedBox(width: ConstantSizes.spaceBtwItems),
            Text(text ?? "", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
