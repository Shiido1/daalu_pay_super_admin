// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_statistis_response_modell.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStatistisResponseModell _$GetStatistisResponseModellFromJson(
        Map<String, dynamic> json) =>
    GetStatistisResponseModell(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetStatistisResponseModellToJson(
        GetStatistisResponseModell instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
