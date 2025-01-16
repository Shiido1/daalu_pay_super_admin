import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'disable_currency_response_model.g.dart';

@JsonSerializable()
class DisableCurrencyResponseModel {
  String? status;
  Data? data;
  String? message;

  DisableCurrencyResponseModel({this.status, this.data, this.message});

  factory DisableCurrencyResponseModel.fromJson(Map<String, dynamic> json) {
    return _$DisableCurrencyResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DisableCurrencyResponseModelToJson(this);
}
