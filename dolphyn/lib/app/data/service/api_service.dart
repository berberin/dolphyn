import 'package:dio/dio.dart';
import 'package:dolphyn/app/data/models/token.dart';

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
}
