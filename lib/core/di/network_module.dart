// TODO: Add a service locator / DI package to pubspec.yaml.
// Recommended options:
//   get_it: ^8.0.0
//   injectable: ^2.5.0 (with injectable_generator as dev dependency)

import 'package:app/core/network/api_client.dart';
import 'package:app/core/network/dio_client.dart';
import 'package:app/core/network/interceptors/auth_interceptor.dart';
import 'package:app/core/network/interceptors/logging_interceptor.dart';
import 'package:app/core/network/interceptors/retry_interceptor.dart';

/// Registers all network-related dependencies with the service locator.
///
/// Call this once during app initialisation (e.g., in `main()`).
///
/// ```dart
/// void main() async {
///   WidgetsFlutterBinding.ensureInitialized();
///   NetworkModule.register();
///   StorageModule.register();
///   runApp(const MyApp());
/// }
/// ```
class NetworkModule {
  NetworkModule._();

  /// Registers network singletons / factories with the service locator.
  static void register() {
    // TODO: Replace with actual get_it registrations once the dependency is added.
    //
    // final sl = GetIt.instance;
    //
    // // Interceptors
    // sl.registerLazySingleton<AuthInterceptor>(
    //   () => AuthInterceptor(),
    // );
    // sl.registerLazySingleton<LoggingInterceptor>(
    //   () => LoggingInterceptor(),
    // );
    // sl.registerLazySingleton<RetryInterceptor>(
    //   () => RetryInterceptor(),
    // );
    //
    // // Dio client (concrete implementation)
    // sl.registerLazySingleton<DioClient>(
    //   () => DioClient(),
    // );
    //
    // // Abstract API client (backed by DioClient)
    // sl.registerLazySingleton<ApiClient>(
    //   () => sl<DioClient>(),
    // );
  }

  /// Tears down / resets network registrations (useful in tests).
  static void reset() {
    // TODO: Implement once get_it is available.
    // GetIt.instance.unregister<ApiClient>();
    // GetIt.instance.unregister<DioClient>();
  }
}
