// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as num?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      exchangeRate: json['exchangeRate'] as num?,
      status: json['status'] as String?,
      countryId: json['countryId'] as num?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'exchangeRate': instance.exchangeRate,
      'status': instance.status,
      'countryId': instance.countryId,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
