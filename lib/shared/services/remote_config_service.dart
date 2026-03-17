abstract class RemoteConfigService {
  Future<void> initialize();

  Future<void> fetchAndActivate();

  String getString(String key);

  bool getBool(String key);

  int getInt(String key);

  double getDouble(String key);
}

class StubRemoteConfigService implements RemoteConfigService {
  @override
  Future<void> initialize() async {}

  @override
  Future<void> fetchAndActivate() async {}

  @override
  String getString(String key) => '';

  @override
  bool getBool(String key) => false;

  @override
  int getInt(String key) => 0;

  @override
  double getDouble(String key) => 0.0;
}
