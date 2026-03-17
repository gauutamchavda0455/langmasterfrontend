/// Application-wide constants that are not tied to the API or asset layer.
class AppConstants {
  AppConstants._();

  /// Display name shown in the UI and app stores.
  static const String appName = 'App';

  /// Current semantic version of the application.
  static const String appVersion = '1.0.0';

  /// Build number used for store submissions.
  static const int buildNumber = 1;

  /// Package / bundle identifier.
  static const String packageName = 'com.example.app';

  // -- Pagination ----------------------------------------------------------

  /// Default number of items per page in paginated lists.
  static const int defaultPageSize = 20;

  /// Index of the first page (some APIs start at 0, others at 1).
  static const int firstPageIndex = 1;

  // -- Animation durations -------------------------------------------------

  /// Standard duration for short animations (e.g., fades, scales).
  static const Duration animDurationShort = Duration(milliseconds: 200);

  /// Standard duration for medium animations (e.g., page transitions).
  static const Duration animDurationMedium = Duration(milliseconds: 350);

  /// Standard duration for long animations (e.g., complex sequences).
  static const Duration animDurationLong = Duration(milliseconds: 500);

  // -- Cache ---------------------------------------------------------------

  /// Default time-to-live for cached data in minutes.
  static const int cacheTtlMinutes = 60;

  // -- Miscellaneous -------------------------------------------------------

  /// Debounce delay for search inputs in milliseconds.
  static const int searchDebounceMs = 400;

  /// Maximum file upload size in bytes (10 MB).
  static const int maxUploadSizeBytes = 10 * 1024 * 1024;
}
