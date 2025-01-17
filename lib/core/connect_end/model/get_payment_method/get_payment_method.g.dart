// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPaymentMethod _$GetPaymentMethodFromJson(Map<String, dynamic> json) =>
    GetPaymentMethod(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetPaymentMethodToJson(GetPaymentMethod instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
