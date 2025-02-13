import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';

class NoMoreItems extends BaseStatelessWidget {
  const NoMoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Icon(Icons.linear_scale),
    );
  }

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Icon(Icons.linear_scale),
    );
  }
}
