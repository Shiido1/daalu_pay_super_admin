// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionStats _$TransactionStatsFromJson(Map<String, dynamic> json) =>
    TransactionStats(
      total: (json['total'] as num?)?.toInt(),
      pending: (json['pending'] as num?)?.toInt(),
      approved: (json['approved'] as num?)?.toInt(),
      rejected: (json['rejected'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TransactionStatsToJson(TransactionStats instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pending': instance.pending,
      'approved': instance.approved,
      'rejected': instance.rejected,
    };
