import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_currencies_response_model.g.dart';

@JsonSerializable()
class GetCurrenciesResponseModel {
  String? status;
  List<Datum>? data;
  String? message;

  GetCurrenciesResponseModel({this.status, this.data, this.message});

  factory GetCurrenciesResponseModel.fromJson(Map<String, dynamic> json) {
    return _$GetCurrenciesResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetCurrenciesResponseModelToJson(this);
}
