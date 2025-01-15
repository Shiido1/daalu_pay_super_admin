// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspend_admin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuspendAdminResponseModel _$SuspendAdminResponseModelFromJson(
        Map<String, dynamic> json) =>
    SuspendAdminResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SuspendAdminResponseModelToJson(
        SuspendAdminResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
