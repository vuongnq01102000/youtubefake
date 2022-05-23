import 'package:json_annotation/json_annotation.dart';

part 'default_model.g.dart';

@JsonSerializable()
class DefaultModel {
  DefaultModel({
    required this.url,
    required this.width,
    required this.height,
  });

  String url;
  int width;
  int height;

  factory DefaultModel.fromJson(Map<String, dynamic> json) =>
      _$DefaultModelFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultModelToJson(this);
}
