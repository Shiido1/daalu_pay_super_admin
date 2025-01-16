import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_admin_response_model.g.dart';

@JsonSerializable()
class CreateAdminResponseModel {
  String? status;
  Data? data;
  String? message;

  CreateAdminResponseModel({this.status, this.data, this.message});

  factory CreateAdminResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CreateAdminResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreateAdminResponseModelToJson(this);
}
