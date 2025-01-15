import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_admin_user_response_model.g.dart';

@JsonSerializable()
class GetAdminUserResponseModel {
  String? status;
  Data? data;
  String? message;

  GetAdminUserResponseModel({this.status, this.data, this.message});

  factory GetAdminUserResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetAdminUserResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAdminUserResponseModelToJson(this);
}
