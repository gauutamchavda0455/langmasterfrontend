// TODO: Add `flutter_secure_storage` to pubspec.yaml dependencies.
// dependencies:
//   flutter_secure_storage: ^9.0.0

/// Abstract interface for secure key-value storage (e.g., tokens, secrets).
///
/// On Android this maps to the Android Keystore; on iOS to the Keychain.
abstract class SecureStorage {
  /// Reads the value for the given [key], returning `null` if absent.
  Future<String?> read(String key);

  /// Writes [value] for the given [key].
  Future<void> write(String key, String value);

  /// Deletes the entry for the given [key].
  Future<void> delete(String key);

  /// Returns `true` if storage contains the given [key].
  Future<bool> containsKey(String key);

  /// Deletes all entries from secure storage.
  Future<void> deleteAll();

  /// Returns all key-value pairs stored in secure storage.
  Future<Map<String, String>> readAll();
}

// -- Well-known storage keys ------------------------------------------------

/// Centralised key names for values kept in [SecureStorage].
class SecureStorageKeys {
  SecureStorageKeys._();

  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String pin = 'pin';
  static const String biometricEnabled = 'biometric_enabled';
}

/// [SecureStorage] implementation backed by the `flutter_secure_storage`
/// package.
class FlutterSecureStorageImpl implements SecureStorage {
  FlutterSecureStorageImpl();

  // TODO: Uncomment once flutter_secure_storage is added.
  // final FlutterSecureStorage _storage = const FlutterSecureStorage(
  //   aOptions: AndroidOptions(encryptedSharedPreferences: true),
  //   iOptions: IOSOptions(
  //     accessibility: KeychainAccessibility.first_unlock_this_device,
  //   ),
  // );

  @override
  Future<String?> read(String key) async {
    // TODO: return _storage.read(key: key);
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }

  @override
  Future<void> write(String key, String value) async {
    // TODO: await _storage.write(key: key, value: value);
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }

  @override
  Future<void> delete(String key) async {
    // TODO: await _storage.delete(key: key);
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }

  @override
  Future<bool> containsKey(String key) async {
    // TODO: return _storage.containsKey(key: key);
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }

  @override
  Future<void> deleteAll() async {
    // TODO: await _storage.deleteAll();
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }

  @override
  Future<Map<String, String>> readAll() async {
    // TODO: return _storage.readAll();
    throw UnimplementedError('Add flutter_secure_storage dependency');
  }
}
