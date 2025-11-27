import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureCache {
  SecureCache._internal();

  static final SecureCache internal = SecureCache._internal();

  static FlutterSecureStorage? _instance;

  static Future<void> init() async {
    final AndroidOptions aOptions = const AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: "android_secure_storage"
    );

    _instance = FlutterSecureStorage(
      aOptions: aOptions
    );
  }

  // static FlutterSecureStorage? get storage => _instance;


  static Future<bool?> write(String key,String value) async {
    final success = await _instance!.write(key: key, value: value)
      .then((_) => true)
      .onError((error, _) {
        print(error.runtimeType);
        return false;
      });

      return success;
  }

  static Future<String?> getString(String key) async {
    return await _instance!.read(key: key);
  }




}