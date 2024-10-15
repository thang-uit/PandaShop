import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:panda_shop_app/app.dart';
import 'package:panda_shop_app/common/flavor/Flavor.dart';
import 'package:panda_shop_app/utils/logging/logger.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class Env {
  Env() {
    init();
  }

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initServices();

    // if app starts up slow, or shows blank after splash but before
    // first flutter screen, use this,
    // https://github.com/jonbhanson/flutter_native_splash/blob/master/example/lib/main.dart
    await startApp();
  }

  Future<void> startApp() async {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://0666ce72a803e3da8f50c60dc2eb45f1@o4508109193805824.ingest.us.sentry.io/4508109285490688';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: () => runApp(App()),
    );

    LoggerMan.debug("Flavor url: ${Flavor.baseURL}");
  }

  Future<void> _initServices() async {
    await setSystemChromeSettings();
    await GetStorage.init();
  }

  Future<void> setSystemChromeSettings() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      // statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true,
    ));
    return SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      // DeviceOrientation.landscapeRight,
      // DeviceOrientation.landscapeLeft,
    ]);
  }
}
