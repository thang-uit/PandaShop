import 'package:get_storage/get_storage.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:panda_shop_app/utils/extension/StringExtension.dart';

class LocalStorage {
  // Singleton instance
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() => _instance;

  LocalStorage._internal();

  final GetStorage storage = GetStorage();
  final String _encryptionKey =
      "secret_key_32_chars"; // Key 32 ký tự cho mã hóa AES

  /// Mã hóa dữ liệu (nếu cần)
  String encryptData(String data) {
    final key = encrypt.Key.fromUtf8(_encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encryptData = encrypt.Encrypter(encrypt.AES(key));
    return encryptData.encrypt(data, iv: iv).base64;
  }

  /// Giải mã dữ liệu (nếu cần)
  String decryptData(String encryptedData) {
    final key = encrypt.Key.fromUtf8(_encryptionKey);
    final iv = encrypt.IV.fromLength(16);
    final encryptData = encrypt.Encrypter(encrypt.AES(key));
    return encryptData.decrypt64(encryptedData, iv: iv);
  }

  /// Lưu dữ liệu
  Future<void> saveData<T>(String key, T value,
      {bool isEncrypt = false}) async {
    if (key.isEmpty || value == null) {
      return;
    }

    if (isEncrypt && value is String) {
      // Mã hóa nếu cần
      value = encryptData(value) as T;
    }
    await storage.write(key, value);
  }

  /// Đọc dữ liệu
  Future<T?> getData<T>(String key, {bool isDecrypt = false}) async {
    if (key.isNullEmptyOrWhitespace) {
      return null;
    }

    final data = storage.read<T>(key);

    if (isDecrypt && data is String) {
      // Giải mã nếu cần
      return decryptData(data) as T;
    }
    return data;
  }

  /// Kiểm tra xem dữ liệu có tồn tại không
  bool isContainsKey(String key) {
    return storage.hasData(key);
  }

  /// Xóa dữ liệu theo key
  Future<void> removeData(String key) async {
    if (!key.isNullEmptyOrWhitespace) {
      await storage.remove(key);
    }
  }

  /// Xóa tất cả dữ liệu
  Future<void> clearAllData() async {
    await storage.erase();
  }
}
