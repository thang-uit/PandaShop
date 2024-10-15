import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();

  final _storage = GetStorage();

  Future<void> saveData<T>(String? key, T? value) async {
    if (key != null && key.isNotEmpty && value != null) {
      await _storage.write(key, value);
    }
  }

  Future<T?> readData<T>(String key) async {
    return _storage.read<T>(key);
  }

  Future<void> removeData(String? key) async {
    if (key != null && key.isNotEmpty) {
      await _storage.remove(key);
    }
  }

  Future<void> clearAllData() async {
    await _storage.erase();
  }
}
