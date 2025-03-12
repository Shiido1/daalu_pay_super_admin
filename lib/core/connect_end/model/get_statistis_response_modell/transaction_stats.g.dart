// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionStats _$TransactionStatsFromJson(Map<String, dynamic> json) =>
    TransactionStats(
      total: json['total'] as num?,
      pending: json['pending'] as num?,
      approved: json['approved'] as num?,
      rejected: json['rejected'] as num?,
    );

Map<String, dynamic> _$TransactionStatsToJson(TransactionStats instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pending': instance.pending,
      'approved': instance.approved,
      'rejected': instance.rejected,
    };
