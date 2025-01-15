// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as num?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      exchangeRate: json['exchangeRate'] as num?,
      status: json['status'] as String?,
      countryId: json['countryId'] as num?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'exchangeRate': instance.exchangeRate,
      'status': instance.status,
      'countryId': instance.countryId,
    };
