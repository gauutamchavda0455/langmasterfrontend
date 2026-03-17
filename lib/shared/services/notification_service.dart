abstract class NotificationService {
  Future<void> initialize();

  Future<String?> getToken();

  Future<void> requestPermission();

  Future<void> subscribeToTopic(String topic);

  Future<void> unsubscribeFromTopic(String topic);
}

class StubNotificationService implements NotificationService {
  @override
  Future<void> initialize() async {}

  @override
  Future<String?> getToken() async => null;

  @override
  Future<void> requestPermission() async {}

  @override
  Future<void> subscribeToTopic(String topic) async {}

  @override
  Future<void> unsubscribeFromTopic(String topic) async {}
}
