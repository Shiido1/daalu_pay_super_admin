import 'package:json_annotation/json_annotation.dart';

part 'transaction_stats.g.dart';

@JsonSerializable()
class TransactionStats {
  int? total;
  int? pending;
  int? approved;
  int? rejected;

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
