abstract class AnalyticsService {
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  });

  Future<void> setUserId(String userId);

  Future<void> setUserProperty({
    required String name,
    required String value,
  });

  Future<void> logScreenView(String screenName);
}

class StubAnalyticsService implements AnalyticsService {
  @override
  Future<void> logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  }) async {}

  @override
  Future<void> setUserId(String userId) async {}

  @override
  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {}

  @override
  Future<void> logScreenView(String screenName) async {}
}
