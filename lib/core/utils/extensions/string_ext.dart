/// Utility extensions on [String].
extension StringExtensions on String {
  /// Capitalises the first letter, leaving the rest unchanged.
  ///
  /// ```dart
  /// 'hello'.capitalize; // 'Hello'
  /// ```
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Capitalises the first letter of every word.
  ///
  /// ```dart
  /// 'hello world'.titleCase; // 'Hello World'
  /// ```
  String get titleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// Returns `true` if the string matches a basic email pattern.
  bool get isEmail {
    final regex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    return regex.hasMatch(this);
  }

  /// Returns `true` if the string contains only digits.
  bool get isNumeric => RegExp(r'^[0-9]+$').hasMatch(this);

  /// Returns `true` if the string is a valid URL (http or https).
  bool get isUrl {
    final regex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    return regex.hasMatch(this);
  }

  /// Returns `true` if the string matches a basic phone number pattern.
  bool get isPhoneNumber {
    final regex = RegExp(r'^\+?[0-9]{7,15}$');
    return regex.hasMatch(replaceAll(RegExp(r'[\s\-()]'), ''));
  }

  /// Truncates the string to [maxLength] characters and appends [ellipsis].
  ///
  /// ```dart
  /// 'Hello World'.truncate(5); // 'Hello...'
  /// ```
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  /// Removes all whitespace from the string.
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');

  /// Returns `null` if the string is empty, otherwise returns the string.
  String? get nullIfEmpty => isEmpty ? null : this;

  /// Reverses the string.
  String get reversed => split('').reversed.join();

  /// Returns the string with only the first [n] characters.
  String take(int n) => length <= n ? this : substring(0, n);

  /// Converts a camelCase string to snake_case.
  String get toSnakeCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).replaceFirst(RegExp(r'^_'), '');
  }

  /// Converts a snake_case string to camelCase.
  String get toCamelCase {
    final parts = split('_');
    if (parts.length <= 1) return this;
    return parts.first +
        parts.skip(1).map((p) => p.capitalize).join();
  }
}

/// Extensions on nullable [String].
extension NullableStringExtensions on String? {
  /// Returns `true` if the string is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns `true` if the string is neither null nor empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;

  /// Returns the string or a [fallback] if null/empty.
  String orDefault([String fallback = '']) => isNullOrEmpty ? fallback : this!;
}
