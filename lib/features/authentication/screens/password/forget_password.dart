import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/features/authentication/controllers/forget_password_controller.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class ForgetPasswordScreen extends BaseGetView<ForgetPasswordController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(ConstantSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              ConstantTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(
              height: ConstantSizes.spaceBtwItems,
            ),

            Text(
              ConstantTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),

            const SizedBox(
              height: ConstantSizes.spaceBtwSections * 2,
            ),

            /// Form
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_rounded),
                  labelText: ConstantTexts.email),
            ),

            const SizedBox(
              height: ConstantSizes.spaceBtwSections,
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {Get.offNamed(AppRoutes.resetPassword)},
                  child: const Text(ConstantTexts.submit)),
            ),
          ],
        ),
      ),
    );
  }
}
