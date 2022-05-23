import 'package:json_annotation/json_annotation.dart';

part 'related_playlists_model.g.dart';

@JsonSerializable()
class RelatedPlaylistsModel {
  RelatedPlaylistsModel({
    required this.likes,
    required this.uploads,
  });

  String likes;
  String uploads;

  factory RelatedPlaylistsModel.fromJson(Map<String, dynamic> json) =>
      _$RelatedPlaylistsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RelatedPlaylistsModelToJson(this);
}
