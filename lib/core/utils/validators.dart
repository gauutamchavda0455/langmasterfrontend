/// Static validation helpers used by form fields and the domain layer.
///
/// Each method returns `null` on success or a human-readable error string
/// on failure, matching the contract expected by Flutter's `TextFormField`
/// `validator` parameter.
class Validators {
  Validators._();

  // -- Email ---------------------------------------------------------------

  /// Validates that [value] is a non-empty, well-formed email address.
  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    final regex = RegExp(
      r'^[a-zA-Z0-9.!#$%&*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$',
    );
    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  // -- Password ------------------------------------------------------------

  /// Validates that [value] meets minimum password requirements.
  ///
  /// Requirements:
  /// - At least [minLength] characters (default 8).
  /// - At least one uppercase letter.
  /// - At least one lowercase letter.
  /// - At least one digit.
  /// - At least one special character.
  static String? password(String? value, {int minLength = 8}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  /// Validates that [value] matches [password].
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // -- Phone ---------------------------------------------------------------

  /// Validates a phone number (7-15 digits, optional leading +).
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final digits = value.replaceAll(RegExp(r'[\s\-()]+'), '');
    if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(digits)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  // -- Generic required ----------------------------------------------------

  /// Validates that [value] is not null or empty.
  static String? required(String? value, [String fieldName = 'This field']) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // -- Name ----------------------------------------------------------------

  /// Validates that [value] is a non-empty name with at least 2 characters.
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value.trim())) {
      return 'Name contains invalid characters';
    }
    return null;
  }

  // -- URL -----------------------------------------------------------------

  /// Validates that [value] is a well-formed HTTP/HTTPS URL.
  static String? url(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'URL is required';
    }
    final regex = RegExp(
      r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
    );
    if (!regex.hasMatch(value.trim())) {
      return 'Enter a valid URL';
    }
    return null;
  }

  // -- Number range --------------------------------------------------------

  /// Validates that [value] is a number within the given range.
  static String? numberInRange(
    String? value, {
    required double min,
    required double max,
    String fieldName = 'Value',
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    final number = double.tryParse(value.trim());
    if (number == null) {
      return '$fieldName must be a number';
    }
    if (number < min || number > max) {
      return '$fieldName must be between ${min.toStringAsFixed(0)} and ${max.toStringAsFixed(0)}';
    }
    return null;
  }

  // -- Length ---------------------------------------------------------------

  /// Validates that [value] length is between [min] and [max].
  static String? length(
    String? value, {
    int min = 0,
    int? max,
    String fieldName = 'This field',
  }) {
    if (value == null || value.isEmpty) {
      if (min > 0) return '$fieldName is required';
      return null;
    }
    if (value.length < min) {
      return '$fieldName must be at least $min characters';
    }
    if (max != null && value.length > max) {
      return '$fieldName must be at most $max characters';
    }
    return null;
  }
}
