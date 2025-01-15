import 'package:json_annotation/json_annotation.dart';

import 'swap.dart';
import 'transaction_stats.dart';
import 'user_stats.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  UserStats? userStats;
  TransactionStats? transactionStats;
  List<Swap>? swaps;
  int? nairaBalance;

  Data({
    this.userStats,
    this.transactionStats,
    this.swaps,
    this.nairaBalance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
