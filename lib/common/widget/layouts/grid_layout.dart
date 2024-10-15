import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';

class TGridLayout extends BaseStatelessWidget {
  const TGridLayout(
      {super.key,
      required this.itemCount,
      this.crossAxisCount,
      this.isShrinkWrap,
        required this.mainAxisExtent,
      this.mainAxisSpacing,
      this.crossAxisSpacing,
      required this.itemBuilder,
      this.padding});

  final int itemCount;
  final int? crossAxisCount;
  final bool? isShrinkWrap;
  final double mainAxisExtent;
  final double? mainAxisSpacing;
  final double? crossAxisSpacing;
  final Widget? Function(BuildContext, int) itemBuilder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return GridView.builder(
        itemCount: itemCount,
        shrinkWrap: isShrinkWrap ?? true,
        padding: padding ?? EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount ?? 2,
            mainAxisSpacing: mainAxisSpacing ?? ConstantSizes.gridViewSpacing,
            crossAxisSpacing: crossAxisSpacing ?? ConstantSizes.gridViewSpacing,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder);
  }
}
