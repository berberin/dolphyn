import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

// "time": "1970-01-01T00:00:01.610238Z",
// "from": "0xeedab724c292e6ab438e789cdbd2eea1ae90e9ff",
// "recipient": "0xaab9eaba1aa2653c1dda9846334700b9f5e14e44",
// "sender": "0xeedab724c292e6ab438e789cdbd2eea1ae90e9ff",
// "timestamp": 1610238227,
// "to": "0xaab9eaba1aa2653c1dda9846334700b9f5e14e44",
// "transactionHash": "0x4b08f07410bf5ca59a48d5ac88b954ef617db0cc9a3a5db9befdef129c31fb67",
// "type": "transfer",
// "value":"60012699895959995000"

@JsonSerializable()
class Transaction {
  String from;
  String recipient;
  String sender;
  int timestamp;
  String to;
  String transactionHash;
  String type;
  String value;

  Transaction();

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
