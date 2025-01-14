// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['firstPageUrl'] as String?,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['lastPage'] as num?)?.toInt(),
      lastPageUrl: json['lastPageUrl'] as String?,
      links: (json['links'] as List<dynamic>?)
          ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['nextPageUrl'],
      path: json['path'] as String?,
      perPage: (json['perPage'] as num?)?.toInt(),
      prevPageUrl: json['prevPageUrl'],
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'currentPage': instance.currentPage,
      'data': instance.data,
      'firstPageUrl': instance.firstPageUrl,
      'from': instance.from,
      'lastPage': instance.lastPage,
      'lastPageUrl': instance.lastPageUrl,
      'links': instance.links,
      'nextPageUrl': instance.nextPageUrl,
      'path': instance.path,
      'perPage': instance.perPage,
      'prevPageUrl': instance.prevPageUrl,
      'to': instance.to,
      'total': instance.total,
    };
