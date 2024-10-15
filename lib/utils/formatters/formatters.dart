import 'package:intl/intl.dart';

class Formatters {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd/MM/yyyy').format(date);
  }

  static formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }
}
