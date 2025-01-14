// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: (json['id'] as num?)?.toInt(),
      uuid: json['uuid'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      status: json['status'] as String?,
      transactionsAssigned: (json['transactionsAssigned'] as num?)?.toInt(),
      deletedAt: json['deletedAt'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'status': instance.status,
      'transactionsAssigned': instance.transactionsAssigned,
      'deletedAt': instance.deletedAt,
    };
