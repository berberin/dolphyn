import 'package:dolphyn/app/data/service/wallet_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Services {
  Services._();
  static FlutterSecureStorage secureStorage;
  static bool hadPrivateKey;
  static init() async {
    secureStorage = FlutterSecureStorage();
    String privateKey = await Services.secureStorage.read(key: 'privateKey');
    hadPrivateKey = privateKey != null;
    if (privateKey != null) {
      await WalletService.init(privateKey: privateKey);
    }
  }
}
