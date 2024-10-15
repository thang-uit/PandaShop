import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class SectionHeading extends BaseStatelessWidget {
  const SectionHeading(
      {super.key,
      this.textColor,
      this.isShowActionButton = false,
      this.title,
      this.buttonTitle = ConstantTexts.viewAll,
      this.padding,
      this.onPressed});

  final Color? textColor;
  final bool isShowActionButton;
  final String? title;
  final String? buttonTitle;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.apply(color: textColor ?? ConstantColors.textPrimary),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isShowActionButton)
            Flexible(
              child: TextButton(
                onPressed: onPressed,
                child: Text(
                  buttonTitle ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.apply(
                      color: textColor ??
                          ConstantColors.textPrimary.withOpacity(0.6)),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
        ],
      ),
    );
  }
}
