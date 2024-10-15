import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

class CustomAppbar extends BaseStatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.isShowBack = false,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
  });

  final Widget? title;
  final bool isShowBack;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: ConstantSizes.sm),
      child: AppBar(
        title: title,
        automaticallyImplyLeading: false,
        leading: isShowBack
            ? IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back_rounded))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtils.getAppBarHeight());
}
