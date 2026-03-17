abstract class ConnectivityService {
  Future<bool> get isConnected;

  Stream<bool> get onConnectivityChanged;
}

class StubConnectivityService implements ConnectivityService {
  @override
  Future<bool> get isConnected async => true;

  @override
  Stream<bool> get onConnectivityChanged => Stream.value(true);
}
