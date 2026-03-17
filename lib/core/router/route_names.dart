/// Compile-time constant route name / path strings.
///
/// Using a single source of truth for route names prevents typos and
/// makes refactoring straightforward.
class RouteNames {
  RouteNames._();

  // -- Root / shell routes ---------------------------------------------------

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';

  // -- Auth routes -----------------------------------------------------------

  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String resetPassword = '/reset-password';
  static const String otpVerification = '/otp-verification';

  // -- Main tab routes -------------------------------------------------------

  static const String home = '/home';
  static const String search = '/search';
  static const String notifications = '/notifications';
  static const String profile = '/profile';

  // -- Settings routes -------------------------------------------------------

  static const String settings = '/settings';
  static const String editProfile = '/edit-profile';
  static const String changePassword = '/change-password';
  static const String privacyPolicy = '/privacy-policy';
  static const String termsOfService = '/terms-of-service';

  // -- Detail routes ---------------------------------------------------------

  /// Expects an `id` path parameter, e.g. `/details/:id`.
  static const String details = '/details';
}
