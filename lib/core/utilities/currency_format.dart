import 'package:intl/intl.dart';

class CurrencyFormat {
  /// default currency format
  static NumberFormat get defaultFormat => NumberFormat.simpleCurrency(name: 'NGN');

  /// format `amount` into standard money format
  static String formatMoney(num amount) => NumberFormat('##,##0').format(amount);

  /// appends the default currency format with a standard money format
  static String ngnFormatMoney(num amount) => '${defaultFormat.currencySymbol} ${formatMoney(amount)}';
}
