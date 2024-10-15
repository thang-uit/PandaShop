import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/features/authentication/controllers/reset_password_controller.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

class ResetPasswordScreen extends BaseGetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => {Get.back()},
              icon: const Icon(Icons.clear_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(ConstantImages.appLogoTransCircle750),
                width: DeviceUtils.getScreenWidth(context) * 0.6,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),

              /// Title & Subtitle
              Text(
                ConstantTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwItems,
              ),

              Text(
                ConstantTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {}, child: const Text(ConstantTexts.done)),
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => {},
                  child: const Text(ConstantTexts.resendEmail),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
