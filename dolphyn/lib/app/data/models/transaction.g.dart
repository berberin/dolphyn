// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return Transaction()
    ..from = json['from'] as String
    ..recipient = json['recipient'] as String
    ..sender = json['sender'] as String
    ..timestamp = json['timestamp'] as int
    ..to = json['to'] as String
    ..transactionHash = json['transactionHash'] as String
    ..type = json['type'] as String
    ..value = json['value'] as String;
}

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'from': instance.from,
      'recipient': instance.recipient,
      'sender': instance.sender,
      'timestamp': instance.timestamp,
      'to': instance.to,
      'transactionHash': instance.transactionHash,
      'type': instance.type,
      'value': instance.value,
    };
