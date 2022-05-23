import 'package:youtubefake/models/localized_model.dart';
import 'package:youtubefake/models/thumbnails_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'snippet_model.g.dart';

@JsonSerializable()
class SnippetModel {
  SnippetModel({
    required this.title,
    required this.description,
    required this.publishedAt,
    required this.thumbnails,
    required this.localized,
    required this.country,
  });

  String title;
  String description;
  DateTime publishedAt;
  ThumbnailsModel thumbnails;
  LocalizedModel localized;
  String country;

  factory SnippetModel.fromJson(Map<String, dynamic> json) =>
      _$SnippetModelFromJson(json);

  Map<String, dynamic> toJson() => _$SnippetModelToJson(this);
}
