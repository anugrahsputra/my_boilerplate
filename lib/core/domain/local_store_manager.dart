import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageManager {
  Future<void> writeToStorage(String key, String value);

  Future<String?> readFromStorage(String key);

  Future<void> deleteFromStorage(String key);
}

class LocalStorageManagerImpl extends LocalStorageManager {
  final FlutterSecureStorage storage;

  LocalStorageManagerImpl({required this.storage});

  @override
  Future<void> deleteFromStorage(String key) async {
    await storage.delete(key: key, aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
  }

  @override
  Future<String?> readFromStorage(String key) async {
    return await storage.read(key: key, aOptions: _getAndroidOptions(), iOptions: _getIOSOptions());
  }

  @override
  Future<void> writeToStorage(String key, String value) async {
    await storage.write(
      key: key,
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true);

  IOSOptions _getIOSOptions() => const IOSOptions(
    accountName: _accountName,
    accessibility: KeychainAccessibility.first_unlock,
  );

  static const String _accountName = "boilerplate";
}