import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? name;
  String? code;
  num? exchangeRate;
  String? status;
  num? countryId;
  DateTime? updatedAt;

  Data({
    this.id,
    this.name,
    this.code,
    this.exchangeRate,
    this.status,
    this.countryId,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
