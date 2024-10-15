import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunctions {
  static void showSnackBar(BuildContext? context, String? message) {
    if (context != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message ?? '')));
    }
  }

  static void showAlert(BuildContext? context, String? title, String? message,
      VoidCallback? onPressed) {
    if (context != null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title ?? ''),
              content: Text(message ?? ''),
              actions: [
                TextButton(
                    onPressed: onPressed ?? () => Navigator.of(context).pop(),
                    child: const Text('OK')),
              ],
            );
          });
    }
  }

  static String truncateText(String text, int maxLength) {
    if (text != null && text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext? context) {
    if (context != null) {
      return Theme.of(context).brightness == Brightness.dark;
    } else {
      return false;
    }
  }

  static Size? screenSize(BuildContext? context) {
    if (context != null) {
      return MediaQuery.of(context).size;
    } else {
      return null;
    }
  }

  static String getFormattedDate(DateTime date,
      {String format = 'dd/MM/yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
