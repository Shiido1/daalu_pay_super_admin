import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'create_transfer_fees_response_model.g.dart';

@JsonSerializable()
class CreateTransferFeesResponseModel {
  bool? status;
  Data? data;
  String? message;

  CreateTransferFeesResponseModel({this.status, this.data, this.message});

  factory CreateTransferFeesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$CreateTransferFeesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateTransferFeesResponseModelToJson(this);
  }
}
