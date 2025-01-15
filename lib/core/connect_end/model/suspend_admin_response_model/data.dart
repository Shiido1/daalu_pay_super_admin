import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  num? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? role;
  String? status;
  num? transactionsAssigned;
  dynamic deletedAt;

  Data({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.status,
    this.transactionsAssigned,
    this.deletedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
