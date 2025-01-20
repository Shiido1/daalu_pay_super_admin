// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_transfer_fees_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTransferFeesModelResponse _$GetTransferFeesModelResponseFromJson(
        Map<String, dynamic> json) =>
    GetTransferFeesModelResponse(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetTransferFeesModelResponseToJson(
        GetTransferFeesModelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
