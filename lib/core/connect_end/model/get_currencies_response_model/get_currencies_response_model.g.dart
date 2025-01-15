// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_currencies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrenciesResponseModel _$GetCurrenciesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCurrenciesResponseModel(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetCurrenciesResponseModelToJson(
        GetCurrenciesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
