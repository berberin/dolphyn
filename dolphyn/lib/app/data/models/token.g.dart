// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenInfo _$TokenInfoFromJson(Map<String, dynamic> json) {
  return TokenInfo()
    ..address = json['address'] as String
    ..countOps = json['countOps'] as int
    ..holdersCount = json['holdersCount'] as int
    ..name = json['name'] as String
    ..symbol = json['symbol'] as String
    ..transfersCount = json['transfersCount'] as int;
}

Map<String, dynamic> _$TokenInfoToJson(TokenInfo instance) => <String, dynamic>{
      'address': instance.address,
      'countOps': instance.countOps,
      'holdersCount': instance.holdersCount,
      'name': instance.name,
      'symbol': instance.symbol,
      'transfersCount': instance.transfersCount,
    };
