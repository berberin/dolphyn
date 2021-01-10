import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Services {
  Services._();
  static FlutterSecureStorage secureStorage;
  static bool hadPrivateKey;
  static init() async {
    secureStorage = FlutterSecureStorage();
    String privateKey = await Services.secureStorage.read(key: 'privateKey');
    hadPrivateKey = privateKey == null;
  }
}
