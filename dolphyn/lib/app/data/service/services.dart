import 'package:dolphyn/app/data/service/wallet_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Services {
  Services._();
  static FlutterSecureStorage secureStorage;
  static init() async {
    secureStorage = FlutterSecureStorage();
    await WalletService.init();
  }
}
