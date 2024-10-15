import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/features/authentication/controllers/signup_controller.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class SignUpScreen extends BaseGetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
        appBar: AppBar(
            // elevation: 0,
            // leading: IconButton(
            //     onPressed: controller.onClickBox,
            //     icon: Icon(
            //       Icons.widgets_rounded,
            //       color: AppColors.onPrimary,
            //     )),
            // centerTitle: true,
            // actions: <Widget>[
            //   IconButton(
            //       onPressed: controller.onClickSwitch,
            //       icon: Icon(
            //         Icons.swap_horiz_rounded,
            //         color: AppColors.onPrimary,
            //       )),
            // ],
            ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(ConstantSizes.spaceBtwItems),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(ConstantTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),

              /// Form
              const SignUpForm(),

              const SizedBox(
                height: ConstantSizes.spaceBtwSections,
              ),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {Get.toNamed(AppRoutes.verifyEmail)},
                    child: const Text(ConstantTexts.createAccount)),
              )
            ],
          ),
        )));
  }
}

class SignUpForm extends BaseStatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ConstantTexts.firstName,
                  prefixIcon: Icon(Icons.person_rounded)),
            )),
            const SizedBox(
              width: ConstantSizes.spaceBtwInputFields,
            ),
            Expanded(
                child: TextFormField(
              expands: false,
              decoration: const InputDecoration(
                  labelText: ConstantTexts.lastName,
                  prefixIcon: Icon(Icons.person_rounded)),
            )),
          ],
        ),

        const SizedBox(
          height: ConstantSizes.spaceBtwInputFields,
        ),

        /// Username
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ConstantTexts.userName,
                prefixIcon: Icon(Icons.person_pin_rounded))),

        const SizedBox(
          height: ConstantSizes.spaceBtwInputFields,
        ),

        /// Email
        TextFormField(
            expands: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                labelText: ConstantTexts.email,
                prefixIcon: Icon(Icons.email_rounded))),

        const SizedBox(
          height: ConstantSizes.spaceBtwInputFields,
        ),

        /// Phone number
        TextFormField(
            expands: false,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                labelText: ConstantTexts.phoneNo,
                prefixIcon: Icon(Icons.phone_outlined))),

        const SizedBox(
          height: ConstantSizes.spaceBtwInputFields,
        ),

        /// Password
        TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: ConstantTexts.passWord,
                prefixIcon: Icon(Icons.lock_rounded))),

        const SizedBox(
          height: ConstantSizes.spaceBtwSections,
        ),

        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            const SizedBox(
              width: ConstantSizes.spaceBtwItems,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${ConstantTexts.iAgreeTo} ',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ConstantTexts.privacyPolicy,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ConstantColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: ConstantColors.primary,
                      )),
              TextSpan(
                  text: " and ", style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: ConstantTexts.termsOfYou,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: ConstantColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor: ConstantColors.primary,
                      )),
            ]))
          ],
        )
      ],
    ));
  }
}
