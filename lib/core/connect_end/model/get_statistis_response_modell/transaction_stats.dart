import 'package:json_annotation/json_annotation.dart';

part 'transaction_stats.g.dart';

@JsonSerializable()
class TransactionStats {
  num? total;
  num? pending;
  num? approved;
  num? rejected;

  TransactionStats({
    this.total,
    this.pending,
    this.approved,
    this.rejected,
  });

  factory TransactionStats.fromJson(Map<String, dynamic> json) {
    return _$TransactionStatsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransactionStatsToJson(this);
}
