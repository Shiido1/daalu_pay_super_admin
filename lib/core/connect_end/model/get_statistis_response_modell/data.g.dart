// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userStats: json['userStats'] == null
          ? null
          : UserStats.fromJson(json['userStats'] as Map<String, dynamic>),
      transactionStats: json['transactionStats'] == null
          ? null
          : TransactionStats.fromJson(
              json['transactionStats'] as Map<String, dynamic>),
      swaps: (json['swaps'] as List<dynamic>?)
          ?.map((e) => Swap.fromJson(e as Map<String, dynamic>))
          .toList(),
      nairaBalance: (json['nairaBalance'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userStats': instance.userStats,
      'transactionStats': instance.transactionStats,
      'swaps': instance.swaps,
      'nairaBalance': instance.nairaBalance,
    };
