import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_exchange_rates.g.dart';

@JsonSerializable()
class GetExchangeRates {
  bool? status;
  List<Datum>? data;
  String? message;

  GetExchangeRates({this.status, this.data, this.message});

  factory GetExchangeRates.fromJson(Map<String, dynamic> json) {
    return _$GetExchangeRatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetExchangeRatesToJson(this);
}
