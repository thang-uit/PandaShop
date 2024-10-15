import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/assets/lotties.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/features/authentication/controllers/verify_email_controller.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

import 'create_acc_success.dart';

class VerifyEmailScreen extends BaseGetView<VerifyEmailController> {
  const VerifyEmailScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.clear_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
          child: Column(
            children: [
              // Lottie.asset(
              //   AssetLotties.lottiePandaSleep,
              //   width: DeviceUtils.getScreenWidth(context) * 0.6,
              //   animate: true,
              // ),

              Image(
                image: const AssetImage(ConstantImages.imgSentEmail),
                width: DeviceUtils.getScreenWidth(context) * 0.6,
                fit: BoxFit.cover,
              ),

              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),
              Text(
                ConstantTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwItems,
              ),
              Text(
                "thangbeone@gmail.com",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwItems,
              ),
              Text(
                ConstantTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => {
                    Get.off(SuccessScreen(
                      lottie: AssetLotties.lottiePandaLaptop,
                      title: ConstantTexts.yourAccountCreateTitle,
                      subTitle: ConstantTexts.yourAccountCreateSubTitle,
                      onPressed: () => Get.offAllNamed(AppRoutes.login),
                    ))
                  },
                  child: const Text(ConstantTexts.tContinue),
                ),
              ),
              const SizedBox(
                height: ConstantSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    SnackBarUtil.show('Em dep lam');
                  },
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
