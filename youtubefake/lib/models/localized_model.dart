import 'package:json_annotation/json_annotation.dart';

part 'localized_model.g.dart';

@JsonSerializable()
class LocalizedModel {
  LocalizedModel({
    required this.title,
    required this.description,
  });

  String title;
  String description;

  factory LocalizedModel.fromJson(Map<String, dynamic> json) =>
      _$LocalizedModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocalizedModelToJson(this);
}
