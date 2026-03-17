// TODO: Add `shared_preferences` to pubspec.yaml dependencies.
// dependencies:
//   shared_preferences: ^2.2.0

/// Abstract interface for simple key-value local storage.
///
/// This abstraction keeps the domain/data layers decoupled from
/// [SharedPreferences] so you can swap implementations or mock in tests.
abstract class LocalStorage {
  /// Reads a [String] value, returning `null` if the key does not exist.
  Future<String?> getString(String key);

  /// Writes a [String] value.
  Future<bool> setString(String key, String value);

  /// Reads a [bool] value, returning `null` if the key does not exist.
  Future<bool?> getBool(String key);

  /// Writes a [bool] value.
  Future<bool> setBool(String key, bool value);

  /// Reads an [int] value, returning `null` if the key does not exist.
  Future<int?> getInt(String key);

  /// Writes an [int] value.
  Future<bool> setInt(String key, int value);

  /// Reads a [double] value, returning `null` if the key does not exist.
  Future<double?> getDouble(String key);

  /// Writes a [double] value.
  Future<bool> setDouble(String key, double value);

  /// Reads a [List<String>] value, returning `null` if the key does not exist.
  Future<List<String>?> getStringList(String key);

  /// Writes a [List<String>] value.
  Future<bool> setStringList(String key, List<String> value);

  /// Returns `true` if the storage contains the given [key].
  Future<bool> containsKey(String key);

  /// Removes the entry for the given [key].
  Future<bool> remove(String key);

  /// Clears all entries from local storage.
  Future<bool> clear();
}

/// [LocalStorage] implementation backed by the `shared_preferences` package.
class SharedPrefsLocalStorage implements LocalStorage {
  // TODO: Uncomment once shared_preferences is added.
  // SharedPrefsLocalStorage._(this._prefs);
  //
  // final SharedPreferences _prefs;
  //
  // /// Factory that asynchronously obtains the SharedPreferences instance.
  // static Future<SharedPrefsLocalStorage> create() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   return SharedPrefsLocalStorage._(prefs);
  // }

  @override
  Future<String?> getString(String key) async {
    // TODO: return _prefs.getString(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> setString(String key, String value) async {
    // TODO: return _prefs.setString(key, value);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool?> getBool(String key) async {
    // TODO: return _prefs.getBool(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    // TODO: return _prefs.setBool(key, value);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<int?> getInt(String key) async {
    // TODO: return _prefs.getInt(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> setInt(String key, int value) async {
    // TODO: return _prefs.setInt(key, value);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<double?> getDouble(String key) async {
    // TODO: return _prefs.getDouble(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    // TODO: return _prefs.setDouble(key, value);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    // TODO: return _prefs.getStringList(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async {
    // TODO: return _prefs.setStringList(key, value);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> containsKey(String key) async {
    // TODO: return _prefs.containsKey(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> remove(String key) async {
    // TODO: return _prefs.remove(key);
    throw UnimplementedError('Add shared_preferences dependency');
  }

  @override
  Future<bool> clear() async {
    // TODO: return _prefs.clear();
    throw UnimplementedError('Add shared_preferences dependency');
  }
}
