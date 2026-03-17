// TODO: Add `intl` to pubspec.yaml for locale-aware formatting.
// dependencies:
//   intl: ^0.19.0

/// Static formatting helpers for dates, currency, phone numbers, etc.
///
/// These are pure functions with no side effects, making them easy to test.
class Formatters {
  Formatters._();

  // -- Date formatting (without intl) --------------------------------------

  /// Formats a [DateTime] as `dd/MM/yyyy`.
  static String date(DateTime dateTime) {
    return '${dateTime.day.toString().padLeft(2, '0')}/'
        '${dateTime.month.toString().padLeft(2, '0')}/'
        '${dateTime.year}';
  }

  /// Formats a [DateTime] as `dd MMM yyyy` (e.g. `05 Mar 2025`).
  static String dateShort(DateTime dateTime) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${dateTime.day.toString().padLeft(2, '0')} '
        '${months[dateTime.month - 1]} '
        '${dateTime.year}';
  }

  /// Formats a [DateTime] as `dd MMMM yyyy` (e.g. `05 March 2025`).
  static String dateLong(DateTime dateTime) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December',
    ];
    return '${dateTime.day.toString().padLeft(2, '0')} '
        '${months[dateTime.month - 1]} '
        '${dateTime.year}';
  }

  // -- TODO: intl-based formatting -----------------------------------------
  //
  // static String dateFormatted(DateTime dateTime, String pattern) {
  //   return DateFormat(pattern).format(dateTime);
  // }

  // -- Currency ------------------------------------------------------------

  /// Formats [amount] as a currency string.
  ///
  /// ```dart
  /// Formatters.currency(1234.5); // '\$1,234.50'
  /// Formatters.currency(1234.5, symbol: '€'); // '€1,234.50'
  /// ```
  static String currency(
    double amount, {
    String symbol = '\$',
    int decimalDigits = 2,
  }) {
    final parts = amount.toStringAsFixed(decimalDigits).split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

    // Add thousand separators.
    final buffer = StringBuffer();
    final isNegative = integerPart.startsWith('-');
    final digits = isNegative ? integerPart.substring(1) : integerPart;

    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(digits[i]);
    }

    return '${isNegative ? '-' : ''}$symbol$buffer$decimalPart';
  }

  // -- Phone ---------------------------------------------------------------

  /// Formats a 10-digit phone number as `(xxx) xxx-xxxx`.
  ///
  /// Returns the input unchanged if it does not have exactly 10 digits.
  static String phoneNumber(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    }
    if (digits.length == 11 && digits.startsWith('1')) {
      return '+1 (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    }
    return phone; // return as-is if format is unexpected
  }

  // -- File size -----------------------------------------------------------

  /// Formats bytes into a human-readable string (e.g. `1.5 MB`).
  static String fileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    }
    return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(1)} GB';
  }

  // -- Number --------------------------------------------------------------

  /// Formats a number with thousand separators.
  ///
  /// ```dart
  /// Formatters.number(1234567); // '1,234,567'
  /// ```
  static String number(num value) {
    final str = value.toStringAsFixed(0);
    final buffer = StringBuffer();
    final isNegative = str.startsWith('-');
    final digits = isNegative ? str.substring(1) : str;

    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) {
        buffer.write(',');
      }
      buffer.write(digits[i]);
    }

    return '${isNegative ? '-' : ''}$buffer';
  }

  // -- Duration ------------------------------------------------------------

  /// Formats a [Duration] as `mm:ss` or `h:mm:ss`.
  static String duration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours > 0) return '$hours:$minutes:$seconds';
    return '$minutes:$seconds';
  }
}
