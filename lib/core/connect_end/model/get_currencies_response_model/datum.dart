import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
  num? id;
  String? name;
  String? code;
  num? exchangeRate;
  String? status;
  num? countryId;

  Datum({
    this.id,
    this.name,
    this.code,
    this.exchangeRate,
    this.status,
    this.countryId,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

  Map<String, dynamic> toJson() => _$DatumToJson(this);
}
