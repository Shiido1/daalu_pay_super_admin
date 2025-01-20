// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_transfer_fees_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTransferFeesResponseModel _$CreateTransferFeesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateTransferFeesResponseModel(
      status: json['status'] as bool?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateTransferFeesResponseModelToJson(
        CreateTransferFeesResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
