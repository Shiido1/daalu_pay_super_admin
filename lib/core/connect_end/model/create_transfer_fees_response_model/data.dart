import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? currencyCode;
  dynamic fee;
  DateTime? createdAt;
  DateTime? updatedAt;

  Data({
    this.id,
    this.currencyCode,
    this.fee,
    this.createdAt,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
