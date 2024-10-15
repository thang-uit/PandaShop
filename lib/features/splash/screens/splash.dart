import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// import 'package:page_transition/page_transition.dart';
import 'package:panda_shop_app/common/assets/lotties.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/common/widget/screen/splash_screen.dart';
import 'package:panda_shop_app/features/authentication/screens/onboarding/onboarding.dart';

class SplashScreen extends BaseStatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return AnimatedSplashScreen(
      splash: splashScreen(),
      // splash: "assets/logos/logo_trans_only_panda_500.png",
      nextScreen: const OnBoardingScreen(),
      splashTransition: SplashTransition.scaleTransition,
      // pageTransitionType: PageTransitionType.bottomToTop,
      splashIconSize: 300,
    );
  }

  Widget splashScreen() {
    return Lottie.asset(
      AssetLotties.lottiePandaLaptop,
      fit: BoxFit.fitWidth,
      animate: true,
    );
  }
}
