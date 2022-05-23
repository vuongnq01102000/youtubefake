import 'package:youtubefake/models/item_model.dart';
import 'package:youtubefake/models/page_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'channel_model.g.dart';

// ChannelModel channelModelFromJson(String str) =>
//     ChannelModel.fromJson(json.decode(str));

// String channelModelToJson(ChannelModel data) => json.encode(data.toJson());

@JsonSerializable()
class ChannelModel {
  ChannelModel({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

  String kind;
  String etag;
  PageInfoModel pageInfo;
  List<ItemModel> items;

  factory ChannelModel.fromJson(Map<String, dynamic> json) =>
      _$ChannelModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelModelToJson(this);
}
