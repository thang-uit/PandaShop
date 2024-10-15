import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:panda_shop_app/common/assets/lotties.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/features/authentication/controllers/create_acc_success_controller.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';
import 'package:panda_shop_app/utils/device/device_utility.dart';

class SuccessScreen extends BaseGetView<SuccessController> {
  const SuccessScreen({
    super.key,
    required this.lottie,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String? lottie, title, subTitle;
  final VoidCallback? onPressed;

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // actions: [
        //   IconButton(
        //       onPressed: () => Get.offAllNamed(AppRoutes.login),
        //       icon: const Icon(Icons.clear_rounded))
        // ],
      ),
      body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
              child: Column(
                children: [
                  Lottie.asset(
                    lottie ?? AssetLotties.lottiePandaLaptop,
                    width: DeviceUtils.getScreenWidth(context) * 0.6,
                    animate: true,
                  ),
                  const SizedBox(
                    height: ConstantSizes.spaceBtwSections,
                  ),

                  Text(
                    title ?? "",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: ConstantSizes.spaceBtwItems,
                  ),
                  Text(
                    subTitle ?? "",
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
                      onPressed: onPressed,
                      child: const Text(ConstantTexts.tContinue),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
