import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'disable_payment_response_model.g.dart';

@JsonSerializable()
class DisablePaymentResponseModel {
  String? status;
  Data? data;
  String? message;

  DisablePaymentResponseModel({this.status, this.data, this.message});

  factory DisablePaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DisablePaymentResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DisablePaymentResponseModelToJson(this);
}
