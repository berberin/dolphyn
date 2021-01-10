// "address": "0xaab9eaba1aa2653c1dda9846334700b9f5e14e44",
// "balance": 5.280671798458702e+20,
// "share":52.81
import 'package:json_annotation/json_annotation.dart';

part 'holder.g.dart';

@JsonSerializable()
class Holder {
  String address;
  double balance;
  double share;

  Holder();

  factory Holder.fromJson(Map<String, dynamic> json) => _$HolderFromJson(json);

  Map<String, dynamic> toJson() => _$HolderToJson(this);
}
