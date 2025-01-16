// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      status: json['status'] as String?,
      uuid: json['uuid'] as String?,
      id: json['id'] as num?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'status': instance.status,
      'uuid': instance.uuid,
      'id': instance.id,
    };
