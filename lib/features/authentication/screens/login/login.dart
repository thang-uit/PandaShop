import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/assets/images.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_getview.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_scaffold.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/toast/snackbar_widget.dart';
import 'package:panda_shop_app/features/authentication/controllers/login_controller.dart';
import 'package:panda_shop_app/utils/constant/colors.dart';
import 'package:panda_shop_app/utils/constant/enums.dart';
import 'package:panda_shop_app/utils/constant/sizes.dart';
import 'package:panda_shop_app/utils/constant/texts.dart';

class LoginScreen extends BaseGetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget buildGetWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return BaseScaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(
          top: ConstantSizes.appBarHeight,
          left: ConstantSizes.defaultSpace,
          bottom: ConstantSizes.defaultSpace,
          right: ConstantSizes.defaultSpace,
        ),
        child: Column(
          children: [
            const LoginHeader(),

            /// Form
            const LoginForm(),

            /// Divider
            LoginDivider(
              dividerText: ConstantTexts.orSignInWith.capitalize,
            ),

            const SizedBox(
              height: ConstantSizes.spaceBtwItems,
            ),

            /// Footer
            const LoginFooter(),
          ],
        ),
      )),
    );
  }
}

class LoginFooter extends BaseStatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ConstantColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () => {SnackBarUtil.show("Facebook")},
              icon: const Image(
                width: ConstantSizes.iconMd,
                height: ConstantSizes.iconMd,
                image: AssetImage(ConstantImages.logoFacebook),
              )),
        ),
        const SizedBox(
          width: ConstantSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ConstantColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () =>
                  {SnackBarUtil.show("Google", type: ToastType.success)},
              icon: const Image(
                width: ConstantSizes.iconMd,
                height: ConstantSizes.iconMd,
                image: AssetImage(ConstantImages.logoGoogle),
              )),
        ),
      ],
    );
  }
}

class LoginDivider extends BaseStatelessWidget {
  const LoginDivider({super.key, required this.dividerText});

  final String? dividerText;

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: isDarkMode ? ConstantColors.darkerGrey : ConstantColors.grey,
          thickness: 1,
          indent: 40,
          endIndent: 5,
        )),
        Text(dividerText ?? "", style: Theme.of(context).textTheme.labelMedium),
        Flexible(
            child: Divider(
          color: isDarkMode ? ConstantColors.darkerGrey : ConstantColors.grey,
          thickness: 1,
          indent: 5,
          endIndent: 40,
        )),
      ],
    );
  }
}

class LoginForm extends BaseStatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Form(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(vertical: ConstantSizes.spaceBtwSections),
      child: Column(
        children: [
          /// Email
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                labelText: ConstantTexts.email),
          ),

          const SizedBox(
            height: ConstantSizes.spaceBtwInputFields,
          ),

          /// Password
          TextFormField(
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_rounded),
                labelText: ConstantTexts.passWord,
                suffixIcon: Icon(Icons.remove_red_eye_rounded)),
          ),

          const SizedBox(
            height: ConstantSizes.spaceBtwInputFields / 2,
          ),

          /// Remember me and Forget password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  const Text(ConstantTexts.rememberMe)
                ],
              ),

              /// Forget password
              TextButton(
                  onPressed: () => {Get.toNamed(AppRoutes.forgetPassword)},
                  child: const Text(ConstantTexts.forgetPassword))
            ],
          ),

          const SizedBox(
            height: ConstantSizes.spaceBtwSections,
          ),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.offAllNamed(AppRoutes.main);
              },
              child: const Text(ConstantTexts.signIn),
            ),
          ),
          const SizedBox(
            height: ConstantSizes.spaceBtwItems,
          ),

          /// Create account button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => {Get.toNamed(AppRoutes.signup)},
              child: const Text(ConstantTexts.createAccount),
            ),
          ),
          // const SizedBox(
          //   height: ConstantSizes.spaceBtwSections,
          // ),
        ],
      ),
    ));
  }
}

class LoginHeader extends BaseStatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
            height: 150,
            image: AssetImage(ConstantImages.appLogoTransOnlyPanda)),
        Text(
          ConstantTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: ConstantSizes.sm),
        Text(ConstantTexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
