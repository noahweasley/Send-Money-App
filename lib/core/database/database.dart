import './adapters/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseService {
  static final instance = DatabaseService._();
  final int databaseVersion = 1; // increment by 1 only
  final String versionKey = 'database_version';
  final String boxName = 'database';
  late final Box _box;

  /// use `DatabaseService.instance`
  DatabaseService._();

  Future<void> initialize() async {
    await Hive.initFlutter();
    for (var adapter in AdapterList.list) {
      Hive.registerAdapter(adapter);
    }
    _box = await Hive.openBox(boxName);
    final storedVersion = await _box.get(versionKey, defaultValue: 1);

    if (storedVersion < databaseVersion) {
      await _performMigration(storedVersion, databaseVersion);
      await _box.put(versionKey, databaseVersion);
    }
  }

  Future<void> _performMigration(int fromVersion, int toVersion) async {
    // Implement your migration logic here
  }

  Future<void> close() async {
    await _box.close();
  }

  Future<void> setData(String key, dynamic data) async {
    await _box.put(key, data);
  }

  Future<void> setAllData(Map<String, dynamic> dataMap) async {
    await _box.putAll(dataMap);
  }

  Future<void> appendData(String key, dynamic data) async {
    final list = getData(key, List.empty(growable: true));
    list.add(data);
    await _box.put(key, list);
  }

  Future<void> appendAllData(String key, dynamic data) async {
    final list = getData(key, List.empty(growable: true));
    list.addAll(data);
    await _box.put(key, list);
  }

  Future<void> deleteData(String key) async {
    await _box.delete(key);
  }

  Future<void> deleteAllData(Iterable<String> keys) async {
    await _box.deleteAll(keys);
  }

  T getData<T>(String key, T defaultValue) {
    return _box.get(key, defaultValue: defaultValue) as T;
  }
}
