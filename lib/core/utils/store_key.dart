import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:logging/logging.dart';
import 'package:my_boilerplate/core/core.dart';

class StoreKey {

  StoreKey({required this.localStorageManager});
  final LocalStorageManager localStorageManager;
  final Logger log = Logger('Local storage manager');

  Future<String> generateKey() async {
    final random = Random.secure();
    final bytes = List<int>.generate(32, (_) => random.nextInt(256));
    final key = base64Url.encode(bytes).substring(0, 32); // 32-char key
    await localStorageManager.writeToStorage('encryption_key', key);
    return key;
  }

  Future<String> getStoredKey() async {
    var key = await localStorageManager.readFromStorage('encryption_key');
    key ??= await generateKey();
    log.info('Stored key: $key');

    return key;
  }

  Future<CacheCipher> createCacheCipher() async {
    final key = await getStoredKey();
    return CacheCipher(
      decrypt: (List<int> bytes) async {
        final iv = encrypt.IV(Uint8List.fromList(bytes.sublist(0, 16)));
        final encryptedData = Uint8List.fromList(bytes.sublist(16));
        final encrypter = encrypt.Encrypter(
          encrypt.AES(encrypt.Key.fromUtf8(key)),
        );
        final encrypted = encrypt.Encrypted(encryptedData);
        final decryptedBytes = encrypter.decryptBytes(encrypted, iv: iv);
        return decryptedBytes;
      },
      encrypt: (List<int> bytes) async {
        final iv = encrypt.IV.fromSecureRandom(16);
        final encrypter = encrypt.Encrypter(
          encrypt.AES(encrypt.Key.fromUtf8(key)),
        );
        final encrypted = encrypter.encryptBytes(
          Uint8List.fromList(bytes),
          iv: iv,
        );
        return [...iv.bytes, ...encrypted.bytes];
      },
    );
  }
}
