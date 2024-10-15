import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:panda_shop_app/common/routes/app_routes.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';
import 'package:panda_shop_app/utils/logging/logger.dart';
import 'package:panda_shop_app/utils/theme/theme.dart';

class App extends BaseStatelessWidget {
  const App({super.key});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        // home: const SplashScreen(),
        getPages: AppRoutes.routes,
        showPerformanceOverlay: false,
        showSemanticsDebugger: false,
        // defaultTransition: Transition.native,
        enableLog: true,
        logWriterCallback: (String msg, {bool isError = false}) {
          LoggerMan.e("GetX: $msg | ${isError ? "isError: true" : ""}");
        },
      ),
    );
  }
}
