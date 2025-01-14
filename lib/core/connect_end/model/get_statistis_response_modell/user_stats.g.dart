// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStats _$UserStatsFromJson(Map<String, dynamic> json) => UserStats(
      total: (json['total'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      newUser: (json['new'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserStatsToJson(UserStats instance) => <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'new': instance.newUser,
    };
