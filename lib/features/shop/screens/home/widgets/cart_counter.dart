import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';

class CartCounter extends BaseStatelessWidget {
  const CartCounter({super.key, this.onPressed, this.padding, this.iconColor});

  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stack(
        children: [
          IconButton(
              onPressed: () => {},
              icon: const FaIcon(FontAwesomeIcons.bagShopping),
              color: ConstantColors.black),
          Positioned(
              right: 0,
              top: 4,
              child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: ConstantColors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      "0",
                      style: Theme.of(context).textTheme.labelLarge?.apply(
                          color: ConstantColors.white, fontSizeFactor: 0.8),
                    ),
                  )))
        ],
      ),
    );
  }
}
