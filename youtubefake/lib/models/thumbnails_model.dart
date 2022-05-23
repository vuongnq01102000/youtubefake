import 'package:json_annotation/json_annotation.dart';
import 'package:youtubefake/models/default_model.dart';

part 'thumbnails_model.g.dart';

@JsonSerializable()
class ThumbnailsModel {
  ThumbnailsModel({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  DefaultModel? thumbnailsDefault;
  DefaultModel? medium;
  DefaultModel? high;

  factory ThumbnailsModel.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsModelToJson(this);
}
