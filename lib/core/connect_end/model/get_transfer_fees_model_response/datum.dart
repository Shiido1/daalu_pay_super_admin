import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  String? currencyCode;
  String? fee;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? currency;

  Datum({
    this.id,
    this.currencyCode,
    this.fee,
    this.createdAt,
    this.updatedAt,
    this.currency,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
