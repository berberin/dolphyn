import 'package:dio/dio.dart';
import 'package:dolphyn/app/data/models/holder.dart';
import 'package:dolphyn/app/data/models/token.dart';
import 'package:dolphyn/app/data/models/transaction.dart';

String baseUrl = 'http://danhabc.xyz:5000';

class ApiService {
  ApiService._();
  static Dio dio = Dio();

  static Future<List<TokenInfo>> getTokenInfo() async {
    List<TokenInfo> tokens = List<TokenInfo>();
    var response = await dio.get("$baseUrl/getToken");
    for (var token in response.data["tokens"]) {
      tokens.add(TokenInfo.fromJson(token));
    }
    return tokens;
  }

  static Future<List<Holder>> getHolders(String tokenAddress) async {
    List<Holder> holders = List<Holder>();
    var response = await dio.get("$baseUrl/getHolder/$tokenAddress");
    for (var holder in response.data["holder"]) {
      holders.add(Holder.fromJson(holder));
    }
    return holders;
  }

  static Future<List<Transaction>> getTransactions(
      String tokenAddress, String address) async {
    List<Transaction> trans = List<Transaction>();
    var response = await dio.get("$baseUrl/getTx/$tokenAddress/$address");
    for (var tx in response.data["send"]) {
      trans.add(Transaction.fromJson(tx));
    }
    for (var tx in response.data["receive"]) {
      trans.add(Transaction.fromJson(tx));
    }
    trans.sort((a, b) {
      if (a.timestamp > b.timestamp) {
        return -1;
      }
      if (a.timestamp < b.timestamp) {
        return 1;
      }
      return 0;
    });
    return trans;
  }
}
