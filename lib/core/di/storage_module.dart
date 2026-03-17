// TODO: Add DI and storage packages to pubspec.yaml.
// dependencies:
//   get_it: ^8.0.0
//   shared_preferences: ^2.2.0
//   flutter_secure_storage: ^9.0.0

import 'package:app/core/storage/local_storage.dart';
import 'package:app/core/storage/secure_storage.dart';

/// Registers all storage-related dependencies with the service locator.
///
/// Call this once during app initialisation (e.g., in `main()`).
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   await StorageModule.register();
///   runApp(const MyApp());
/// }
/// ```
class StorageModule {
  StorageModule._();

  /// Registers storage singletons with the service locator.
  ///
  /// This method is `async` because [SharedPreferences] requires an
  /// asynchronous initialisation step.
  static Future<void> register() async {
    // TODO: Replace with actual get_it registrations once dependencies are added.
    //
    // final sl = GetIt.instance;
    //
    // // SharedPreferences (needs async init)
    // final sharedPrefs = await SharedPreferences.getInstance();
    //
    // sl.registerLazySingleton<LocalStorage>(
    //   () => SharedPrefsLocalStorage._(sharedPrefs),
    // );
    //
    // // Secure storage
    // sl.registerLazySingleton<SecureStorage>(
    //   () => FlutterSecureStorageImpl(),
    // );
  }

  /// Tears down / resets storage registrations (useful in tests).
  static void reset() {
    // TODO: Implement once get_it is available.
    // GetIt.instance.unregister<LocalStorage>();
    // GetIt.instance.unregister<SecureStorage>();
  }
}
