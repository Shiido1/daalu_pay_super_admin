import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_payment_method.g.dart';

@JsonSerializable()
class GetPaymentMethod {
  bool? status;
  List<Datum>? data;
  String? message;

  GetPaymentMethod({this.status, this.data, this.message});

  factory GetPaymentMethod.fromJson(Map<String, dynamic> json) {
    return _$GetPaymentMethodFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPaymentMethodToJson(this);
}
