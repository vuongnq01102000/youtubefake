import 'package:youtubefake/models/content_details_model.dart';
import 'package:youtubefake/models/snippet_model.dart';
import 'package:youtubefake/models/statistics_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  ItemModel({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.contentDetails,
    required this.statistics,
  });

  String? kind;
  String? etag;
  String? id;
  SnippetModel snippet;
  ContentDetails? contentDetails;
  StatisticsModel? statistics;

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
