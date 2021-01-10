// 85d2242ae1b7759934d4b0d4f0d62d666cf7d73e21dbd09d73c7de266b72a25a

import 'dart:math';

import 'package:dolphyn/app/data/service/services.dart';
import 'package:flutter/services.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

String contractAddress = "0x555a0DD8B24963e38FFF1a0c84F13f694Bd0f4F6";
String rpcUrl = "https://rinkeby.infura.io/v3/b130143cd3c147769c4e09acf48b3d51";
String dataTokenUrl =
    "https://market.oceanprotocol.com/asset/did:op:555a0DD8B24963e38FFF1a0c84F13f694Bd0f4F6";

class WalletService {
  WalletService._();
  static Web3Client client;
  static String abiFile;
  static DeployedContract contract;
  static dynamic getBalanceFunc;
  static WalletInfo _wallet;

  static init({String privateKey}) async {
    client = Web3Client(rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(rpcUrl).cast<String>();
    });
    abiFile = await rootBundle.loadString("assets/abi.json");
    // _wallet = await createNewWallet();
    contract = DeployedContract(
      ContractAbi.fromJson(abiFile, "OceanProtocol"),
      EthereumAddress.fromHex(contractAddress),
    );
    if (privateKey != null) {
      _wallet = await importWallet(privateKey);
      await savePrivateKey();
    } else {
      _wallet = await createNewWallet();
      await savePrivateKey();
    }
  }

  static Future<String> getPrivateKey() async {
    return await Services.secureStorage.read(key: 'privateKey');
  }

  static savePrivateKey() async {
    await Services.secureStorage.write(
        key: 'privateKey', value: HEX.encode(_wallet.privateKey.privateKey));
  }

  static Future<WalletInfo> createNewWallet() async {
    Random random = Random.secure();
    var privateKey = EthPrivateKey.createRandom(random);
    var address = await privateKey.extractAddress();
    return WalletInfo._(privateKey, address);
  }

  static Future<WalletInfo> importWallet(String priv) async {
    var privateKey = EthPrivateKey.fromHex(priv);
    var address = await privateKey.extractAddress();
    return WalletInfo._(privateKey, address);
  }

  static Future<double> checkBalance() async {
    var balance = await client.call(
        contract: contract,
        function: getBalanceFunc,
        params: [await _wallet.privateKey.extractAddress()]);
    return double.parse(balance[0].toString());
  }
}

class WalletInfo {
  EthPrivateKey privateKey;
  EthereumAddress address;
  WalletInfo._(this.privateKey, this.address);
}
