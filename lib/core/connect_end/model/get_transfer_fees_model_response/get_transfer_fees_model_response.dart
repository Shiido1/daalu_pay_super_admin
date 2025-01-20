import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'get_transfer_fees_model_response.g.dart';

@JsonSerializable()
class GetTransferFeesModelResponse {
  bool? status;
  List<Datum>? data;
  String? message;

  GetTransferFeesModelResponse({this.status, this.data, this.message});

  factory GetTransferFeesModelResponse.fromJson(Map<String, dynamic> json) {
    return _$GetTransferFeesModelResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetTransferFeesModelResponseToJson(this);
}
