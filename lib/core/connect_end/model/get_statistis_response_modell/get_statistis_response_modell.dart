import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'get_statistis_response_modell.g.dart';

@JsonSerializable()
class GetStatistisResponseModell {
  bool? status;
  Data? data;
  String? message;

  GetStatistisResponseModell({this.status, this.data, this.message});

  factory GetStatistisResponseModell.fromJson(Map<String, dynamic> json) {
    return _$GetStatistisResponseModellFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetStatistisResponseModellToJson(this);
}
