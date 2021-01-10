// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'holder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Holder _$HolderFromJson(Map<String, dynamic> json) {
  return Holder()
    ..address = json['address'] as String
    ..balance = (json['balance'] as num)?.toDouble()
    ..share = (json['share'] as num)?.toDouble();
}

Map<String, dynamic> _$HolderToJson(Holder instance) => <String, dynamic>{
      'address': instance.address,
      'balance': instance.balance,
      'share': instance.share,
    };
