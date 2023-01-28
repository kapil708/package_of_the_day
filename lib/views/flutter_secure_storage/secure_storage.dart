import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(encryptedSharedPreferences: true);
IOSOptions _getIOSOptions() => const IOSOptions(accountName: 'flutter_secure_storage_service');

class SecureStorage {
  // Create storage
  final storage = const FlutterSecureStorage();

  Future<void> setValue(String key, dynamic value) async {
    var data = json.encode(value);
    await storage.write(
      key: key,
      value: data,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  Future<dynamic> getValue(String key) async {
    String? value = await storage.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
    if (value != null) {
      return json.decode(value);
    }

    return value;
  }

  Future<void> deleteValue(String key) async {
    await storage.delete(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  Future<void> clearStorage() async {
    await storage.deleteAll(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }
}
