import 'package:feedback_sentry/feedback_sentry.dart';
import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';

class BaseScaffold extends BaseStatelessWidget {
  const BaseScaffold(
      {super.key,
      this.body,
      // this.backgroundColor,
      this.bottomSheet,
      this.appBar,
      this.bottomNavigationBar});

  final Widget? body;

  // final Color? backgroundColor;
  final Widget? bottomSheet;
  final AppBar? appBar;
  final Widget? bottomNavigationBar;

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // backgroundColor: backgroundColor ?? ConstantColors.primary,
  //     resizeToAvoidBottomInset: true,
  //     // should be true for seeing content in login page, when keyboard is up
  //     appBar: appBar,
  //     body: GestureDetector(
  //         onLongPress: () {
  //           BetterFeedback.of(context).showAndUploadToSentry();
  //         },
  //         child: body ?? Container()),
  //     bottomSheet: bottomSheet,
  //   );
  // }

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Scaffold(
      // backgroundColor: backgroundColor ?? ConstantColors.primary,
      resizeToAvoidBottomInset: true,
      // should be true for seeing content in login page, when keyboard is up
      appBar: appBar,
      body: GestureDetector(
          onLongPress: () {
            BetterFeedback.of(context).showAndUploadToSentry();
          },
          child: body ?? Container()),
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
