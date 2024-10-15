import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';

class DeviceUtils {
  static void hideKeyboard(BuildContext? context) {
    if (context != null) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext? context) {
    if (context != null) {
      final viewInsets = View.of(context).viewInsets;
      return viewInsets.bottom == 0;
    } else {
      return false;
    }
  }

  static bool isPortraitOrientation(BuildContext? context) {
    if (context != null) {
      final viewInsets = View.of(context).viewInsets;
      return viewInsets.bottom != 0;
    } else {
      return false;
    }
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight(BuildContext? context) {
    if (context != null) {
      return MediaQuery.of(context).size.height;
    } else {
      return 0;
    }
  }

  static double getScreenWidth(BuildContext? context) {
    if (context != null) {
      return MediaQuery.of(context).size.width;
    } else {
      return 0;
    }
  }

  static double getPixelRatio(BuildContext? context) {
    if (context != null) {
      return MediaQuery.of(context).devicePixelRatio;
    } else {
      return 0;
    }
  }

  static double getStatusBarHeight(BuildContext? context) {
    if (context != null) {
      return MediaQuery.of(context).padding.top;
    } else {
      return 0;
    }
  }

  static double getBottomNavigationBarHeight() {
    return kBottomNavigationBarHeight;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static getKeyboardHeight(BuildContext? context) {
    if (context != null) {
      final viewInsets = MediaQuery.of(context).viewInsets;
      return viewInsets.bottom;
    } else {
      return 0;
    }
  }

  static Future<bool> isKeyboardVisible(BuildContext? context) async {
    if (context != null) {
      final viewInsets = View.of(context).viewInsets;
      return viewInsets.bottom > 0;
    } else {
      return false;
    }
  }

  static Future<bool> isPhysicalDevice() async {
    return defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS;
  }

  static void vibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate());
  }

  static Future<void> setPreferredOrientations(List<DeviceOrientation> orientations) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  static void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  static void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }

  static void launchUrl(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
