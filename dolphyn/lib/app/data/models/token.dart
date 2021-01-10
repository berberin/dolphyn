import 'package:json_annotation/json_annotation.dart';

// "time": "2021-01-10T04:03:50Z",
// "address": "0x7bce67697ed2858d0683c631dde7af823b7eea38",
// "address_1": "0x7bce67697ed2858d0683c631dde7af823b7eea38",
// "countOps": 118,
// "decimals": "18",
// "ethTransfersCount": 0,
// "holdersCount": 33,
// "issuancesCount": 0,
// "lastUpdated": 1610238359,
// "name": "Quiescent Crab Token",
// "owner": null,
// "symbol": "QUICRA-0",
// "symbol_1": "QUICRA-0",
// "totalSupply": "1000000000000000000000",
// "transfersCount": 118
part 'token.g.dart';

@JsonSerializable()
class TokenInfo {
  String address;
  int countOps;
  int holdersCount;
  String name;
  String symbol;
  int transfersCount;

  TokenInfo();

  factory TokenInfo.fromJson(Map<String, dynamic> json) =>
      _$TokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenInfoToJson(this);
}
