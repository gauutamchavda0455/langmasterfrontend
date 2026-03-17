abstract class CrashService {
  Future<void> initialize();

  Future<void> recordError(
    dynamic exception,
    StackTrace? stackTrace, {
    bool fatal = false,
  });

  Future<void> setUserId(String userId);

  Future<void> log(String message);
}

class StubCrashService implements CrashService {
  @override
  Future<void> initialize() async {}

  @override
  Future<void> recordError(
    dynamic exception,
    StackTrace? stackTrace, {
    bool fatal = false,
  }) async {}

  @override
  Future<void> setUserId(String userId) async {}

  @override
  Future<void> log(String message) async {}
}
