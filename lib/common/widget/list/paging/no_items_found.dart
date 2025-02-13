import 'package:flutter/material.dart';
import 'package:panda_shop_app/common/widget/base_widget/base_stateless.dart';

class NoItemsFound extends BaseStatelessWidget {
  final String _message;
  final VoidCallback? onTryAgain;

  const NoItemsFound(this._message, {super.key, this.onTryAgain});

  @override
  Widget buildWidget(
      BuildContext context, bool isDarkMode, Color colorThemeMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                key: const Key('page_error_reload_button'),
                onPressed: () => onTryAgain?.call(),
                icon: const Icon(Icons.refresh),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
