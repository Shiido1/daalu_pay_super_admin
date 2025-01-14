// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_admin_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAdminUserResponseModel _$GetAdminUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetAdminUserResponseModel(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetAdminUserResponseModelToJson(
        GetAdminUserResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };
