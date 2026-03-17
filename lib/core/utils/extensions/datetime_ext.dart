// TODO: Add `intl` to pubspec.yaml for advanced date formatting.
// dependencies:
//   intl: ^0.19.0

/// Convenience extensions on [DateTime].
extension DateTimeExtensions on DateTime {
  // -- Formatting (without intl) -------------------------------------------

  /// Returns the date in `yyyy-MM-dd` format.
  ///
  /// ```dart
  /// DateTime(2025, 3, 5).toDateString; // '2025-03-05'
  /// ```
  String get toDateString =>
      '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';

  /// Returns the time in `HH:mm` (24-hour) format.
  String get toTimeString =>
      '${hour.toString().padLeft(2, '0')}:'
      '${minute.toString().padLeft(2, '0')}';

  /// Returns date and time in `yyyy-MM-dd HH:mm` format.
  String get toDateTimeString => '$toDateString $toTimeString';

  /// Returns the time in `h:mm a` (12-hour) format.
  String get toTime12String {
    final h = hour % 12 == 0 ? 12 : hour % 12;
    final period = hour < 12 ? 'AM' : 'PM';
    return '$h:${minute.toString().padLeft(2, '0')} $period';
  }

  // -- TODO: intl-based formatting (uncomment when intl is added) ----------
  //
  // String format(String pattern) => DateFormat(pattern).format(this);
  // String get toLocaleDateString => DateFormat.yMMMd().format(this);
  // String get toLocaleTimeString => DateFormat.jm().format(this);

  // -- Relative / human-friendly -------------------------------------------

  /// Returns a human-friendly relative time string.
  ///
  /// ```dart
  /// DateTime.now().subtract(Duration(minutes: 5)).timeAgo; // '5 minutes ago'
  /// ```
  String get timeAgo {
    final now = DateTime.now();
    final diff = now.difference(this);

    if (diff.isNegative) return 'just now';
    if (diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) {
      final m = diff.inMinutes;
      return '$m ${m == 1 ? 'minute' : 'minutes'} ago';
    }
    if (diff.inHours < 24) {
      final h = diff.inHours;
      return '$h ${h == 1 ? 'hour' : 'hours'} ago';
    }
    if (diff.inDays < 7) {
      final d = diff.inDays;
      return '$d ${d == 1 ? 'day' : 'days'} ago';
    }
    if (diff.inDays < 30) {
      final w = (diff.inDays / 7).floor();
      return '$w ${w == 1 ? 'week' : 'weeks'} ago';
    }
    if (diff.inDays < 365) {
      final m = (diff.inDays / 30).floor();
      return '$m ${m == 1 ? 'month' : 'months'} ago';
    }
    final y = (diff.inDays / 365).floor();
    return '$y ${y == 1 ? 'year' : 'years'} ago';
  }

  // -- Comparison helpers --------------------------------------------------

  /// `true` if this date is today.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// `true` if this date is yesterday.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// `true` if this date is tomorrow.
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  /// `true` if this date falls on a weekend (Saturday or Sunday).
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// Returns a new [DateTime] with the time set to midnight (start of day).
  DateTime get startOfDay => DateTime(year, month, day);

  /// Returns a new [DateTime] set to the last moment of the day.
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59, 999);

  /// Returns the number of days in the month of this date.
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Returns the age in years from this date until now.
  int get age {
    final now = DateTime.now();
    int years = now.year - year;
    if (now.month < month || (now.month == month && now.day < day)) {
      years--;
    }
    return years;
  }
}
