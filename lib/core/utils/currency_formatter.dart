import 'package:intl/intl.dart';

/// Formats numeric prices into a clean USD string.
///
/// Example:
/// ```dart
/// CurrencyFormatter.format(1199); // → "$1,199"
/// CurrencyFormatter.format(899);  // → "$899"
/// ```
abstract final class CurrencyFormatter {
  static final NumberFormat _formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 0,
  );

  /// Formats [price] as a USD currency string with no decimal places.
  static String format(num price) => _formatter.format(price);
}