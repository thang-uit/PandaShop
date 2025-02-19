import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/bindings/forget_password_binding.dart';
import 'package:panda_shop_app/bindings/login_binding.dart';
import 'package:panda_shop_app/bindings/main_binding.dart';
import 'package:panda_shop_app/bindings/on_boarding_binding.dart';
import 'package:panda_shop_app/bindings/reset_password_binding.dart';
import 'package:panda_shop_app/bindings/signup_binding.dart';
import 'package:panda_shop_app/bindings/splash_binding.dart';
import 'package:panda_shop_app/bindings/verify_email_binding.dart';
import 'package:panda_shop_app/bindings/wishlist_binding.dart';
import 'package:panda_shop_app/features/authentication/screens/login/login.dart';
import 'package:panda_shop_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:panda_shop_app/features/authentication/screens/password/forget_password.dart';
import 'package:panda_shop_app/features/authentication/screens/password/reset_password.dart';
import 'package:panda_shop_app/features/authentication/screens/signup/signup.dart';
import 'package:panda_shop_app/features/authentication/screens/signup/verify_email.dart';
import 'package:panda_shop_app/features/main/screens/main_screen.dart';
import 'package:panda_shop_app/features/shop/screens/wishlist/wishlist.dart';
import 'package:panda_shop_app/features/splash/screens/splash.dart';

abstract class AppRoutes {
  static const String start = '/';
  static const String onBoarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String verifyEmail = '/verifyEmail';

  // static const String success = '/success';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String main = '/main';
  static const String wishlist = '/wishlist';


  // ============================================================

  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<SplashScreen>(
      name: start,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
      // transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
      // curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<OnBoardingScreen>(
      name: onBoarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<LoginScreen>(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<SignUpScreen>(
      name: signup,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<VerifyEmailScreen>(
      name: verifyEmail,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    // GetPage<SuccessScreen>(
    //   name: success,
    //   page: () => const SuccessScreen(),
    //   binding: SuccessBinding(),
    //   transition: Transition.downToUp,
    //   transitionDuration: const Duration(milliseconds: 300),
    //   curve: Curves.fastLinearToSlowEaseIn,
    // ),
    GetPage<ForgetPasswordScreen>(
      name: forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<ResetPasswordScreen>(
      name: resetPassword,
      page: () => const ResetPasswordScreen(),
      binding: ResetPasswordBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<MainScreen>(
      name: main,
      page: () => MainScreen(),
      binding: MainBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    ),
    GetPage<WishlistScreen>(
      name: wishlist,
      page: () => WishlistScreen(),
      binding: WishListBinding(),
      // transition: Transition.rightToLeftWithFade,
      // transitionDuration: const Duration(milliseconds: 300),
      // curve: Curves.fastLinearToSlowEaseIn,
    ),
  ];
}
