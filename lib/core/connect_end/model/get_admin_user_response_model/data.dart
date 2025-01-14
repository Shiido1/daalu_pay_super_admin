import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'link.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
	int? currentPage;
	List<Datum>? data;
	String? firstPageUrl;
	int? from;
	int? lastPage;
	String? lastPageUrl;
	List<Link>? links;
	dynamic nextPageUrl;
	String? path;
	int? perPage;
	dynamic prevPageUrl;
	int? to;
	int? total;

	Data({
		this.currentPage, 
		this.data, 
		this.firstPageUrl, 
		this.from, 
		this.lastPage, 
		this.lastPageUrl, 
		this.links, 
		this.nextPageUrl, 
		this.path, 
		this.perPage, 
		this.prevPageUrl, 
		this.to, 
		this.total, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

	Map<String, dynamic> toJson() => _$DataToJson(this);
}
