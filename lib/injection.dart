/// Configures all dependency injection bindings.
///
/// Call this function before [runApp] in main.dart.
/// TODO: Integrate with get_it / injectable for production DI.
void configureDependencies() {
  // Register services
  // Example with get_it:
  // final getIt = GetIt.instance;
  // getIt.registerLazySingleton<AnalyticsService>(() => StubAnalyticsService());
  // getIt.registerLazySingleton<CrashService>(() => StubCrashService());
  // getIt.registerLazySingleton<NotificationService>(() => StubNotificationService());
  // getIt.registerLazySingleton<RemoteConfigService>(() => StubRemoteConfigService());
  // getIt.registerLazySingleton<ConnectivityService>(() => StubConnectivityService());
}
