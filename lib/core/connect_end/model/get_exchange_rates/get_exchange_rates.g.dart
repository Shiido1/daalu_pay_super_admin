// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_exchange_rates.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetExchangeRates _$GetExchangeRatesFromJson(Map<String, dynamic> json) =>
    GetExchangeRates(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetExchangeRatesToJson(GetExchangeRates instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
