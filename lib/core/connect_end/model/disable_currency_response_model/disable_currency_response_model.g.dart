// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disable_currency_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisableCurrencyResponseModel _$DisableCurrencyResponseModelFromJson(
        Map<String, dynamic> json) =>
    DisableCurrencyResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DisableCurrencyResponseModelToJson(
        DisableCurrencyResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
