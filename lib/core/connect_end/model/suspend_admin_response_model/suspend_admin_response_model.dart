import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'suspend_admin_response_model.g.dart';

@JsonSerializable()
class SuspendAdminResponseModel {
  String? status;
  Data? data;
  String? message;

  SuspendAdminResponseModel({this.status, this.data, this.message});

  factory SuspendAdminResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SuspendAdminResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuspendAdminResponseModelToJson(this);
}
