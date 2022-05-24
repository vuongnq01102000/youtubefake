import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/models/page_info_model.dart';

import 'package:json_annotation/json_annotation.dart';

part 'playlist_items_model.g.dart';

@JsonSerializable()
class PlayListItemsModel {
  PlayListItemsModel({
    this.kind,
    this.etag,
    this.nextPageToken,
    required this.items,
    required this.pageInfo,
  });

  String? kind;
  String? etag;
  String? nextPageToken;
  List<ItemModel> items;
  PageInfoModel pageInfo;

  factory PlayListItemsModel.fromJson(Map<String, dynamic> json) =>
      _$PlayListItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$PlayListItemsModelToJson(this);
}
