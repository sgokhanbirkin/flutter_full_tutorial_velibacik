import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

@JsonSerializable(
  createToJson: false,
)
class ResourceModel {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<Data>? data;
  final Support? support;

  ResourceModel({this.page, this.perPage, this.total, this.totalPages, this.data, this.support});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  // Map<String, dynamic> toJson() {
  //   return _$ResourceModelToJson(this);
  // }
}

@JsonSerializable()
class Data {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  final String? pantoneValue;
  final StatusCode? status;

  Data({this.id, this.name, this.year, this.color, this.pantoneValue, this.status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}

@JsonSerializable()
class Support {
  final String? url;
  final String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return _$SupportFromJson(json);
  }
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weired,
}
