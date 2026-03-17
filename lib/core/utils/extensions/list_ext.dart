/// Utility extensions on [List].
extension ListExtensions<T> on List<T> {
  /// Returns the element at [index], or `null` if the index is out of bounds.
  ///
  /// ```dart
  /// [1, 2, 3].safeGet(5); // null
  /// [1, 2, 3].safeGet(1); // 2
  /// ```
  T? safeGet(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Returns the first element matching [test], or `null` if none match.
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Returns the last element matching [test], or `null` if none match.
  T? lastWhereOrNull(bool Function(T element) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) return this[i];
    }
    return null;
  }

  /// Returns a new list with duplicates removed, preserving order.
  ///
  /// Uses [==] for equality by default. Pass a [keyOf] function to
  /// de-duplicate by a derived key.
  List<T> unique([Object Function(T)? keyOf]) {
    final seen = <Object>{};
    return where((element) {
      final key = keyOf != null ? keyOf(element) : element as Object;
      return seen.add(key);
    }).toList();
  }

  /// Splits the list into chunks of [size].
  ///
  /// ```dart
  /// [1, 2, 3, 4, 5].chunked(2); // [[1, 2], [3, 4], [5]]
  /// ```
  List<List<T>> chunked(int size) {
    if (size <= 0) throw ArgumentError('Chunk size must be > 0');
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      final end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }

  /// Returns `true` if the list contains an element matching [test].
  bool containsWhere(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return true;
    }
    return false;
  }

  /// Returns a new sorted list without mutating the original.
  List<T> sortedBy(Comparable Function(T element) keyOf) {
    final copy = List<T>.of(this);
    copy.sort((a, b) => keyOf(a).compareTo(keyOf(b)));
    return copy;
  }

  /// Returns a new list sorted in descending order by [keyOf].
  List<T> sortedByDescending(Comparable Function(T element) keyOf) {
    final copy = List<T>.of(this);
    copy.sort((a, b) => keyOf(b).compareTo(keyOf(a)));
    return copy;
  }

  /// Separates list elements with [separator].
  ///
  /// ```dart
  /// [1, 2, 3].separated(0); // [1, 0, 2, 0, 3]
  /// ```
  List<T> separated(T separator) {
    if (length <= 1) return List<T>.of(this);
    final result = <T>[];
    for (var i = 0; i < length; i++) {
      result.add(this[i]);
      if (i < length - 1) result.add(separator);
    }
    return result;
  }
}

/// Extensions on nullable [List].
extension NullableListExtensions<T> on List<T>? {
  /// Returns `true` if the list is null or empty.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// Returns `true` if the list is neither null nor empty.
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
