import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? firstName;
  String? lastName;
  String? email;
  String? status;
  String? uuid;
  num? id;

  Data({
    this.firstName,
    this.lastName,
    this.email,
    this.status,
    this.uuid,
    this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
