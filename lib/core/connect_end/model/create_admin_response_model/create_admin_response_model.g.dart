// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_admin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAdminResponseModel _$CreateAdminResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateAdminResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateAdminResponseModelToJson(
        CreateAdminResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
