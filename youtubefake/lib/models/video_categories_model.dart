import 'package:youtubefake/models/item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'video_categories_model.g.dart';

@JsonSerializable()
class VideoCategoriesModel {
  VideoCategoriesModel({
    this.kind,
    this.etag,
    required this.items,
  });

  String? kind;
  String? etag;
  List<ItemModel> items;

  factory VideoCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoCategoriesModelToJson(this);
}
