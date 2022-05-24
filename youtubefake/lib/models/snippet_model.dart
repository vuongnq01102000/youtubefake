import 'package:youtubefake/models/localized_model.dart';
import 'package:youtubefake/models/thumbnails_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'snippet_model.g.dart';

@JsonSerializable()
class SnippetModel {
  SnippetModel({
    this.title,
    this.description,
    this.publishedAt,
    this.assignable = false,
    this.channelId,
    required this.thumbnails,
    this.localized,
    this.country = 'vn',
  });

  String? title;
  String? description;
  String? channelId;
  DateTime? publishedAt;
  bool? assignable;
  ThumbnailsModel? thumbnails;
  LocalizedModel? localized;
  String? country;

  factory SnippetModel.fromJson(Map<String, dynamic> json) =>
      _$SnippetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetModelToJson(this);
}
