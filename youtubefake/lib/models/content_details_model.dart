import 'package:youtubefake/models/related_playlists_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'content_details_model.g.dart';

@JsonSerializable()
class ContentDetails {
  ContentDetails(
    this.relatedPlaylists,
  );

  RelatedPlaylistsModel relatedPlaylists;

  factory ContentDetails.fromJson(Map<String, dynamic> json) =>
      _$ContentDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ContentDetailsToJson(this);
}
