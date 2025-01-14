import 'package:json_annotation/json_annotation.dart';

part 'user_stats.g.dart';

@JsonSerializable()
class UserStats {
	int? total;
	int? active;
	int? newUser;

	UserStats({this.total, this.active, this.newUser});

	factory UserStats.fromJson(Map<String, dynamic> json) {
		return _$UserStatsFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UserStatsToJson(this);
}
