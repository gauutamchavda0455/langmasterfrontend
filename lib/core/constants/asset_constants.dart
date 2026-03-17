/// Centralised asset path constants.
///
/// Keeping every path here prevents typos and makes it easy to
/// search for usages when assets are renamed or removed.
class AssetConstants {
  AssetConstants._();

  // -- Base directories ----------------------------------------------------

  static const String _imageBase = 'assets/images';
  static const String _iconBase = 'assets/icons';
  static const String _animationBase = 'assets/animations';
  static const String _fontBase = 'assets/fonts';

  // -- Images --------------------------------------------------------------

  static const String logo = '$_imageBase/logo.png';
  static const String logoLight = '$_imageBase/logo_light.png';
  static const String logoDark = '$_imageBase/logo_dark.png';
  static const String onboarding1 = '$_imageBase/onboarding_1.png';
  static const String onboarding2 = '$_imageBase/onboarding_2.png';
  static const String onboarding3 = '$_imageBase/onboarding_3.png';
  static const String placeholder = '$_imageBase/placeholder.png';
  static const String avatarDefault = '$_imageBase/avatar_default.png';
  static const String emptyState = '$_imageBase/empty_state.png';
  static const String errorState = '$_imageBase/error_state.png';

  // -- Icons (SVG) ---------------------------------------------------------

  static const String icHome = '$_iconBase/ic_home.svg';
  static const String icSearch = '$_iconBase/ic_search.svg';
  static const String icProfile = '$_iconBase/ic_profile.svg';
  static const String icSettings = '$_iconBase/ic_settings.svg';
  static const String icNotification = '$_iconBase/ic_notification.svg';
  static const String icBack = '$_iconBase/ic_back.svg';
  static const String icClose = '$_iconBase/ic_close.svg';

  // -- Lottie / Rive animations --------------------------------------------

  static const String animLoading = '$_animationBase/loading.json';
  static const String animSuccess = '$_animationBase/success.json';
  static const String animError = '$_animationBase/error.json';
  static const String animEmpty = '$_animationBase/empty.json';

  // -- Fonts ---------------------------------------------------------------

  static const String fontPrimary = '$_fontBase/primary';
}
