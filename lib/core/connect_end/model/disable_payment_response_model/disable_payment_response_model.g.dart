// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'disable_payment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DisablePaymentResponseModel _$DisablePaymentResponseModelFromJson(
        Map<String, dynamic> json) =>
    DisablePaymentResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DisablePaymentResponseModelToJson(
        DisablePaymentResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
