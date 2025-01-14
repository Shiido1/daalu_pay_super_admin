import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? uuid;
	String? firstName;
	String? lastName;
	String? email;
	String? phone;
	String? role;
	String? status;
	int? transactionsAssigned;
	dynamic deletedAt;

	Datum({
		this.id, 
		this.uuid, 
		this.firstName, 
		this.lastName, 
		this.email, 
		this.phone, 
		this.role, 
		this.status, 
		this.transactionsAssigned, 
		this.deletedAt, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
